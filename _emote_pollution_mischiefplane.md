# Emote Pollution Log — mischiefplane (Plane of Mischief)

Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/mischiefplane/` (Alkabor only)

## Summary

- Ref files processed: 5
- Files created: 4
- Files patched: 0
- Files skipped (already contained): 1
- Lore-filtered lines: 0

## Per-NPC Actions

### 126083 a_hedge_wizard — SKIPPED (already contains all emotes)
- Existing `a_hedge_wizard.lua` already has:
  - `event_combat` (joined): Emote "rustles its leaves as it moves to attack."
  - `event_death_complete`: Emote "shrivels up into a dead husk."
- Ref content 100% present; no changes.

### 126154 Guard McSprayel — CREATED `Guard_McSprayel.lua`
- No prior file (neither `Guard_McSprayel.pl/.lua` nor `126154.pl/.lua`).
- Added: Hailed → Say "Guard duty stinks."

### 126199 Guard McStinkles — CREATED `Guard_McStinkles.lua`
- No prior file.
- Added: Hailed → Say "Guard duty stinks."

### 126233 Guard Roses — CREATED `Guard_Roses.lua`
- No prior file.
- Added: Hailed → Say "Guard duty stinks."

### 126343 Treasure Chest — CREATED `126343.lua`
- Name collision: existing `#Treasure_Chest.lua` is bound to NPC ID 126188 (guard-spawning mimic), NOT 126343. Created by NPC ID to avoid overriding the existing per-name script.
- Added: Enter Combat → Say "Chomp Chomp.  Take this treat.  Good to eat.  Chomp Chomp."

## Lore Judgment

All lines fit Plane of Mischief (Bristlebane's realm — pranksters, sentient mimics, disgruntled guards). Nothing filtered.

## Notes

- No `.pl` files existed for any of the target NPCs, so no Perl patches required.
- Preserved existing `#Treasure_Chest.lua` (NPC 126188) untouched — different mob, different logic (spawns guard adds on aggro).
