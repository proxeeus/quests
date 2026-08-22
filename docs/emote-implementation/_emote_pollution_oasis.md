# oasis — emote review

## Skipped as suspected ref pollution
- (none) — kept dry_bones_skeleton's `"Areeeeewwwww!"` (Enter Combat, peq) despite the line being the classic spectre moan and skeletons being fleshless. It reads as a generic undead groan and matches the sound file spectres use, so included per "default include" policy. Flag for later if lore-strict pass is desired.

## Duplicate/orphan quest files noticed
- Alkabor dump lists `37163_a_Dervish_Cutthroat.txt` and `37164_a_Dervish_Cutthroat.txt` whose payload is the orc-warrior line `"Orc stomp, orc kill - orc weapons, your blood will spill."` / `"Argh! Clan Deathfist will spill blood for my death!"`. Almost certainly a dumper misfiling: the NPCID range 37163-37164 sits inside the run of Dervish Cutthroat variants (37158-37164) but the payload matches an_orc_warrior verbatim. Merged by NAME per spec — Cutthroat lua keeps the Cutthroat-appropriate `"Time to die $name."` + `"My comrades will avenge my death."` from the other 6 Cutthroat variants (37145/37158-37162) and Alkabor's 37044 Dervish_Thug. Orc line dropped from Cutthroat.
- peq lists 8 `a_desert_madman` NPCIDs (37005/37007/37010/37024/37038/37125/37142/37166/37167/37168), 4 `an_orc_warrior` (37014/37017/37018/37026/37032/37035), 4 `a_spectre` (37019/37020/37021/37039/37111), 3 `dry_bones_skeleton` (37013/37016/37039_spectre), 3 `an_orc_priest` (37015/37040/37069). All redundant per name-merge. p2002 > Alkabor > peq priority applied; the shared enter-combat lines are identical across sources so priority didn't change output.
- Pre-existing quest files with no ref-emote data (`#Boat_Controller.pl`, `#Translocator_Tradil.pl`, `#ZonerToTimorous.pl`, `Barrel_Barge.pl`, `Taldrik_Stumpystout.pl`) left untouched.

## Event-timing / merge notes
- an_orc_warrior: existing lua had generic Dervish-style `event_death_complete` (`"My comrades will avenge my death."`). Refs unambiguously say orc after-death is `"Argh! Clan Deathfist will spill blood for my death!"` — replaced (Clan Deathfist is orc-clan-specific and matches the enter-combat line's flavour).
- a_Dervish_Thug: existing lua only had Enter Combat + After Death. Ref adds Leave Combat `"Your actions and history are a personal affront to all I stand for!"` — patched into `event_combat` via `elseif not e.joined` (standard Leave-Combat mapping used by gfaydark/Guard_Fayfield etc.).
- a_desert_madman + a_Dervish_Cutthroat: existing lua already contains the ref lines (merged into ChooseRandom for madman and covered by `Time to die %s.` for Cutthroat). No refs specify after-death for madman; existing generic `"My comrades will avenge my death."` retained (harmless flavor, "desert madman" isolated dervish outcast could plausibly reference dervish comrades). No change.
- an_orc_priest: no existing handler; created with same Enter Combat / After Death pair as an_orc_warrior since ref payload is identical.
- a_spectre, dry_bones_skeleton: no existing handlers; created minimal `event_combat` Enter-Combat only per refs.
