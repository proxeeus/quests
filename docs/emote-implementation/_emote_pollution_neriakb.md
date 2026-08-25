# Emote Pollution Log — neriakb (Neriak Commons)

Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/neriakb/` (Alkabor only)

## Summary

All 14 ref files are Neriak Commons guards (and one Olavn N`Mar) with an
identical 2-line generic guard script:

- Enter Combat: `Die, like the fool you are!`
- After Death:  `My comrades will avenge my death.`

No unique or NPC-specific dialogue was recovered — this is the pan-Norrath
"generic city guard" boilerplate that appears verbatim across Freeport,
Qeynos, Highkeep, and other guard rosters (see `ecommons/Guard_*.lua`,
`highkeep/Guard_*.lua`). It is lore-appropriate for Teir'Dal city guards but
adds no dark-elven flavor.

## Duplicates within ref files (deduped on ingest)

Several files had internal duplicate lines (2x or 3x repeats of the same
Enter Combat / After Death entry). These were deduped case-insensitively
before write — no line was written twice.

| NPCID | Name          | Enter Combat dupes | After Death dupes |
|-------|---------------|--------------------|-------------------|
| 41074 | Guard N`Mar   | 3                  | 3                 |
| 41077 | Guard Quexill | 2                  | 2                 |
| 41078 | Guard Zexus   | 2                  | 2                 |
| 41101 | Guard G`Noir  | 3                  | 3                 |
| 41110 | Guard V`Lask  | 2                  | 2                 |
| 41111 | Guard T`Kix   | 2                  | 2                 |
| 41116 | Guard N`Mar   | 3                  | 3                 |

## NPC name collision

- `41074_Guard_N`Mar.txt` and `41116_Guard_N`Mar.txt` share the display name
  `Guard N`Mar` (two distinct spawns in-zone). Identical emote payload, so
  a single `Guard_N`Mar.lua` covers both. No per-NPCID split necessary.

## Skipped

None — all 14 files carry lore-appropriate content for Teir'Dal city guards.

## Files created (14)

Decision-tree step 5 (no pre-existing `.pl`/`.lua` by name or NPCID) applied
to every entry — all new `.lua` files:

- Guard_Q`Tentu.lua        (41033)
- Olavn_N`Mar.lua          (41057)
- Guard_S`Tai.lua          (41073)
- Guard_N`Mar.lua          (41074 + 41116 shared)
- Guard_S`Lon.lua          (41075)
- Guard_Tolax.lua          (41076)
- Guard_Quexill.lua        (41077)
- Guard_Zexus.lua          (41078)
- Guard_F`Lok.lua          (41080)
- Guard_G`Noir.lua         (41101)
- Guard_D`Bious.lua        (41103)
- Guard_V`Lask.lua         (41110)
- Guard_T`Kix.lua          (41111)

## Files patched

None — no pre-existing `.pl` files were touched (none existed for the
guard roster; the 23 `.pl` files present in `quests/neriakb/` belong to
merchants/questgivers with no ref emote data).
