# fieldofbone — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- `Trooper_Gummin.pl`, `Trooper_Mozo.pl`, `Trooper_Taer.pl`, `Trooper_Drix.pl` — existing perl handlers (EVENT_SAY/ITEM only); patched in-place with EVENT_COMBAT/DEATH_COMPLETE/SLAY per the standard Legion of Cabilis trooper set. Kept perl per rules (no .lua present pre-run).
- `Crusader_Quarg.pl` — existing perl (Shaman Skull Quest 3/4); patched with EVENT_COMBAT + EVENT_DEATH_COMPLETE (Crusader of Greenmist variant, matches sibling Crusader_Bodli).
- Multiple NPC IDs (78113, 78161, 78173) share the name `a_militia_skeleton` with identical single-line "Halt!! Who goes there?" ref data — merged into one `a_militia_skeleton.lua` (name-based dispatch covers all three).
- `78090 Gharg_Oberbord` — dialect ref line ("HELP ME MINYUNS! DA POWA OB DA BOOK COMMANDS IT!") preserved verbatim; unusual style but consistent across all 4 ref dirs, treated as intentional flavor not pollution.
- `#Berserker-s_Image.pl` / `#an_iksar_manslayer.pl` (leading `#`) are epic-quest spawn variants for other zones' NPCs; no ref data for them, untouched.
