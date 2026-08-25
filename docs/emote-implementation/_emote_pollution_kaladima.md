# Emote Pollution Log — kaladima

Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/kaladima/` (Alkabor only)
Date: 2026-08-21

## Summary

All 20 reference files in this zone are byte-identical, containing only the
generic guard template:

```
Say -- Enter Combat: Time to die $name.
Say -- After Death: My comrades will avenge my death.
```

Every ref file targets a `Guard_*` NPC, and each corresponding
`Guard_*.lua` already existed in the quests folder with an identical shared
template (`event_combat` joined branch, `event_death_complete`, `event_slay`).

## Actions Taken

- `event_combat` (joined): ADDED `Time to die %s.` (via `string.format` +
  `e.other:GetName()`) as a ChooseRandom variant alongside the pre-existing
  `For the glory of Kaladim, have at thee!!` line. All 20 files.
- `event_death_complete`: ref line `My comrades will avenge my death.` is an
  exact case-insensitive match of the existing single Say — DEDUPED, no change.
- `event_slay`: no ref data, existing line left intact.

## Files Modified (20)

Guard_Adolar, Guard_Adolmer, Guard_Anathur, Guard_Badmer, Guard_Bobbin,
Guard_Cardaff, Guard_Didek, Guard_Dinamin, Guard_Dinler, Guard_Gabbles,
Guard_Hinolmer, Guard_Humkor, Guard_Humphet, Guard_Kathur, Guard_Kindor,
Guard_Koranin, Guard_Ninadek, Guard_Ninaf, Guard_Stump, Guard_Tantan.

All targets resolved to name-based `.lua` files; no `.pl`-only patches, no
new files created, no ID-based `.lua` collisions.

## Ambiguous / Skipped / Notes

- No unlabeled Say lines in any ref (no slay-vs-rally ambiguity to resolve).
- No lore mismatches to skip (dwarf guards in a dwarven city — everything on-theme).
- No Enter/Leave/Hailed/Spawn/Despawn/Killed PC-NPC/On Death events beyond
  the two lines above appear in any ref.
- Ref set is unusually thin: every guard shares the same 2-line generic
  template. Possibly a placeholder in the original Alkabor dataset rather
  than per-NPC dialogue.
