# swampofnohope — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `Crusader_Savot.lua` (83058), `Crusader_Litia.lua` (83059) — existing lua already implements the full Crusader of Greenmist Enter Combat + After Death pair; no changes required (ref matched line-for-line).
- `Trooper_Fodcod.pl` (83061), `Trooper_Inkin.pl` (83063), `Trooper_Harkee.pl` (83065), `Trooper_Lorgen.pl` (83066) — existing perl handlers already implement the Legion of Cabilis trooper set (EVENT_COMBAT + EVENT_DEATH_COMPLETE + EVENT_SLAY); ref lines match, no patch needed. Kept perl per the never-shadow-.pl-with-.lua rule.
- `Trooper_Nilzik.lua` (83062), `Trooper_Keat.lua` (83064) — existing lua already implements the Legion of Cabilis trooper set; ref matched, no changes required.
- `Kaggy_Krup` (83073) — no existing quest file; created `Kaggy_Krup.lua` with the single After Death emote ("Froooooaa...my neckla...froooaa..."). Death gurgle ties to Dugroz's "necklace of power" hail thread — lore-consistent with the escaped-slave Krup froglok arc, kept as canonical.
