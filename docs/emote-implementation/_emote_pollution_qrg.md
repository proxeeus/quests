# Emote Pollution Log — qrg (Surefall Glade)

Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/qrg/*.txt`
Date: 2026-08-21

## Summary
7 ref files processed. All 7 NPCs share a nearly-identical minimal payload: a single `Say -- Enter Combat` line + a shared `Say -- After Death: My comrades will avenge my death.` No proximity emotes, no waypoint chatter, no death-taunt variety, no timers.

## Per-NPC Actions

| Ref ID | NPC | Action | Notes |
|--------|-----|--------|-------|
| 3006 | Sivina_Lutewhisper | PATCHED existing `.lua` — added `event_combat` + `event_death_complete` | Bard NPC; existing quest is League mail courier. Combat line "Die, like a motherless gnoll!" is odd on a lore-friendly bard but matches ref verbatim. |
| 3021 | Frenway_Marthank | SKIPPED — already fully implemented | Existing `.lua` already had both events with matching lines. |
| 3022 | Corun_Finisc | SKIPPED — already fully implemented | Existing `.lua` already had both events with matching lines. |
| 3026 | Krystal_Aspen | SKIPPED — already fully implemented | Existing `.lua` already had both events with matching lines. |
| 3027 | Bren_Treeclimber | SKIPPED — already fully implemented | Existing `.lua` already had both events with matching lines. |
| 3044 | a_poacher | CREATED new `.lua` | Hostile trash mob, no prior quest file. Lowercase `a_` prefix per convention. |
| 3045 | Poacher | CREATED new `.lua` | Distinct NPC ID from 3044; same emotes. Capitalized name preserved. |

## Lore Judgment
- All lines included verbatim. Nothing was flagged clearly-wrong for Surefall Glade context (ranger city; hostile poachers + defensive rangers/bards fit).
- The "Die, like a motherless gnoll!" combat line is used on both the bard Sivina and the poacher trash mobs. Kept as-authored — Alkabor is the source of truth.

## Coverage
- Ref files: 7
- Existing files patched: 1 (Sivina_Lutewhisper)
- New files created: 2 (a_poacher, Poacher)
- Skipped (already complete): 4 (Frenway_Marthank, Corun_Finisc, Krystal_Aspen, Bren_Treeclimber)
- No `.pl` conflicts encountered; qrg has zero Perl files.
- No emotes dropped, no lines editorialized.
