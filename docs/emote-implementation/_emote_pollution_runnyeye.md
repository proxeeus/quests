# runnyeye — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `11028_a_Runnyeye_conscript.txt` (lowercase "conscript") and `11174_a_Runnyeye_Conscript.txt` (uppercase "Conscript") — two ref dumps for the same NPC name (case-only differ) with identical goblin-generic Enter Combat / After Death lines ("Ugly creature near my feet..." / "I wiggled my fingers..."). Single existing `a_Runnyeye_Conscript.lua` already covers both; no action needed.
- Ambient proximity-emote NPCs already in quests but with no ref emote data (all use event_spawn/set_proximity/event_enter with a sentence-fragment Emote): `A_layer.lua`, `A_sharp_rock.lua`, `If_the.lua`, `Perhaps.lua`, `Progressing.lua`, `The_constant.lua`, `Thoughts.lua`, `You_are.lua`, `You_feel.lua`. These are invisible narrator objects for atmospheric text; ref dumps do not capture them because they never Say/Emote via NPC hate/death channels. Left untouched.
- `a_goblin_banker.lua`, `a_goblin_captain.lua` — no ref file present in Alkabor dump. Existing lua uses generic goblin combat/death ("Ugly creature..." / "I wiggled my fingers..."), consistent with sibling goblin NPCs in this zone. Left untouched.
- `#Lord_Pickclaw.lua` — existing combat line has a stray leading apostrophe (`"'You invade...`) not present in ref, and drops the double-space between sentences. Minor cosmetic pollution predating this pass. Left untouched (rule: add missing data, do not rewrite existing).

## Notes on non-standard ref lines
- Several ref files contain a killed-player emote (line starting with `Say -- :` or `Shout -- :` with no `Enter Combat` / `On Death` / `After Death` prefix). These represent messages spoken to the just-slain player. No standard event maps to that trigger cleanly; matched the existing zone convention (e.g. `Sludge_Dankmire.lua`, `#Battlelord_Paluk.lua`) and skipped those lines.
