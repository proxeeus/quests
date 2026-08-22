# sro — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- Multiple Alkabor `a_Dervish_Cutthroat` spawn IDs (35009, 35136, 35164-35170) share the same two lines ("Time to die $name." / "My comrades will avenge my death."). Existing `a_Dervish_Cutthroat.lua` already covers both via a race-aware ChooseRandom (including a "Time to die %s" variant) and event_death_complete. No per-ID split needed.
- Multiple `a_desert_madman` IDs (35004, 35163, 35172, 35173) all carry the same single Enter Combat line ("Damn my eyes! You're just another mirage!"). Existing `a_desert_madman.lua` already contains this exact line in its ChooseRandom set.
- `an_orc_warrior` (35007, 35043) and `an_orc_cleric` (35008) all use the same orc lore lines already present in `an_orc_warrior.lua` / `an_orc_cleric.lua`.
- `an_orc_centurion` (35052) — existing `an_orc_centurion.lua` already covers Enter Combat and After Death. The third "For the glory of the Deathfist Magistrate..." line has no explicit trigger tag in the ref (`Say -- :`) and no obvious event hook; skipped.

## Fixes / additions
- `Sandgiant_Husam.lua` — rewrote existing file: it had a scoping bug (`s.self:Say(...)` referencing undefined `s`) and pulled `racesplural` with a stray race-based line that always errored. Replaced with a clean `event_combat` gated on `e.joined` that emits the canonical Verant line ("Leave my lands or die!! So says Husam the Great!!"). No other events found in ref.
- `an_ancient_cyclops.pl` — NEW. After-death "Aaarrghh! My precious ring!" only (matches `oot/an_ancient_cyclops.pl` twin exactly).
- `Erg_Bluntbruiser.pl` — NEW. Deathfist orc lore (Enter Combat + After Death). Chose .pl over .lua for consistency with named-NPC orcs in this codebase and to avoid future shadowing risk.

## Notes
- All ref lines mapped 1:1 to existing behavior; no lore judgment calls needed (all content is desert/orc/cyclops appropriate for sro).
