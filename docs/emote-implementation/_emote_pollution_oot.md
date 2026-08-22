# Emote Pollution Log — oot (Ocean of Tears)

Zone context: open-water travel zone connecting Faydwer to Antonica via boat, dotted with islands. Populated by Pirates of Gunthak (Broken Skull Rock aftermath), the Sisterhood of Erollisi + Champions of Faydark garrison on Sister Isle, the aviak-inspired isle goblins, gnome tinkerers on the gnome isle, ogre bashers (Mudtoes), spectres, ancient cyclops, and the ghost-ship crew. Fits well with pirate / undead / island-goblin flavor.

## Source priority applied
Per NPC, first available: p2002 > Alkabor > peq > neq.

## NPCs processed

| NPC ID | Name | Source dir | Action | File |
| --- | --- | --- | --- | --- |
| 69008 | Styria Fearnon | p2002 | patched existing `.pl` | `Styria_Fearnon.pl` |
| 69014 | Larisa Gelrith | p2002 | created | `Larisa_Gelrith.pl` |
| 69017 | Tegea Prendyn | p2002 | created | `Tegea_Prendyn.pl` |
| 69019 | Glendl Vargnus | p2002 | created | `Glendl_Vargnus.pl` |
| 69020 | Hugan Tunbrin | p2002 | created | `Hugan_Tunbrin.pl` |
| 69022 | Euboea Delewyn | p2002 | created | `Euboea_Delewyn.pl` |
| 69024 | Dixl Drool | p2002 | created | `Dixl_Drool.pl` |
| 69025 | Elona Tunbrin | p2002 | created | `Elona_Tunbrin.pl` |
| 69026 | Antinime | p2002 | created | `Antinime.pl` |
| 69036 | an isle goblin | p2002 | created (shared name) | `an_isle_goblin.pl` |
| 69043 | Sister of Erollisi | p2002 | created (shared name) | `Sister_of_Erollisi.pl` |
| 69044 | Oracle of K`Arnon | p2002 | patched existing `.pl` | `Oracle_of_K-Arnon.pl` |
| 69045 | an isle goblin headhunter | p2002 | created | `an_isle_goblin_headhunter.pl` |
| 69059 | an isle goblin shaman | p2002 | created (shared name) | `an_isle_goblin_shaman.pl` |
| 69092 | Zyle Bensmill | p2002 | created (shared name) | `Zyle_Bensmill.pl` |
| 69097 | a buccaneer | p2002 | patched existing `.pl` | `a_buccaneer.pl` |
| 69099 | a spectre | p2002 | created (shared name) | `a_spectre.pl` |
| 69114 | an isle goblin warrior | p2002 | created (shared name) | `an_isle_goblin_warrior.pl` |
| 69117 | an isle goblin wizard | p2002 | created (shared name) | `an_isle_goblin_wizard.pl` |
| 69121 | Toko Binlittle | p2002 | created (shared name) | `Toko_Binlittle.pl` |
| 69129 | Gornit | p2002 | created (shared name) | `Gornit.pl` |
| 69130 | Capt Surestout | p2002 | patched existing `.pl` | `Capt_Surestout.pl` |
| 69090 | Boog Mudtoe | Alkabor (only) | created | `Boog_Mudtoe.pl` |
| 69125 | Goob Mudtoe | Alkabor (only) | created | `Goob_Mudtoe.pl` |
| 69150 | an ancient cyclops | Alkabor (only) | created (by NPC name, see notes) | `an_ancient_cyclops.pl` |
| 69064 | Nerbilik | peq (only) | patched existing `.pl` | `Nerbilik.pl` |
| 69102 | a goblin headmaster | peq (only) | created | `a_goblin_headmaster.pl` |
| 69124 | Dayle Jornin | peq (only) | created | `Dayle_Jornin.pl` |
| 69148 | isle goblin chieftan | peq (only) | created | `isle_goblin_chieftan.pl` |
| 69152 | #Kaiaren | peq (only) | already implemented | `Kaiaren.pl` |

## Precedence notes
- No Lua-shadowing conflicts. The three existing `.lua` files (`Doran_Vargnus.lua`, `Sentry_Xyrin.lua`, `Wiltin_Windwalker.lua`) target NPC names that do NOT appear in any ref dir, so no `.pl` was written for those and no Lua patching was required. (`Wiltin_Windwalker.lua` already carries the same pirate `Dead men tell no tales!!` / `You have run me through!` template; this is intentional flavor for that named pirate.)
- 69150 in the local EQEmu DB is `Boat Watcher` (existing `69150.pl` is boat-signal orchestration for the Siren's Bane), whereas Alkabor's ID 69150 is `an ancient cyclops`. Since our `.pl`s dispatch by NPC **name** not ID, the new file `an_ancient_cyclops.pl` will fire only for the cyclops mob if/when it exists in the local DB under that name. The Boat Watcher `69150.pl` was left completely untouched.
- 69152 (peq) is `#Kaiaren` (Monk Epic 2.0 sparring master). `Kaiaren.pl` already implements the exact After Death monologue ("You have done very well.. You must now travel to the heart of the discord-filled lands and obtain a Globe of Discordant Energy...") — better formatting than the ref (which had a stray comma and swapped article). No change made. The unrelated `69152.pl` is a proximity zoner to East Freeport; also left untouched.
- 69044 (Oracle of K`Arnon) — filename uses hyphen (`Oracle_of_K-Arnon.pl`) because the backtick is a shell/quest-loader gotcha. Kept existing filename.
- 69097 (a buccaneer) — existing `.pl` had only `EVENT_AGGRO` with the generic "Time to die $name." line. Replaced with the ref-authoritative Pirates of Gunthak template (Enter Combat + Leave Combat + After Death). `EVENT_AGGRO` fires slightly earlier than `EVENT_COMBAT($combat_state==1)`, but the semantic intent is identical for a spam-line and the ref template is canonical for this NPC.
- 69130 (Capt Surestout) — existing `EVENT_DEATH_COMPLETE` still spawns the lesser spirit (Shaman epic 1.0) and speaks a near-identical death line (single vs. double spacing on ellipses). Kept the epic-critical spawn + say intact and only added `EVENT_COMBAT` for Enter/Leave Combat.
- 69064 (Nerbilik) — added Enter Combat + On Death handlers above the existing hail/handin blocks; existing quest logic untouched.
- 69008 (Styria Fearnon) — added Enter Combat + After Death handlers above the existing pirate-earring / bracer-of-erollisi quest handlers; existing quest logic untouched.
- 69044 (Oracle of K`Arnon) — added Enter Combat + After Death handlers above the existing Tome of Ages / Phylactery quest handlers; existing quest logic untouched.

## Pollution / lore rejections
None. Every retained line fits the zone: Sisterhood + Champions of Faydark defending Sister Isle, Pirates of Gunthak menacing the islands, isle goblins skittering across their rock, ogre bashers referencing Oggok, an ancient cyclops guarding his ring, spectres wailing, and the Dark Bargainers (Teir'Dal) infiltrating via the Oracle. All on-theme.

## Dedupe notes
- Ref files contained heavy internal repetition (e.g. `69026_Antinime.txt` had the same 2-line Sisterhood template 10x, `69036_an_isle_goblin.txt` repeated the goblin couplet 10x). Collapsed to one Enter Combat + one Death line per NPC.
- Three big template families were reused across many NPCs and merged verbatim (single source of truth per group):
  - **Sisterhood of Erollisi** (69008, 69014, 69017, 69022, 69026, 69043, 69049, 69050, 69051) — identical Enter Combat + After Death couplet.
  - **Champions of Faydark** (69019, 69020, 69025) — identical "How dare you!" / "My comrades will avenge my death." couplet.
  - **Pirates of Gunthak** (69024, 69092, 69097, 69100, 69101, 69121, 69124, 69127, 69130, plus PEQ dupes) — identical Enter/Leave Combat + After Death triplet.
  - **Isle goblins** (69036, 69045, 69059, 69114, 69117, 69148, 69102 and PEQ dupes) — identical "Ugly creature near my feet..." / "I wiggled my fingers..." couplet.
  - **Spectres** (69099, 69039–69041, 69115) — single "Areeeeewwwww" Enter Combat line.
  - **Mudtoe ogres** (69090, 69125) — identical "Smash you..." / "Oooh!! That hurt..." couplet.
- Duplicate PEQ entries for names already covered under a p2002 ID (e.g. peq 69002 Zyle_Bensmill vs. p2002 69092 Zyle_Bensmill; peq 69007 a_buccaneer vs. p2002 69097 a_buccaneer; peq 69100 Capt_Surestout vs. p2002 69130 Capt_Surestout; peq 69042/69101 Toko_Binlittle vs. p2002 69121) collapse to a single `.pl` per NPC name — the file dispatches for **all** mobs with that name in oot, so the p2002 template covers every DB variant.

## Event mapping
- `Say -- Enter Combat` → `EVENT_COMBAT` (Perl, gated on `$combat_state == 1`).
- `Say -- Leave Combat` → `EVENT_COMBAT` else-branch (Perl, `$combat_state == 0`).
- `Say -- After Death` and `Say -- On Death` → `EVENT_DEATH_COMPLETE` (single handler; both refs point to the same lifecycle beat).
- No `Killed PC`, `Killed NPC`, `Hailed`, `On Spawn`, or `On Despawn` lines were present in any oot ref.
