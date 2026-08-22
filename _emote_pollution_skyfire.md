# Emote Pollution Log — skyfire

Ref source: `C:/eqemu/ref_emotes/Emotes_Alkabor/skyfire/` (Alkabor only)
Date: 2026-08-21

## Summary

Only 1 ref file present: `91093_Talendor.txt` (Talendor, the boss dragon of Skyfire Mountains).

Both emote lines were **already fully implemented** in `Talendor.lua`:
- `event_combat` (joined) → Shout matches ref line 1
- `event_slay` → Say matches ref line 2

## Files Modified

None. Talendor.lua already contains both emotes verbatim.

## Skipped (lore/wrong-target)

None.

## Notes

- No `.pl` file exists for Talendor, only `Talendor.lua` — the critical Lua-shadows-Perl rule was not triggered.
- No other NPCs in ref_emotes for this zone; other quest NPCs (Dry_Sapara, Enrid_Ebonclaw, Felia_Goldenwing, Jennus_Lyklobar, Warder_Cecilia, Zordak_Ragefire, etc.) have no Alkabor emote data available and were not touched.
