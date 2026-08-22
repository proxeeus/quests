# crystal — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- Many NPCIDs collapse to a single shared name-based lua (e.g. `a_Ry-Gorr_miner.lua` covers NPCIDs 121001, 121002, 121003, 121004, 121054; `a_Ry-Gorr_watchman.lua` covers 121000-ish sub-IDs; `a_Coldain_miner.lua` covers 121033/121034/121048/121076/121088; `Foreman_Rixact.lua` covers 121062 + 121068; `Foreman_Smason.lua` covers 121011 + 121070; `a_Ry-Gorr_oracle.lua` covers 121014 + 121057; `a_geonid.lua` covers 121013 + 121067) — kept a single name-based file per rule; NPCIDs not enumerated as separate lua files.
- Existing `a_Ry-Gorr_oracle.lua` invokes `string.Format` (capital F, non-existent) and `racesplural.GetPlural` — pre-existing bug, not touched per "never remove existing"; AARRGGHH line was already present so no add needed.
- `Ghost_of_Burdael.lua` and `Historian_Baenek.lua` have no ref emote data across any of the four dirs — left untouched.
