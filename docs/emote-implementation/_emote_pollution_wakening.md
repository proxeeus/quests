# wakening — emote review

## Skipped as suspected ref pollution
- None. All Alkabor ref lines fit Wakening Land lore (Tunarean Court fauns/sifaye/drixie defending Tunare's sacred lands, Kromrif frost giants encroaching, holgresh natives, mercenaries hired for coin).

## Duplicate/orphan quest files noticed
- Existing `.lua` coverage was already comprehensive: all Alkabor NPCs with ref dumps (`a_unicorn`, `a_holgresh_conjurer`, `a_frost_giant_laborer`, `a_frost_giant_sentinel`, `a_frost_giant_sentry`, `an_elder_holgresh`, `a_holgresh_elementalist`, `Lieutenant_Krofer`, `a_faun`, `a_faun_outcast`, `a_sifaye_thane`, `a_drixie_thane`, `Korzak_Stonehammer`, `Teir-Dal_Mercenary`) already had matching `event_combat` handlers with the exact Alkabor emotes. No changes needed for those.
- Duplicate ref dumps for the same NPC name at different IDs (119014/119086 both `a_unicorn`; 119109/119298/119299 all `Teir\`Dal_Mercenary`) all show identical content, confirming the shared quest file is correct.
- `a_sifaye_knight.lua` (no ref dump exists) already uses the sifaye_thane Say line — plausibly correct by faction, left untouched.

## Files created / patched
- Created `a_corrupted_faun.lua` — ref 119000 shows the same faun "branch has been broken" Say line; corrupted fauns are still Tunare-aligned fauns, lore-appropriate.
- Patched `Eysa_Florawhisper.pl` — added `EVENT_COMBAT` with the "flora cries out for your nutrients" Say line from ref 119081. Preserved existing EVENT_SAY/EVENT_ITEM quest logic (Dolvak's Report handin, Tunarean Court faction).
