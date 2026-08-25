# Najena Emote Pollution Log

Zone: najena (Najena, dark elf necromancer citadel)
Ref sources (priority): p2002 > Alkabor > peq > neq
Date: 2026-08-21

## Summary

Najena is a small themed dungeon (Najena herself + her guards: dark elf necromancers/magicians, imprisoned goblins, summoned elementals, Widowmistress + widows). All 39 ref NPC files across the 4 dumps map to templated NPCs — every emote text found is lore-appropriate to a dark elf citadel of enthralled summoners. No skips required.

## Files Created

- `a_magician.lua` — merged pool: "Ugly creature..." (from 44088 p2002), "Time to die $name" (Alkabor 44089), "My comrades..." / "I wiggled..." death lines. Random-select.
- `a_necromancer.lua` — After Death "My comrades will avenge my death." (peq 44006/07/23/77/78/93/97)
- `a_goblin_warrior.lua` — Enter Combat + After Death (p2002 44049, peq 44018/21)
- `a_goblin_magician.lua` — Enter Combat + After Death (p2002 44086, peq 44019/73)
- `a_mist_elemental.lua` — Enter Combat "Time to die $name" + After Death (Alkabor 44048/138)
- `a_fire_elemental.lua` — Enter Combat "Time to die $name" + After Death (Alkabor 44066/140)
- `The_Widowmistress.lua` — Enter Combat rally (p2002 44103)
- `Najena.lua` — After Death (peq 44100). Placeholder; boss almost certainly has richer flavor not captured in dumps.

## Files Patched

- `#Rathyl.lua` — added `event_death` "Foolish children..." (peq 44024 On Death). Preserved existing `event_death_complete` incarnate spawn.
- `#Rathyl.pl` — mirrored On Death line into existing `EVENT_DEATH` (kept custom "HA! You thought you killed me?" line). Note: `.lua` shadows `.pl` at runtime; pl kept in sync for maintainability.
- `a_visiting_priestess.pl` — added `sub EVENT_COMBAT` with Innoruuk rally (p2002 44107). Preserved full existing SAY / ITEM quest logic.
- `an_earth_elemental.lua` — already had "My comrades will avenge my death." on `event_death_complete`. No changes needed — matches all 10 earth-elemental ref files (44001/35/36/39/43/46/47/74/81/136 across p2002/peq/Alkabor/neq).

## Priority Decisions

- 44035 an_earth_elemental: p2002 wins over Alkabor/peq/neq (identical text anyway).
- 44049 a_goblin_warrior: p2002 wins over peq (identical text).
- 44086 a_goblin_magician: p2002 wins over peq (identical text).
- 44088 a_magician: p2002 wins over Alkabor/peq (has goblin-warrior text, kept via merge into `a_magician.lua`).
- 44089 a_magician: Alkabor wins over peq (Alkabor has richer content: Enter Combat + After Death vs. peq After Death only).
- 44107 a_visiting_priestess: p2002 wins over Alkabor/peq/neq (identical Enter Combat text).
- 44103 The_Widowmistress: p2002 wins over Alkabor/neq (identical text).
- 44136 an_earth_elemental: p2002 wins over Alkabor/neq (identical text).
- 44138/140 mist/fire elementals: only in Alkabor/neq. Alkabor wins.
- 44048/66 mist/fire elementals: only in Alkabor. Used Alkabor.
- All peq-only NPCs (44001/05/06/07/14/18/19/21/22/23/24/26/36/39/43/46/47/72/73/74/75/77/78/81/87/93/97/100): peq used as sole source.

## Merges into Shared-Name Files

Many DB templates share NPC name → single quest file per name catches all instances:

- `a_magician.lua` catches 9 distinct npcids with 3 different text pools. Merged combat lines with random selection so each npcid still has variety.
- `a_necromancer.lua` catches 7 npcids all with identical single line — trivial merge.
- `a_goblin_warrior.lua` / `a_goblin_magician.lua` — all instances share identical text across p2002/peq. Trivial merge.
- `a_mist_elemental.lua` / `a_fire_elemental.lua` — both Alkabor instances share identical text. Trivial merge.
- `an_earth_elemental.lua` catches 10 npcids — already covered by existing file, no touch.

## Skipped

None. Every ref line is lore-appropriate for a necromancer citadel.

## Notes / Follow-ups

- Najena the boss (44100) has only "My comrades will avenge my death." in the ref dumps — this feels thin for a named boss. Likely richer emotes exist but weren't captured; leave for later ref updates.
- `#Rathyl` phantom-death "HA! You thought you killed me?" custom line preserved in `.pl` even though `.lua` shadows it — keeps historical intent visible.
- Ref dumps contained no Hailed / On Spawn / Killed PC/NPC / Enter-Leave-Combat pair beyond what's listed. No additional event handlers needed.
