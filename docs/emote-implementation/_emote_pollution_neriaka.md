# Emote Pollution Log — neriaka (Neriak Foreign Quarter)

Source priority per NPC: p2002 > Alkabor > peq > neq. Skips = lore-inappropriate for a dark elf city entry (troll/ogre outsiders, Teir'Dal guards, evil merchants).

## Applied (patched existing .pl)

| NPCID | NPC | Source | Events Added |
|-------|-----|--------|--------------|
| 40001 | X`Ta Timpi | p2002 | EVENT_COMBAT ("Guards!!  Guards!!"), EVENT_DEATH_COMPLETE ("My comrades will avenge my death.") |
| 40002 | X`Ta Tompi | p2002 | EVENT_COMBAT ("Guards!!  Guards!!"), EVENT_DEATH_COMPLETE ("My comrades will avenge my death.") |
| 40044 | X`Ta Tempi | p2002 | EVENT_COMBAT ("That was not a very intelligent thing to do."), EVENT_DEATH_COMPLETE ("My comrades will avenge my death.") |
| 40030 | Uglan | p2002 | EVENT_DEATH_COMPLETE ("Crakneks will smoosh you!") |

## Applied (created new .lua)

| NPCID | NPC | Source | Events Added |
|-------|-----|--------|--------------|
| 40031 | Capee | p2002 | event_combat, event_death_complete |
| 40035 | Svunsa | p2002 | event_combat, event_death_complete |
| 40097 | Karnan | p2002 | event_combat, event_death_complete |
| 40103 | Mrak | p2002 | event_combat, event_death_complete |
| 40046 | Guard Swang | Alkabor | event_combat, event_death_complete |
| 40047 | Guard Quexill | Alkabor | event_combat, event_death_complete |
| 40051 | Guard Q`Tentu | Alkabor | event_combat, event_death_complete |
| 40063 | Guard Tolax | Alkabor | event_combat, event_death_complete |
| 40067 | Guard Lumpin | Alkabor | event_combat, event_death_complete |
| 40081 | Guard F`Lok | Alkabor | event_combat only ("Heretic! Thou shalt feel my magic scorn!") |
| 40085 | Guard N`Mar | Alkabor | event_combat, event_death_complete |
| 40116 | Guard To`Biath | Alkabor | event_combat, event_death_complete |
| 40094 | Jacker | Alkabor | event_combat, event_death_complete |

## Skipped
None — all ref-provided lines are lore-consistent for Neriak Foreign Quarter (Teir'Dal guards' "Die, like the fool you are!" / "My comrades will avenge my death.", sisterhood necromancer combat calls, Uglan the ogre's Crakneks retort, and Guard F`Lok's clerical shout).

## Notes
- p2002 supplies the necromancer sisters (X`Ta trio), the Kunark iksar-intake trio (Capee/Svunsa/Karnan/Mrak also fall in p2002), and Uglan (ogre).
- Alkabor is the sole source for all guards and Jacker; used per priority (peq empty; neq redundant).
- All 4 existing .pl handlers were extended in-place — no .lua shadow files created for those NPCs (per critical rule).
- Guard_Q`Tentu.lua exists in neriakb for a same-named neighbouring-zone NPC; the neriaka file is independent (different NPCID 40051, own zone folder).
