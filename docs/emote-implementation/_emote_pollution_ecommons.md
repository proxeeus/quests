# ecommons — emote review

## Skipped as suspected ref pollution
- A_Shady_Swashbuckler: `"My comrades will avenge my death."` (After Death) — generic Freeport Militia guard line; shady swashbucklers are solo bandits/rogues with no militia comrades. Kept only the "Natural selection at work." combat line.

## Duplicate/orphan quest files noticed
- Multiple existing NPC quests (Altunic_Jartin.pl, Bubar.pl, Kayci_Strahtin.pl, Lord_Shin_Ree.lua, Loric_Weaver.pl, Merra_Clayfinger.pl, Soulbinder_Jubbl.pl, Squire_Narl.lua, a_darkweed_snake.lua, a_giant_rattlesnake.lua, a_large_rattlesnake.lua, a_rattlesnake.lua) have no matching ref-emote dump — pre-existing quest content, left untouched.
- Ref dirs list many redundant NPCID variants for the same NPC name (e.g. peq has 22049/22151/22167 all `High_Chief_Diedridans`, 22052/22143/22179 all `orc_oracle`, 22053/22055/22022 all `orc_centurion`, 22131/22159 both `Guard_Deisnak`). Merged by name per spec (priority: p2002 > Alkabor > peq > neq), lower-priority dupes ignored.
- orc_weaponsmith / orc_legionnaire ref specify `On Death` (event_death) but existing quest files already fire the same "Aaarrghh!! The Deathfist..." line via `event_death_complete` (After Death). Slight event-timing mismatch, but line content is identical — left existing handler in place to avoid double-speech regression per "never remove existing" rule.
