# oggok — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `#Bordag.pl` — disabled (leading `#`); no ref emote data; left untouched.
- peq ref has multiple NPCIDs sharing the same Bouncer names (e.g., Raan at 49014/49018/49101/49104/49113; Wrok at 49017/49106/49116; Skon at 49005/49097/49110; Haraan at 49006/49096/49111/49119; Tazak at 49007/49098/49120; Skuk at 49008/49112/49123; Druk at 49009/49102/49124; Bak at 49002/49100/49122; Thrang at 49001/49099; Praag at 49010/49105; Xak at 49004/49094). All duplicate NPCIDs carry identical emote content. Single name-based `Bouncer_<Name>.lua` covers every spawn per name in-zone.
- Existing `Gronk.pl` is a warrior newbie-armor trainer (different NPC than ref's "Bouncer Gronk", 49000). Ref bouncer handled by new name-based `Bouncer_Gronk.lua`; no conflict since names differ.
- Guntrik ref NPCID (49046) differs from footer NPCID in existing `Guntrik.pl` (49043); name-based handler covers both.

## Notes
- Every Bouncer (15 unique names across p2002/Alkabor/peq/neq refs) shares the identical two-line set: `Enter Combat: "Bouncer smash you!!"` and `Killed PC/NPC: "Ha!! Bouncers best. I am victorioo.. Victer.. I win!!"`. Same lines as feerrott Bouncers — followed the feerrott `Bouncer_*.lua` convention (`event_combat` with `e.joined` guard + `event_slay`).
- `Bouncer_Wrok.lua` pre-existed with correct content but lacked the `e.joined` guard; updated for consistency with sibling files (prevents re-firing on combat exit).
- Guntrik (Alkabor only): unlabeled monologue `"Me strongest.  You weak.  Craknek best alwayss."` — added as `EVENT_SLAY` in existing `Guntrik.pl` per unlabeled-monologue → event_slay rule. Fits lore (Guntrik is the Craknek warrior trainer boasting over a defeated foe).
