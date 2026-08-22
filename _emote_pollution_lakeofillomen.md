# lakeofillomen — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `Trooper_Curlish.pl`, `Trooper_Digdul.pl`, `Trooper_Frogzin.pl`, `Trooper_Hegwez.pl`, `Trooper_Kylpog.pl`, `Trooper_Selbat.pl`, `Trooper_Vaurk.pl` — existing perl handlers (EVENT_SAY/ITEM only); patched in-place with EVENT_COMBAT/EVENT_DEATH_COMPLETE/EVENT_SLAY per the standard Legion of Cabilis trooper set. Kept perl per rules (no .lua present pre-run).
- `Trooper_Larrin` (85007), `Trooper_Eshzik` (85147), `Trooper_Sylith` (85233) — no existing quest file; created `.lua` with the Legion of Cabilis trooper set.
- `Crusader_Swype` (85144), `Crusader_Deezin` (85145) — no existing quest file; created `.lua` with the Crusader of Greenmist combat/death set (Enter Combat + After Death only; no Killed PC/NPC ref lines).
- `Trooper_Selbat` — ID 85001 (Alkabor) and 85170 (peq) both map to the existing `Trooper_Selbat.pl` (in-game ID 5139); identical ref content, patched once.
- Alkabor ref for `Trooper_Selbat` had one line with a stripped event label (`Say -- : Another victory...`); text matches the Killed PC/NPC line from every other ref source, treated as Killed PC/NPC and deduped against the p2002/peq copies (no functional difference).
- `a_lead_explorer.lua` / `an_explorer.lua` — existing modern lua handlers with `event_death_complete` already set to "My comrades will avenge my death."; no ref data for these NPCs, untouched.
