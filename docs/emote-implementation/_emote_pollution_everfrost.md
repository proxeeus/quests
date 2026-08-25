# everfrost — emote review

## Skipped as suspected ref pollution
- Redwind: `"Orc stomp, orc kill - orc weapons, your blood will spill."` — Redwind is a Wolves of the North barbarian NPC (Halas faction); the Deathfist orc combat line is clearly cross-contaminated from a nearby orc mob dump and does not fit the character.
- Eichvul: `"you dare attack house X'Lottl?! Defend me you worthless, sniveling, wastes of food and space!"` — references House X'Lottl (Innoruuk-worshipping Neriak dark elf house). Wrong zone/lore for an Everfrost NPC; almost certainly pollution captured during another zone's dump.

## Duplicate/orphan quest files noticed
- `4881.pl` and `Talin_O-Donal.lua` — same NPC (Talin O`Donal) at two different NPCIDs (4881 vs 30072/30108); both files handle the same "Brrrrrr" hail. Per priority rules the name-based `.lua` is authoritative and was left untouched (already covers ref). The `4881.pl` file was left as-is (matches ref) but should probably be consolidated in a future cleanup.
