# Emote Pollution Log — lakerathe (Lake Rathetear)

Zone theme: grassland lake, aviaks, centaurs, ogre marauders, minotaurs,
Riptide goblins (Lord Bergurgle), Deathfist orcs (TomEar clan mislabel — see notes),
Rathe gnolls, occasional undead in the Temple of Life area.

Priority order applied: p2002 > Alkabor > peq > neq.

## Skipped / suspect entries

None outright skipped. All ref lines were retained — Lake Rathetear hosts
combat with generic humanoids (bandits, brigands, gnolls, orcs, ogres,
goblins) plus the Shmendrik / Natasha Whitewater / Bergurgle epic-cleric
plotline, so the "Time to die $name / My comrades will avenge my death"
and "Guards! Come smash!" content is thematically appropriate.

## Notes and observations

- **51100 / 51099 / 51129 / 51132 (a_gnoll_guard) and 51002 (a_gnoll_guard, peq)**
  reference `the legions of TomEar` — this is a Rathe-gnoll clan name that
  appears in the Rathe zones and is not a mislabel of another clan. Retained
  verbatim.
- **51001 / 51004 / 51007 (a_gnoll_shaman) and 51006 / 51098 / 51130 (a_gnoll_high_shaman)**
  say `Hail.. Prime.. Healer!!` on aggro and `Temple.. Life.. Get you!!  Yes..`
  on death — a reference to the Temple of Life area / Prime Healer NPC.
  Fits Rathe gnoll faction lore, retained.
- **51088 (an_orc_warrior) and 51089/51090/51110/51111**
  reference Clan Deathfist (Commonlands/EC orcs). Lake Rathetear does have a
  small orc camp in the northeast so this is plausible; retained.
- **51106 / 51168-51171 (a_bandit) and 51180 (a_brigand)**
  already have a shared `a_bandit.lua` / `a_brigand.lua` in-tree whose content
  matches the ref exactly (`Time to die %s.` + `My comrades will avenge my death.`).
  No edits required to those two files.
- **51012 Shmendrik_Lavawalker** — the `is overcome with madness and rage`
  emote fits the "Tyrant fire-cultist gone mad" flavour of his existing
  epic-cleric script; merged into a new EVENT_COMBAT block alongside the
  Triumvirate-of-Water shout chain, without disturbing his Natasha /
  crown-return logic.
- **51143 Lord Bergurgle** — Riptide goblin king, ref calls him "surface
  dwelling rock scum" underwater. Fits perfectly; new file.
- **51097 a_stone_skeleton** — `Heretic! Thou shalt feel my magic scorn!` is
  a caster-style line and Lake Rathetear's stone skeletons appear in the
  temple ruins area alongside the gnoll high shamans; treated as an
  animated caster remnant, retained.
- **51140 a_greater_zombie** — the sole `Areeeeewwwww` line is a groan and
  is used as an EVENT_COMBAT flavour; retained.
- **Cyanelle** has both `.pl` and `.lua` on disk (the `.lua` shadows the
  `.pl`). Not in refs — untouched.

## Ref → target resolution summary

| NPCID | Ref name              | Ref src | Action                              |
|-------|-----------------------|---------|-------------------------------------|
| 51007 | a_gnoll_shaman        | p2002   | CREATE a_gnoll_shaman.lua (shared)  |
| 51046 | Derg                  | p2002   | PATCH Derg.pl                       |
| 51071 | Trug                  | p2002   | PATCH Trug.pl                       |
| 51072 | Punga                 | p2002   | PATCH Punga.pl                      |
| 51073 | Grud                  | p2002   | PATCH Grud.pl                       |
| 51088 | an_orc_warrior        | p2002   | CREATE an_orc_warrior.lua (shared)  |
| 51100 | a_gnoll_guard         | p2002   | CREATE a_gnoll_guard.lua (shared)   |
| 51130 | a_gnoll_high_shaman   | p2002   | CREATE a_gnoll_high_shaman.lua (shared) |
| 51012 | Shmendrik_Lavawalker  | Alkabor | PATCH Shmendrik_Lavawalker.pl       |
| 51054 | Guard_Rianna          | Alkabor | CREATE Guard_Rianna.lua             |
| 51055 | Guard_Treal           | Alkabor | CREATE Guard_Treal.lua              |
| 51056 | Tralinda              | Alkabor | CREATE Tralinda.lua                 |
| 51057 | Lorud                 | Alkabor | CREATE Lorud.lua                    |
| 51058 | Kyralynn              | Alkabor | PATCH Kyralynn.pl                   |
| 51059 | Vrynn                 | Alkabor | PATCH Vrynn.pl                      |
| 51065 | Brundar               | Alkabor | CREATE Brundar.lua                  |
| 51066 | Jonah_Brucker         | Alkabor | CREATE Jonah_Brucker.lua            |
| 51084 | Deillia               | Alkabor | CREATE Deillia.lua                  |
| 51091 | Jorna                 | Alkabor | CREATE Jorna.lua                    |
| 51092 | Turgan                | Alkabor | PATCH Turgan.pl                     |
| 51097 | a_stone_skeleton      | Alkabor | CREATE a_stone_skeleton.lua         |
| 51106 | a_bandit              | Alkabor | already covered by a_bandit.lua     |
| 51109 | Rondel                | Alkabor | PATCH Rondel.pl                     |
| 51122 | Tabitha               | Alkabor | CREATE Tabitha.lua                  |
| 51123 | Aija                  | Alkabor | CREATE Aija.lua                     |
| 51124 | Hruthgar              | Alkabor | CREATE Hruthgar.lua                 |
| 51125 | Grinda                | Alkabor | CREATE Grinda.lua                   |
| 51126 | Lenklo                | Alkabor | CREATE Lenklo.lua                   |
| 51127 | Groethar              | Alkabor | CREATE Groethar.lua                 |
| 51128 | Hulga                 | Alkabor | CREATE Hulga.lua                    |
| 51140 | a_greater_zombie      | Alkabor | CREATE a_greater_zombie.lua         |
| 51143 | Lord_Bergurgle        | Alkabor | CREATE Lord_Bergurgle.lua           |
| 51168-51171 | a_bandit        | Alkabor | already covered by a_bandit.lua     |
| 51180 | a_brigand             | Alkabor | already covered by a_brigand.lua    |
| 51001,51004 | a_gnoll_shaman  | peq     | covered by a_gnoll_shaman.lua       |
| 51002 | a_gnoll_guard         | peq     | covered by a_gnoll_guard.lua        |
| 51006,51098 | a_gnoll_high_shaman | peq | covered by a_gnoll_high_shaman.lua  |
| 51089,51090,51110,51111 | an_orc_warrior | peq | covered by an_orc_warrior.lua    |
| 51099,51129,51132 | a_gnoll_guard | peq | covered by a_gnoll_guard.lua       |
