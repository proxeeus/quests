# neriakc — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `Torxal_Smalane.lua` — no ref emote data for this NPC in any priority dir; left untouched.
- `#Gribnor_the_Small.pl` and `#a_spectral_shimmer.pl` — `#`-prefixed disabled files; no ref emote data; left untouched.
- Ratraz.pl trailer comment reads `ID:42053` but ref confirms this NPC is 42002 Ratraz; comment is stale, filename/content match ref — patched in place. Same stale-trailer situation for Molon_T-Plth.pl (trailer says 42040, ref confirms 42097).
- 42019 High_Priestess_Alexandria — Alkabor ref supplies generic "That was not a very intelligent thing to do." / "My comrades will avenge my death." lines. Content plausibly fits a Neriak dark-elf combatant priestess; included per default-include lore judgment.
- Similar surname NPCs are separate spawns with distinct npcids: Tolax (Yaz_Tolax 42015 vs existing Nezzka_Tolax.pl), Punox (Kszan_Punox 42006 vs existing Pazin_Punox.pl), Zexus (Jsvan_Zexus 42084 vs existing Perrir_Zexus.pl), Din`a (Guard_Din`a 42100 vs existing Tralon_Din-a.pl), S`Lon (Vivish_S`Lon 42103 vs existing Ulraz_S-Lon.pl), L`Crit (Guard_L`Crit 42110 vs existing Selzar_L-Crit.pl), Y`Lask (Guard_V`Lask 42094 uses V not Y and is distinct from existing Medron_Y-Lask.pl). All handled as independent NPCs — new .lua files created for each ref entry.
- 42050 Dizra_To`Biath and 42106 Lokar_To`Biath share the "Dark Bargainer" rally set — both handled independently (Lokar patched, Dizra created).
