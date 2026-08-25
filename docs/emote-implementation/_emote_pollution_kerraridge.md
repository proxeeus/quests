# Kerra Isle (kerraridge) — Emote Import Pollution Log

Ref source priority: p2002 > Alkabor > peq > neq.

## Summary

Kerra Isle refs contain 36 NPCs in p2002 (identical in Alkabor & neq for the same IDs) and 37 additional NPCs only present in peq/neq. All are Kerrans defending their island (peaceful cat-people faction; hostile only when provoked) plus a few kobold prisoners.

Nearly all combat lines fall into 2 recycled Verant/EQLive barks:
- **A** (fighter/mamluk/pazdar/ghulam roster): `Rrr!  Kejaan guide my claws!  You disturrrb our peace no more!`
- **B** (shaman/awrat/amir/amira/ademzada roster): `Rrrrrr.. I rrremove you from ourrr peaceful island!`

Named/unique lines:
- **C** Falthrik Lothoro (74030): `Furless fool.  I will show you what I have learned in my years!  Kejaan guide my hand!`
- **D** Shazda Asad (74032): `Rrrrrowwrrrr!!  For the great spirit of our ancestor, Kejaan, I shall rid our lands of your vile presence!`
- **E** Roary Fishpouncer (74069): `Grrrreeeoww!!!  I shall gut you like a fish for your vile ways!!`
- **F** kobold prisoner (74077/74079/74080): `<Bark!> Grrrr!`
- **G** Khonza Mitty of Kerra (74116): `Leave ourrr island now!  Or you will be rrremoved in pieces!`
- **H** Graalf Sharpclaw (74057) — Hailed: `Rrrrrrrr...`

All lore-appropriate (Kejaan is the Kerran ancestor spirit; every line is Kerran defenders warning off trespassers). Kobold prisoners' bark is thematic. No skips.

## Naming convention

- **Named/unique NPCs** → `<Name>.lua` (matches existing .pl convention in zone).
- **Generic/duplicate-name NPCs** (multiple spawn IDs share the same display name across ref files, e.g. `a_kerran_ghulam` at 74002/74062/74064/74084) → `<npcid>.lua`. Follows eastwastes/highkeep precedent (id-based files for generics).
- Backtick in name → hyphen in filename (e.g. `a_kerran_ghazi\`amir` → `74045.lua`, `74047.lua`, `74097.lua`).

## Per-NPC actions

### From p2002 (authoritative — 36 NPCs)

| NPCID | NPC Name | Line | Target file | Action |
|-------|----------|------|-------------|--------|
| 74005 | Wislen Mamluk | A | `Wislen_Mamluk.lua` | CREATED (sibling to existing .pl) |
| 74006 | a_kerran_mamluk | A | `74006.lua` | CREATED |
| 74008 | a_kerran_awrat | B | `74008.lua` | CREATED |
| 74012 | a_kerran_ghazi_shaman | B | `74012.lua` | CREATED |
| 74022 | Urkath Greyface | A | `Urkath_Greyface.lua` | CREATED |
| 74023 | Iffrir Soulcaller | A | `Iffrir_Soulcaller.lua` | CREATED |
| 74024 | Erfer Longclaw | B | `Erfer_Longclaw.lua` | CREATED |
| 74026 | a_kerran_mujahed | B | `74026.lua` | CREATED |
| 74028 | Feren | A | `Feren.lua` | CREATED (sibling to existing .pl) |
| 74030 | Falthrik Lothoro | C | `Falthrik_Lothoro.lua` | CREATED |
| 74032 | Shazda Asad | D | `Shazda_Asad.lua` | CREATED |
| 74038 | a_kerran_pazdar_shaman | B | `74038.lua` | CREATED |
| 74050 | a_kerran_pazdar | A | `74050.lua` | CREATED |
| 74055 | Errrak Thickshank | A | `Errrak_Thickshank.lua` | CREATED |
| 74057 | Graalf Sharpclaw | H (Hailed) | `Graalf_Sharpclaw.lua` | CREATED |
| 74058 | Feskr Drinkmaker | A | `Feskr_Drinkmaker.lua` | CREATED |
| 74059 | a_kerran_pasdar | A | `74059.lua` | CREATED |
| 74061 | a_kerran_pazhal | A | `74061.lua` | CREATED |
| 74062 | a_kerran_ghulam | A | `74062.lua` | CREATED |
| 74066 | drunken_ghulam | A | `drunken_ghulam.lua` | CREATED |
| 74069 | Roary Fishpouncer | E | `Roary_Fishpouncer.lua` | CREATED |
| 74070 | Raarrk | A | `Raarrk.lua` | CREATED |
| 74073 | Allix | A | `Allix.lua` | CREATED |
| 74074 | Thalith Mamluk | A | `Thalith_Mamluk.lua` | CREATED |
| 74075 | a_kerran_puzhal | A | `74075.lua` | CREATED |
| 74079 | a_kobold_prisoner | F | `74079.lua` | CREATED |
| 74082 | dozing_ghulam | A | `dozing_ghulam.lua` | CREATED |
| 74093 | a_kerran_amira_protector | B | `74093.lua` | CREATED |
| 74094 | a_kerran_amira_guardian | B | `74094.lua` | CREATED |
| 74097 | a_kerran_ghazi\`amir | B | `74097.lua` | CREATED |
| 74098 | a_kerran_ademzada\`amir | B | `74098.lua` | CREATED |
| 74108 | a_kerran_ademzada_shaman | B | `74108.lua` | CREATED |
| 74109 | a_kerran_ademzada | B | `74109.lua` | CREATED |
| 74111 | a_kerran_ispusar | B | `74111.lua` | CREATED |
| 74116 | Khonza Mitty of Kerra | G | `Khonza_Mitty_of_Kerra.lua` | CREATED |
| 74117 | a_kerran_sha\`rr_apprentice | A | `74117.lua` | CREATED |
| 74121 | a_kerran_pasdar | A | `74121.lua` | CREATED |

### From peq (p2002 lacks — 37 additional NPCs)

| NPCID | NPC Name | Line | Target file | Action |
|-------|----------|------|-------------|--------|
| 74000 | a_kerran_awrat | B | `74000.lua` | CREATED |
| 74001 | a_kerran_ispusar | B | `74001.lua` | CREATED |
| 74002 | a_kerran_ghulam | A | `74002.lua` | CREATED |
| 74007 | a_kerran_mamluk | A | `74007.lua` | CREATED |
| 74009 | a_kerran_awrat | B | `74009.lua` | CREATED |
| 74010 | a_kerran_mamluk | A | `74010.lua` | CREATED |
| 74011 | a_kerran_ghazi_shaman | B | `74011.lua` | CREATED |
| 74013 | a_kerran_pazdar_shaman | B | `74013.lua` | CREATED |
| 74015 | a_kerran_mujahed | B | `74015.lua` | CREATED |
| 74016 | a_kerran_mujahed | B | `74016.lua` | CREATED |
| 74021 | a_kerran_pazdar | A | `74021.lua` | CREATED |
| 74025 | a_kerran_\`amir | A | `74025.lua` | CREATED |
| 74027 | a_kerran_\`amir | A | `74027.lua` | CREATED |
| 74034 | a_kerran_ademzada_shaman | B | `74034.lua` | CREATED |
| 74035 | a_kerran_ademzada | B | `74035.lua` | CREATED |
| 74037 | a_kerran_pazdar_shaman | B | `74037.lua` | CREATED |
| 74039 | a_kerran_pazhal | A | `74039.lua` | CREATED |
| 74045 | a_kerran_ghazi\`amir | B | `74045.lua` | CREATED |
| 74046 | a_kerran_ademzada\`amir | B | `74046.lua` | CREATED |
| 74047 | a_kerran_ghazi\`amir | B | `74047.lua` | CREATED |
| 74048 | a_kerran_pazdar | A | `74048.lua` | CREATED |
| 74049 | a_kerran_pasdar | A | `74049.lua` | CREATED |
| 74053 | a_kerran_amira_guardian | B | `74053.lua` | CREATED |
| 74054 | a_kerran_amira_guardian | B | `74054.lua` | CREATED |
| 74063 | a_kerran_ispusar | B | `74063.lua` | CREATED |
| 74064 | a_kerran_ghulam | A | `74064.lua` | CREATED |
| 74077 | a_kobold_prisoner | F | `74077.lua` | CREATED |
| 74080 | a_kobold_prisoner | F | `74080.lua` | CREATED |
| 74084 | a_kerran_ghulam | A | `74084.lua` | CREATED |
| 74087 | a_kerran_pasdar | A | `74087.lua` | CREATED |
| 74095 | a_kerran_ghazi_shaman | B | `74095.lua` | CREATED |
| 74096 | a_kerran_ademzada\`amir | B | `74096.lua` | CREATED |
| 74101 | a_kerran_pazdar | A | `74101.lua` | CREATED |
| 74102 | a_kerran_pasdar | A | `74102.lua` | CREATED |
| 74103 | a_kerran_pasdar | A | `74103.lua` | CREATED |
| 74105 | a_kerran_pazdar_shaman | B | `74105.lua` | CREATED |
| 74106 | a_kerran_pazdar_shaman | B | `74106.lua` | CREATED |

## Merge / co-existence notes

- **Wislen_Mamluk.pl** (existing) already contains an `EVENT_COMBAT` random-emote block with 5 legacy variants (`"The time has come for you to die!"`, `"It is unwise of you to try that!"`, etc.) plus `EVENT_SAY`/`EVENT_ITEM`/`EVENT_DEATH`. New `Wislen_Mamluk.lua` sibling adds ONLY the p2002 ref Enter Combat line ("Rrr! Kejaan guide my claws!..."). Both fire concurrently on aggro — Wislen will emit one legacy line AND the ref line. Retained per "never remove existing" rule. Existing hail/handin/death logic untouched.
- **Feren.pl** (existing) has `EVENT_SAY` (Kerran Fishing Pole quest) + `EVENT_ITEM` (Razortooth handin). No EVENT_COMBAT. New `Feren.lua` sibling adds only Enter Combat. No collision.
- **a_banished_Kerran.pl** (74040 / 74029 stale) — no ref data for this NPC in any dir. Untouched.

## Dedupe

Refs contain heavy internal repetition (e.g. `74006_a_kerran_mamluk` has 12 identical Enter Combat lines, `74117` has 12, `74005`/`74023`/`74070`/`74073`/`74074` each have 1). Deduped to a single bark per event per NPC — no variant text existed within any single file.

## Skipped as pollution

- None. All lines are lore-consistent Kerran defenders shouting Kerran deity-invocations, and kobold prisoners barking. No cross-race pollution detected.
- No named-lore violations found (no lines out of character for peaceful cat-people driving off intruders).

## Priority conflicts

- All p2002 lines are byte-identical to Alkabor and neq counterparts (verified sample). No source-conflict merges required.
- peq-only NPCs (74000-74106 subset) use peq refs directly since higher-priority sources lack them.
