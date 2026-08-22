# Halas Emote Pollution Log

Zone: halas (Halas, Barbarian city)
Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/halas/*.txt`
Date: 2026-08-21

## Summary
Only Alkabor ref data available. 8 ref files processed.

## Files Modified
- `Thadres_Thyme.lua` — added `event_combat` (Enter Combat + generic Say folded into ChooseRandom on join).
- `Alec_McMarrin.lua` — added `event_combat` (Enter Combat), `event_death_complete` (After Death).
- `Mils_McMarrin.lua` — added `event_combat` (Enter Combat), `event_death_complete` (After Death).

## Files Created
- `Andres_McMarrin.lua` — Enter Combat + After Death.
- `Cian_McMarrin.lua` — Enter Combat + After Death.
- `Adon_McMarrin.lua` — Enter Combat + After Death.
- `Clovan_McMarrin.lua` — Enter Combat + After Death.
- `Oli_McMarrin.lua` — Enter Combat + After Death.

## Notes / Judgment Calls
- Thadres Thyme's unlabeled second line ("Someone clear this putrid rabble from my sight.") treated as Enter Combat variant per spec (unlabeled → Enter Combat). Tone is haughty which contrasts with his lore of a grieving brother searching for diary pages — but included per default-include rule.
- All 7 McMarrin family members share identical two-line combat template ("Time to die $name." / "My comrades will avenge my death.") — kept as-is per lore (Halas warrior clan).
- No `$name`/gap in After Death lines — used `e.self:Say` without formatting.
- No conflicts with existing `.pl` files — all targets resolved cleanly to `.lua`.
- No ID-based file conflicts observed.

## Skipped
None.
