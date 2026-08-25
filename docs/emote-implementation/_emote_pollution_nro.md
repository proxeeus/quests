# nro — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- Alkabor refs 34150/34151 are labeled `a_Dervish_Cutthroat` but their emote content is orc lore (`Orc stomp, orc kill - orc weapons, your blood will spill.` + `Argh! Clan Deathfist will spill blood for my death!`). Likely those spawn IDs were orc warriors in Alkabor's snapshot but named differently. Content is already covered by the existing `an_orc_warrior.lua` (identical lines), so no new file added.
- `Dorn_B-Dynn.pl` — .pl already existed for Marda's Secret Mission quest dialogue; per rule (never shadow .pl with .lua) the Enter Combat / After Death lines from the p2002 ref were patched into the existing perl file (EVENT_COMBAT + EVENT_DEATH_COMPLETE), not into a new .lua.

## Notes
- Guard_Brendyl/Fintran/Stoutman/a_moss_snake/a_madman/a_desert_madman/a_Dervish_Thug/a_Dervish_Cutthroat/an_orc_warrior/a_rattlesnake/a_large_rattlesnake — existing .lua handlers already contain the exact ref lines (or a superset). No edits needed.
