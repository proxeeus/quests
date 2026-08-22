# Misty Thicket (misty) — Emote Pollution Log

Zone: Misty Thicket (halfling forest home outside Rivervale — halflings, bandits, brownies/fairies, thorn drakelings; Runnyeye goblins to the north, occasional Deathfist orc raiders).

## Skipped (clearly-wrong / questionable)

### 33160 a_mangy_rat (peq)
- Line: `Say -- Enter Combat: Hiss.  SNAP.  SNAP.  Hissssss.`
- Reason: Snake-style hiss/snap dialogue on a **rat**. Rats don't hiss/snap. Line clearly belongs to a snake mob (matches sibling `a_moss_snake` / `a_tree_snake` emote flavor). Peq-only, no p2002/Alkabor confirmation. Skipped.

### 33104 Mooto (Alkabor)
- Line: `Say -- Enter Combat: Ugly creature near my feet, me thinks that you'll be good to eat!` + `Say -- After Death: I wiggled my fingers and waved my hands.  But there is no glory in failed last stands!`
- Reason: These are the generic goblin-warrior lines used across all Misty goblin mobs (worker/warrior/whelp/alchemist/shaman). "Mooto" reads as a named halfling / non-goblin NPC (no `orc_`, `a_goblin_` prefix). The self-referential "ugly creature near my feet" line is race-specific goblin flavor. Alkabor-only, no p2002 confirmation. Skipped as likely mis-attributed dump artifact.

## Included with caveats

### Orc pawn/centurion/oracle/apprentice (33034/33037/33064/33113)
Deathfist Clan lines ("For the glory of the Deathfist Magistrate...") appear in misty ref dumps. Misty is a halfling zone but Deathfist orcs are lore-plausible raiders from Ro; included per default-include rule. Alkabor source.

## Notes

- Priority per rule: p2002 > Alkabor > peq > neq. neq entries for 33065/33066/33235 exactly matched p2002 (no additional lines to merge).
- `a_bixie.pl` (33002/33099/33233), `a_bixie_drone.pl` (33019), `a_bixie_queen.pl` (33149) already contained the `zzzzzzztone hivvvvvvvvv` line in `EVENT_AGGRO`. No changes needed.
- The unlabeled "For the glory of the Deathfist..." line on orc mobs was mapped to `event_slay` per the ref-format rule ("monologue -> event_slay").
