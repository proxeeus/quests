# cazicthule — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `a_Thul_Tae_Ew_bloodcaller.pl` — existed with only a 50% respawn hook in EVENT_DEATH; patched in-place with combat/death-complete emotes. Kept perl per rules (no .lua present pre-run).
- `Gimlik_Cogboggle.pl` — existed with EVENT_SAY/ITEM/WAYPOINT/TIMER/SIGNAL; patched with EVENT_COMBAT for the single "Ouch... ouch... ouch!" Say line.
- `#a_swirling_ooze.pl` (npc 48425) and new `a_swirling_ooze.lua` (npc 48041) coexist — different NPCs distinguished by leading `#` in NPC name; not a conflict.
- Ref file `48099_a_Thul_Tae_Ew_Warder.txt` uses capital `W`, differing from the more common `a_Thul_Tae_Ew_warder` naming across other zones — created the `.lua` with the exact ref-file casing.
