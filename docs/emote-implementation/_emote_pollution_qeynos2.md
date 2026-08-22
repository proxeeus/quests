# qeynos2 — emote review

## Skipped as suspected ref pollution
- None. All ref lines are lore-consistent with North Qeynos (Antonius Bayle guards, Silent Fist Clan, Priests of Life/Rodcet, Circle of Unseen Hands, Ironforge merchants, Darkpaw/Sabertooth invaders, Pool of Jahnda Koalindl fish).

## Duplicate/orphan quest files noticed
- Multiple `Fippy_Darkpaw` NPCIDs across refs (2001 peq, 2109 peq, 2119 peq, 2174 p2002) all share the same "trespassed" + On Spawn Shout Sabertooth barking. Single `Fippy_Darkpaw.lua` already covers this. `The_Fabled_Fippy_Darkpaw.lua` (2148 peq) exists and matches ref (has event_spawn SetRunning; combat line not in ref for that ID — left as-is).
- `Djerr_Darkpaw` appears at 2107 (peq) and 2124 (p2002/Alkabor/peq/neq) with identical "trespassed" line; single `Djerr_Darkpaw.lua` covers both.
- `Nixx_Darkpaw` (2127) — p2002 ref includes both combat "trespassed" AND On Spawn Shout barking; existing `Nixx_Darkpaw.lua` only has combat. Left as-is (existing file matches Alkabor/peq/neq subset; adding shout would change spawn behavior — deferred pending decision).
- `Guard_Simkin`, `Guard_Shorm`, `Guard_Ginton` — quest files exist but no ref entries across any priority dir; left untouched.
- Existing `Corporal_Lancot.lua` combat block includes the ref's "Halt!" line as one of several race-based choices; ref-only content already merged.
- `a_gnoll_pup` / `a_gopher_snake` — ref p2002 dumps contain hundreds of identical repeat lines; treated as single line after dedupe.
- `Kane_Bayle`, `Guard_Simkin`, and other faction NPCs present in quests but absent from all four ref dumps — untouched.

## Notes
- Standard guard rally "Time to die $name." + after-death "My comrades will avenge my death." was already implemented across all Guard_* .lua files in this zone via the shared `races_plural` module before this pass — matches Alkabor ref exactly.
- Silent Fist Clan members (Phin_Esrinap, LuSun, Togahn_Sorast, Nax_Ghruna) added combat rally + Silent Fist after-death line from Alkabor ref.
- Circle of Unseen Hands members (Renux_Herkanor, Sabnie_Blagard, Crow, Segran_Rajhar) added "You can't break the Circle..." after-death line from Alkabor ref.
- `Sabnie_Blagard` ref labels its Circle line as "On Death" (not "After Death"); mapped to `event_death_complete` to match sibling Circle members' event mapping and dedupe with the standard post-death broadcast slot.
