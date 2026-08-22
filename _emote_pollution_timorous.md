# Emote Pollution Log — timorous (Timorous Deep)

Scope: Alkabor-only reference dumps at `C:/eqemu/ref_emotes/Emotes_Alkabor/timorous/`.

## Summary
- Ref files scanned: 1 (`96004_The_Great_Oowomp.txt`)
- NPCs updated: 0
- Emotes added: 0
- Skipped (already present): 2
- Skipped (lore-wrong): 0
- Skipped (no target): 0

## Per-NPC breakdown

### The_Great_Oowomp (npc id 96004, quest file `The_Great_Oowomp.pl`)
Ref dump: `96004_The_Great_Oowomp.txt` (2 lines).

| Ref line | Event | Type | Text | Action | Reason |
|---|---|---|---|---|---|
| 1 | Enter Combat | Say | `Let me release your soul.` | SKIP (already present) | `EVENT_COMBAT` at line 78-82 already fires `quest::say("Let me release your soul.");` when `$combat_state == 1`. Exact text match. |
| 2 | After Death | Say | `Your destiny lies at the hands of the Greenbloods.` | SKIP (already present) | `EVENT_DEATH_COMPLETE` at line 84-86 already fires `quest::say("Your destiny lies at the hands of the Greenbloods.");`. Exact text match. |

No edits required — the existing `.pl` already covers both ref lines with matching text and the correct event handlers (`EVENT_COMBAT` for enter-combat Say, `EVENT_DEATH_COMPLETE` for after-death Say). No `.lua` shadow file exists for this NPC, so `.pl` is authoritative.

## Notes
- Only one ref dump exists for Timorous Deep under `Emotes_Alkabor/timorous/`, and its NPC (Oowomp) already has both emotes wired correctly. No merges, no additions, no skips-for-lore.
- Did not touch any other NPC quest file in the zone — nothing in the ref set targets them.
