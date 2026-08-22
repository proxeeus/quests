# Emote Pollution Log — overthere (The Overthere)

Zone context: Kunark savanna outpost; sarnaks, di'zok, iksar rangers, giant scarabs, giants, evil eyes. Neutral outpost. The Overthere is also host to a Teir'Dal (Dark Bargainer / Indigo Brotherhood) raid force — the seven NPCs listed below are all part of that faction and their flavor text is on-theme.

## Source priority applied
Per NPC, first available: p2002 > Alkabor > peq > neq.

## NPCs processed

| NPC ID | Name | Source dir | Action | File |
| --- | --- | --- | --- | --- |
| 93084 | Dragoon T`Vex | p2002 | created | `Dragoon_T-Vex.pl` |
| 93086 | Dragoon V`Resh | p2002 | created | `Dragoon_V-Resh.pl` |
| 93087 | General V`Deers | p2002 | created | `General_V-Deers.pl` |
| 93088 | Dragoon T`Vem | peq (only) | created | `Dragoon_T-Vem.pl` |
| 93124 | Dragoon Barber W`Selo | p2002 | created | `Dragoon_Barber_W-Selo.pl` |
| 93125 | Dragoon V`Lask | p2002 | created | `Dragoon_V-Lask.pl` |
| 93186 | High Priest I`Xar | peq (only) | patched existing `.lua` | `High_Priest_I-Xar.lua` |

## Precedence notes
- 93186 already had `High_Priest_I-Xar.lua` (hail handler). Per critical rule (Lua shadows Perl) — did NOT create a `.pl`; added `event_combat`, `event_death_complete`, and `event_slay` handlers inside the existing Lua file, preserving the hail block.

## Pollution / lore rejections
None. All seven NPCs are Teir'Dal (Dark Bargainer / Indigo Brotherhood) raiders operating in The Overthere. Their references to Innoruuk, the "Dark Bargainers," and the "Indigo Brotherhood" are faction-appropriate — this is the expected antagonist force for Overthere content. All lines retained.

## Dedupe notes
- The four Dragoon rank-and-file (93084, 93086, 93088, 93125) share an identical stock template (Come and feel the blade… / Start digging your grave… / Hardly a worthy adversary…). Kept as-is per NPC — this is a canonical roster of interchangeable Teir'Dal dragoons, not a mistake.
- 93124 (Barber W`Selo) and 93186 (High Priest I`Xar) share the "May the unholy peace of Innoruuk be with you!!" opener but retain distinct roles (barber vs. priest); kept.
- 93087 (General V`Deers) has a unique combat line ("Say your prayers.  Death approaches!!"); kept.
- Killed PC and Killed NPC lines are identical in every ref; merged into a single `EVENT_SLAY` handler (fires on either kill type).

## Event mapping
- `Say -- Enter Combat` → `EVENT_COMBAT` (Perl, gated on `$combat_state == 1`) or `event_combat` (Lua, gated on `e.joined`).
- `Say -- After Death` → `EVENT_DEATH_COMPLETE`.
- `Say -- Killed PC` + `Say -- Killed NPC` (identical) → single `EVENT_SLAY`.
