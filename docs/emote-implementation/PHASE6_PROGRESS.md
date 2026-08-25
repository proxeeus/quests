# Phase 6 Progress: `foo` + `#foo` sibling pair cleanup

**Status:** IN PROGRESS
**Pattern:** `.lua` or `.pl` files where both `<Name>.<ext>` and `#<Name>.<ext>` exist in the same zone. Same silent-shadow class as Phase 1, but with `#`-prefix mismatch. Per-pair DB check needed to decide which side is authoritative.

**How to resume:** find the first row with status `PENDING` — that's where to pick up. Rows marked `AUTO-DONE` were resolved by the batch DB-check (both variants exist in DB → both files valid, intentional 2-stage quest chains).

| # | Zone | Base name | Status | Decision / notes |
| --- | --- | --- | --- | --- |
| 1 | citymist | Lhranc | DONE | Both DB NPCs exist (90093, 90187) — intentional 2-stage SK Epic 1.0 (Lhranc summons #Lhranc, #Lhranc on death spawns Marl Kastane). Kept both. |
| 2 | droga | an_iksar_slave | DONE | Both DB NPCs exist. `an_iksar_slave` (171033+) = Veltar / Monk 3rd-rung shackle quest; `#an_iksar_slave` (81335) = Digalis / Shaman Cudgel quest. Kept both. |
| 3 | eastwastes | Captain_Berradin | DONE | Both DB NPCs exist (116098, 116606). Sober captain drinks Avalanche Ale → spawns drunk `#Captain_Berradin`. Kept both. |
| 4 | eastwastes | Garadain_Glacierbane | DONE | Both DB NPCs exist (116084, 116577). Coldain Ring Quest 1-8: main quest-giver vs war-leader battle phase. Kept both. |
| 5 | eastwastes | Peffin_Ambersnow | DONE | Both DB NPCs exist (116107, 116607). `#Peffin` = combat encounter variant that spawns 5 guards. Kept both. |
| 6 | freportw | Sir_Lucan_D-Lere | AUTO-DONE | Both DB NPCs exist. Classic Sir Lucan → undead transformation. Kept both. |
| 7 | frontiermtns | a_goblin_traitor | AUTO-DONE | Both DB NPCs exist. Kept both. |
| 8 | frozenshadow | a_ghostly_student | AUTO-DONE | Both DB NPCs exist (multiple spawns). Kept both. |
| 9 | frozenshadow | a_shadowbone | AUTO-DONE | Both DB NPCs exist. Kept both. |
| 10 | frozenshadow | a_shrouded_bat | AUTO-DONE | Both DB NPCs exist. Kept both. |
| 11 | frozenshadow | a_skeleton_sleeper | AUTO-DONE | Both DB NPCs exist. Kept both. |
| 12 | frozenshadow | an_enraged_vampire | AUTO-DONE | Both DB NPCs exist. Kept both. |
| 13 | greatdivide | Fergul_Frostsky | AUTO-DONE | Both DB NPCs exist (resolved during Phase 5 shardwurm work). Kept both. |
| 14 | greatdivide | Gralk_Dwarfkiller | AUTO-DONE | Both DB NPCs exist (resolved during Phase 5 shardwurm work). Kept both. |
| 15 | greatdivide | Murdrick_Tardok | AUTO-DONE | Both DB NPCs exist as `#Murdrick_Tardok` + `##Murdrick_Tardok`. Kept both. |
| 16 | halas | Shanis_MacDarren | DONE | Berserker guildmaster (out of era). User nuked spawn. Both files deleted. |
| 17 | innothule | Sugal_The_Fist | DONE | Froglok Monk guildmaster (LoY, out of era). User nuked spawn. Both files deleted. |
| 18 | jaggedpine | Guard_Finewine | DONE | Qeynos Badge #5 quest (out of era). Both files deleted. |
| 19 | jaggedpine | Sergeant_Caelin | DONE | Same Qeynos Badge #5 quest (out of era). Both files deleted. |
| 20 | kael | Doldigun_Steinwielder | AUTO-DONE | Both DB NPCs exist as `#Doldigun` + `##Doldigun`. Kept both. |
| 21 | lavastorm | Ruathey | DONE | Paladin Ghoulbane quest (classic). `#Ruathey.pl` has fuller content and matches DB. Non-`#` orphan deleted. |
| 22 | mischiefplane | Lithiniath | AUTO-DONE | Both DB NPCs exist. Kept both. |
| 23 | qeynos | Guard_Sylus | DONE | Only `#Guard_Sylus` in DB. Non-`#` orphan deleted. |
| 24 | qeynos | Lanhern_Firepride | DONE | User imported `#Lanhern_Firepride` (drunk tavern-donation NPC) from p2002. Both files now wired. |
| 25 | skyshrine | a_kromzek_spy | AUTO-DONE | Both DB NPCs exist. Kept both. |
| 26 | skyshrine | Sentry_Kale | AUTO-DONE | 3-way: `Sentry_Kale` + `#Sentry_Kale` + `##Sentry_Kale` all exist in DB. Already handled in Phase 1. Kept all. |
| 27 | southkarana | an_elephant_calf | AUTO-DONE | Both DB NPCs exist. Kept both. |
| 28 | southkarana | a_lioness | AUTO-DONE | Both DB NPCs exist. Kept both. |
| 29 | thurgadina | Loremaster_Sarl | AUTO-DONE | Both DB NPCs exist as `#Loremaster_Sarl` + `##Loremaster_Sarl`. Kept both. |
| 30 | trakanon | Kaiaren | AUTO-DONE | Both DB NPCs exist. Kept both. |

**Status legend:**
- PENDING — not yet reviewed
- DONE — reviewed and resolved (see decision column)
- AUTO-DONE — batch-resolved (both variants exist in DB → both files valid)
- SKIPPED — user chose to defer or file was already resolved

**Note:** Original scan reported 32 pairs but 2 were already resolved during Phase 5 (Sentry_Kale in Phase 1, Fergul/Gralk during shardwurm work). Actual pending count: 30. After batch DB check: 23 auto-resolved, 7 need review.
