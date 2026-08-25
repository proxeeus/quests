# chardok — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `#Historian_Silren_Di-zok.pl` — disabled (leading `#`); no ref emote data; left untouched.
- `#Tani_Cogswin.pl` — disabled (leading `#`); no ref emote data; left untouched.
- `103120_an_off_duty_Pitboss.txt` and `103250_an_off_duty_Pitboss.txt` — two NPCIDs share the identical NPC name "an_off_duty_Pitboss" and identical emote content (EC "swings at you with incredible speed!" + AD "curses you as it falls dead."). Single name-based `an_off_duty_Pitboss.lua` created; covers both spawns.
- `Ancient_Guardian.lua` (npcid 103089), `an_Ancient_Guardian.lua` (npcid 103129) — two distinct NPC names ("Ancient Guardian" vs "an Ancient Guardian"), both real. Both files created independently.
