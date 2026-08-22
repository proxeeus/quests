# growthplane — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- Ref dumps use `#`-prefixed filenames for `#a_thifling_sprite` (127009) and `Guardian_of_Tunare` (127007, 127008, 127106) — three separate NPC IDs share the `Guardian_of_Tunare` display name and one is also duplicated as `#a_thifling_sprite`. Consolidated all into name-based Lua files (`Guardian_of_Tunare.lua`, `a_thifling_sprite.lua`) — same emote across all IDs so no per-ID divergence.
- `#Tunare.lua` (127098) and `#_Tunare.lua` (127001) — pre-existing hidden `#`-prefixed handlers for the epic Tunare fight (call_zone_to_assist). No ref emote data for these two IDs; left untouched.
- `Fayl_Everstrong.pl`, `Rumbleroot.pl`, `Treah_Greenroot.pl`, `Ancient_Totem.pl`, `Guardian_of_Takish.pl`, `Tunarean_Earthmelder.pl` — pre-existing perl handlers (aggro-linker / quest hail chains / EVENT_HP triggers). Added EVENT_COMBAT with the ref combat line to each; existing EVENT_AGGRO / EVENT_SAY / EVENT_HP / EVENT_ITEM / EVENT_SPAWN wiring preserved verbatim.
- `Ordros_assistant` (127039) — ref filename uses an underscore between "Ordros" and "assistant"; assumed the in-game display name is "Ordro\`s assistant" (backtick before lowercase 's). Created as `Ordros-assistant.lua` per the backticks→dashes rule. If the DB actually stores it as `Ordros_assistant` (literal underscore) the file will need to be renamed.
- `a_gleaming_sphere_of_light.pl`, `a_mosscovered_treant.pl`, `Prince_Thirneg.pl`, `Flighty_Viridian_Wisp.pl` — no ref emote data for these NPCs; left untouched.
- Numerous NPC IDs share the same display name (multiple `a_spirit_flux_wolf`, `a_serene_forest_spirit`, `a_skittering_forest_spirit`, `a_thifling_focuser`, `a_protector_of_growth`, `a_feral_amalgam`, `a_sylvan_protector`, `a_sanguine_kodiak`, `a_glade_stalker`, `a_gale_wolf`, `a_rolling_plains_steed`, `an_entoling_essence_channeler`, `an_entoling_essence_conduit`) — ref content is identical across each ID group after dedupe, so a single Lua per display name covers all.
- Ref data across all 4 dirs is heavily duplicated (same line repeated dozens-to-hundreds of times per file). Deduped to a single unique line per NPC per event. All ref lines are lore-appropriate for Plane of Growth (thiflings/sprites shouting "Kinidai!", protectors chanting "grow new trees", wolves howling, treants/dryads wrapping vines, spirits blinking in with mental attacks, kodiak/puma/unicorn charges — all consistent with Tunare's realm).
- Typo `"trees have ived longer"` in `a_tranquil_treant` Enter Combat text preserved verbatim from all four ref sources (Verant source typo).
