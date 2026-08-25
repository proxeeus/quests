# greatdivide — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `#Fergul_Frostsky.lua` — hidden `#`-prefixed handler (contains active `event_signal` depop logic for the Blood Wolf Harness quest chain). No canonical `Fergul_Frostsky.lua` existed. Created canonical `Fergul_Frostsky.lua` with the ref combat line only; left the `#`-prefixed variant untouched so the existing signal wiring stays intact.
- `#Gralk_Dwarfkiller.lua` — hidden `#`-prefixed handler (contains active `event_trade` for Harness of Control + waypoint/proximity logic). No canonical `Gralk_Dwarfkiller.lua` existed. Created canonical `Gralk_Dwarfkiller.lua` with the ref combat line only; `#`-prefixed variant untouched.
- `#Murdrick_Tardok.lua` + `##Murdrick_Tardok.lua` — two hidden variants for the Berradin conspiracy cutscene NPC (118061 spawner) and its combat-trigger helper. No ref emote data for 118061 (illusion NPC), no changes made.
- `#an_angry_shardwurm.pl` — hidden `#`-prefixed helper (spawns and attacks on spawn); this NPC ID (118164) has no ref-emote data; no changes made.
- `#dialogue.lua` — helper conversation script, not a real NPC handler; no changes.
- Ref dumps use `#`-prefixed filenames for `#Gorul_Longshanks` (118117), `#Icetooth` (118119), `#Drakkel_Blood_Wolf` (118122) — these appear to be peq/Alkabor DB conventions where the NPC display name literally starts with `#`. Created canonical files without the `#` prefix (`Gorul_Longshanks.lua`, `Icetooth.lua`, `Drakkel_Blood_Wolf.lua`) using standard TitleCase naming.
- `Davin_Fatfist.lua`, `Gerton_Dumkin.lua`, `Lapker_Geynion.lua` — pre-existing handlers for Murdrick's Coldain traitor conspirators contain only `event_signal`/`event_timer` for the conspiracy cutscene. Ref combat line ("Death to the trespasser!") added as new `event_combat` handler; existing signal wiring preserved verbatim.
- `Vores_the_Hunter.lua` — pre-existing `event_say` (Blood Wolf Harness quest hail chain) and `event_trade` preserved verbatim. Ref combat line ("For the glory of Thurgadin!") added as new `event_combat` handler.
- `shardwurm_broodmother.lua` — pre-existing `event_trade` (Harness of Control turn-in) and `event_waypoint_arrive` preserved verbatim. Ref combat line added as new `event_combat` handler.
- Ref data across all 4 dirs is heavily duplicated (same line repeated dozens-to-hundreds of times per file). Deduped to a single unique line per NPC per event. All ref lines are lore-appropriate for Great Divide (Coldain dwarves shouting for Thurgadin/Brell, Kromrif giants taunting, wolves howling, cave kodiaks growling, shardwurms roaring, tizmaks calling for help, gnome pirate deserters cursing).
