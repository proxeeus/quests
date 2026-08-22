# blackburrow — emote review

## Skipped as suspected ref pollution
- Lord_Elgnub (17029): `Emote -- On Despawn: burrows through a small hole in the wall, then vanishes.` — no On Despawn event mapping in spec; skipped.

## Duplicate/orphan quest files noticed
- Ref `17003_#a_gnoll.txt` — `#`-prefixed alias of NPC 17008 `a_gnoll`; same "trespassed" line; no separate quest file needed.
- Ref `17111_a_gnoll_guardsman.txt` — duplicate NPCID variant of 17016 `a_gnoll_guardsman`; same content; single `a_gnoll_guardsman.lua` covers both.
- Ref `17112_#an_elite_gnoll_guard.txt` — `#`-prefixed alias of 17022 `an_elite_gnoll_guard`; same content; single `an_elite_gnoll_guard.lua` covers both.
- Existing `Lord_Elgnub.lua` previously contained the "You'll not get him! / baby's cry" line — that line is actually the 17030 `a_gnoll_courier` ref content, not Elgnub's. Preserved per no-remove rule; new Elgnub-specific lines added alongside.
- Existing `Master_Brewer.lua` previously contained the "No get.. stout!!" line — that line is 17015 `a_scrawny_gnoll` ref content, not Master Brewer's. Preserved per no-remove rule; canonical trespassed line added alongside.
- `a_giant_snake.lua` exists in quests but no ref entry across any priority dir; left untouched.
