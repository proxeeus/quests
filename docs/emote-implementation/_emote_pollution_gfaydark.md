# gfaydark — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- Multiple NPC IDs share the same Guard name across peq/Alkabor/p2002 DB snapshots (e.g. `Guard_Fayfield` appears as 54123, 54210, 54268; `Guard_Orcflayer` as 54062, 54212, 54242; `Guard_Nitegazer` as 54121, 54226, 54247, etc.). All resolve to the same name-based `Guard_<Name>.pl` handler in this zone. No `<NPCID>.lua` variants exist, so no name-vs-ID collision; single canonical file edit covers every spawn ID.
- Ref data across all 4 dirs is heavily duplicated (same line repeated 3-300 times per file). Deduped to unique lines per event per NPC.
- Standard `Guard_*` p2002/peq ref set is uniform: Enter Combat "For the defense of Kelethin!!", Leave Combat "For the protection of all Fier'Dal, there shall be no mercy for your kind.", After Death "Your name shall be added to the Guards of Faydark's most wanted list." All 26 existing `Guard_*.pl` files already carried the Angelox-era "My comrades will avenge my death." death line; the p2002 wanted-list line was added as a ChooseRandom variant (perl array + `int(rand(scalar @))`) alongside it — nothing removed.
- Five guards (`Brookrock`, `Fayfear`, `Fireblight`, `Rainstrider`, `Pineshade`) use an existing split-format where the "For the protection of all Fier'Dal..." line is delivered via `EVENT_SIGNAL` from orc death handlers rather than on Leave Combat. Added an `elsif($combat_state == 0)` branch to `EVENT_COMBAT` so the Leave Combat trigger fires naturally too; the pre-existing `EVENT_SIGNAL` wiring is preserved verbatim (some orc `.pl` files signal these guard IDs on orc death). `Guard_Brookrock.pl` additionally carries a unique `EVENT_ATTACK` melee-flavor bank ("Another corpse for the caretaker...", "You fool!", "Let me polish my sword with your skin!", ...) — preserved verbatim.
- `Guard_Highmoon.pl` was missing the "For the protection of all Fier'Dal, there shall be no mercy for your kind." combat line entirely; added.
- `Guard_Fayfield` had no existing handler despite three spawn IDs (54123 / 54210 / 54268). Created `Guard_Fayfield.lua` with the standard guard emote set.
- `Salani_Tunfar` (54196, Alkabor-only) had no existing handler. Ref contains `$name` substitution ("Time to die $name.") — created `Salani_Tunfar.lua` using `e.other:GetName()` interpolation.
- `a_forest_drakeling` (54025, Alkabor-only) and `orc_legionnaire` (58054, peq-only) had no existing handler; created new `.lua` files.
- Orc handlers (`orc_pawn.pl`, `orc_centurion.pl`, `orc_oracle.pl`, `orc_shaman.pl`, `orc_hatchetman.pl`) already contain every unique ref line and additional flavor variants ("You've ruined your lands. You'll not ruin mine!", "Humans kill humans, apes do not kill apes!"). No changes needed — ref content fully covered.
- `Guard_Crystalwind.pl` (task-giver, EVENT_SAY/EVENT_ITEM/EVENT_DEATH_COMPLETE/EVENT_COMBAT) and `Guard_Orcflayer.pl` (task-giver) preserved verbatim; only `EVENT_DEATH_COMPLETE` widened to include the wanted-list variant.
