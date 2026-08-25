# Emote Pollution Log — rathemtn (Rathe Mountains)

Zone theme: mountainous wilderness — cyclops, hill giants, wisps, giant
snakes, minotaurs, Deathfist orcs on the north pass, Deepwater lizardmen
in the southern lake fingers, roving human bandits, a small Deepwater
Knight / Marr / Rodcet Nife encampment (David / Elisabeth / Marianna /
Sentry Joanna / Tomas / Nancine) that anchors the Armor of Ro tradeskill
quest line, plus the Aldrik / Ostodl / Marthank / Odon / Tyanathin /
Legola / Winsle / Funter / Arathin / Durmas hunter "houses" — noble
trophy-hunter camp east of the Deepwater camp.

Priority order applied: Alkabor only (no p2002 / peq / neq dumps present).

## Skipped / suspect entries

None outright skipped. All ref lines are combat / death / slay flavor
shouts on humanoid mobs and camp NPCs and fit the zone lore cleanly.

## Notes and observations

- **50000 / 50001 / 50315 / 50352 (a_bandit)** — all four spawn IDs share
  the same "Time to die $name." + "My comrades will avenge my death."
  ref content. Already covered exactly by the shared `a_bandit.lua` on
  disk (races-plural aggro variants + death). No edits.
- **50020 / 50023 / 50055 / 50347 (lizard man mystic / warrior / guard,
  lizardman_mystic)** — all share "Errrrrr.  Die soft skin!" Enter Combat
  ref. Already covered by shared `a_lizardman_warrior.lua`,
  `a_lizardman_guard.lua`, `lizardman_mystic.lua` — text matches exactly.
  No edits.
- **50034 / 50211 (an_orc_warrior, an_orc_priest)** — Clan Deathfist
  "Orc stomp, orc kill" combat + Deathfist death shout. Already covered
  by the shared `an_orc_warrior.lua` / `an_orc_priest.lua` on disk with
  identical text. No edits.
- **50068 Guard_Gruilka / 50069 Guard_Shiznak** — ref lines are the
  generic "Time to die $name." + "My comrades will avenge my death."
  Existing `.pl` files already implement both events (with $target_name
  substitution and additional EVENT_AGGRO class-based lines). Left
  as-is; adding the plain-$name variant would just noisy-duplicate.
- **50076 Marianna** — patched the existing `.pl` to add EVENT_SLAY
  ("A pity...  Such a waste of a life.") from ref line 3. Combat +
  death already matched ref.
- **50232 David / 50233 Elisabeth** — existing `.pl` death messages
  already match ref verbatim. No edits.
- **50234 Nancine** — existing `.lua` combat line matches ref verbatim.
  Ref has no after-death. No edits.
- **50235 Sentry Joanna** — existing `.pl` death message matches ref
  verbatim (ref has no Enter Combat). No edits.
- **50238 Tomas** — patched existing `.lua` to add event_slay ("Yet
  another foe of the Knights of Thunder has been sent to the grave.").
  Combat + death already matched ref.
- **50010 Tal Godin** — Deepwater Knight NCO; combat + death shout. New
  `.pl`.
- **50272 Kazzel D`Leryt** — existing `.pl` (Etched Stone quest) already
  has ref's combat shout ("You dare incite my wrath?..."). Ref has no
  death message. No edits.
- **50277-50296 hunter-house nobles** (Rell Ostodl, Gwynn Marthank,
  Bunk Odon, Sylp Tyanathin, Jars Legola, Zepin Winsle, Peltin Funter,
  Fandl Arathin, Hogus Durmas) — each has a single Enter Combat house
  shout; Gwynn / Zepin / Peltin additionally have the generic "My
  comrades will avenge my death." after-death line. New `.pl` files for
  each.
- **50313 Jyle Windstorm** — Paladin of Tunare hunter. Ref has an
  ungated `Say --` (no Enter/After Death prefix) and an Enter Combat.
  Ungated line is a spawn / patrol chant style benediction — bound to
  EVENT_SPAWN so it fires once per repop instead of spamming.

## Ref → target resolution summary

| NPCID | Ref name              | Ref src | Action                                       |
|-------|-----------------------|---------|----------------------------------------------|
| 50000 | a_bandit              | Alkabor | already covered by a_bandit.lua              |
| 50001 | a_bandit              | Alkabor | already covered by a_bandit.lua              |
| 50315 | a_bandit              | Alkabor | already covered by a_bandit.lua              |
| 50352 | a_bandit              | Alkabor | already covered by a_bandit.lua              |
| 50020 | a_lizard_man_mystic   | Alkabor | already covered by lizardman_mystic.lua      |
| 50023 | a_lizard_man_warrior  | Alkabor | already covered by a_lizardman_warrior.lua   |
| 50055 | a_lizard_man_guard    | Alkabor | already covered by a_lizardman_guard.lua     |
| 50347 | lizardman_mystic      | Alkabor | already covered by lizardman_mystic.lua      |
| 50034 | an_orc_warrior        | Alkabor | already covered by an_orc_warrior.lua        |
| 50211 | an_orc_priest         | Alkabor | already covered by an_orc_priest.lua         |
| 50010 | Tal_Godin             | Alkabor | CREATE Tal_Godin.pl                          |
| 50068 | Guard_Gruilka         | Alkabor | existing .pl already covers combat + death   |
| 50069 | Guard_Shiznak         | Alkabor | existing .pl already covers combat + death   |
| 50076 | Marianna              | Alkabor | PATCH Marianna.pl (add EVENT_SLAY)           |
| 50232 | David                 | Alkabor | existing .pl already covers death            |
| 50233 | Elisabeth             | Alkabor | existing .pl already covers death            |
| 50234 | Nancine               | Alkabor | existing .lua already covers combat          |
| 50235 | Sentry_Joanna         | Alkabor | existing .pl already covers death            |
| 50238 | Tomas                 | Alkabor | PATCH Tomas.lua (add event_slay)             |
| 50272 | Kazzel_D`Leryt        | Alkabor | existing .pl already covers combat           |
| 50277 | Rell_Ostodl           | Alkabor | CREATE Rell_Ostodl.pl                        |
| 50280 | Gwynn_Marthank        | Alkabor | CREATE Gwynn_Marthank.pl                     |
| 50283 | Bunk_Odon             | Alkabor | CREATE Bunk_Odon.pl                          |
| 50284 | Sylp_Tyanathin        | Alkabor | CREATE Sylp_Tyanathin.pl                     |
| 50287 | Jars_Legola           | Alkabor | CREATE Jars_Legola.pl                        |
| 50291 | Zepin_Winsle          | Alkabor | CREATE Zepin_Winsle.pl                       |
| 50292 | Peltin_Funter         | Alkabor | CREATE Peltin_Funter.pl                      |
| 50293 | Fandl_Arathin         | Alkabor | CREATE Fandl_Arathin.pl                      |
| 50296 | Hogus_Durmas          | Alkabor | CREATE Hogus_Durmas.pl                       |
| 50313 | Jyle_Windstorm        | Alkabor | CREATE Jyle_Windstorm.pl                     |
