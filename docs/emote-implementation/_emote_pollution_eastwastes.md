# eastwastes — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `#Captain_Berradin.lua` — hidden `#`-prefixed duplicate of `Captain_Berradin.lua`; ignored (edited canonical name-based file only).
- `#Garadain_Glacierbane.pl` — hidden `#`-prefixed duplicate of `Garadain_Glacierbane.pl`; ignored.
- `#Peffin_Ambersnow.pl` — hidden `#`-prefixed duplicate of `Peffin_Ambersnow.pl`; no ref data for this NPC.
- `#Tester.pl`, `#The_snow.pl`, `#You_have.pl` — apparent scratch/backup files with `#` prefix; not real NPC handlers.
- `116579.lua` (a_coldain_hunter) — id-based file coexists with name-based `a_coldain_hunter.lua`; ref line merged into name-based only (id-based holds waypoint/signal logic for the Ring 8 finale, untouched).
- `116581.lua` (a_coldain_missionary) — same pattern; edited name-based only.
- `116583.lua` (a_coldain_warrior) — same pattern; edited name-based only.
- `Ry-Gorr_Emissary.lua` pre-existing `event_combat` used a Coldain-flavored line (`"%s like you are better left dead than alive."`) copy-pasted from the coldain handlers; wrong-faction dialogue for a Ry`Gorr orc but preserved per "never remove existing"; new ref line ("Crush, maim...") added as an additional ChooseRandom variant. Same situation for `a_Ry-Gorr_oracle.lua`.
- `Bodyguard_{Nergan,Marganel,Persevil,Stoneberg}.lua` and `Captain_Berradin.lua` — pre-existing handlers use `Shout` (not `Say`) for the "Yer messin with the wrong Coldain..." line; ref shows `Say` for the bodyguards and `Shout` for Berradin. Left as-is; content matches the ref verbatim.
