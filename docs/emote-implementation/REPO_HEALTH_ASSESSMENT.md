# Pre-Existing Quest-Repository Health Assessment

Snapshot taken while doing the emote-implementation PR cleanup pass.
Reflects the state of `master` (baseline before this PR). Numbers exclude
anything introduced by the PR itself.

**Scope:** 4554 total `.lua` / `.pl` quest files in `master`.

## 1. Silent shadow bugs (`.lua` + `.pl` for same NPC) — 11 cases

EQEmu's quest parser registers Lua before Perl and returns the first
matching file found. When both `<NPC_Name>.lua` and `<NPC_Name>.pl`
exist in the same zone directory, **Lua wins and every handler in the
`.pl` is dead code.** No error, no log — quest logic just doesn't fire.

Same bug class as the 9 shadow cases fixed in this PR (kithicor 7 +
kerraridge 2). These predate the PR:

| Zone | Base name |
| --- | --- |
| firiona | `#Hero_Goxnok` |
| freportw | `Jyle_Windshot` |
| freportw | `Tarsa_Yovar` |
| halas | `#Field_Priest_Keven` |
| lakerathe | `Cyanelle` |
| najena | `#Rathyl` |
| qeytoqrg | `Axe_Broadsmith` |
| qeytoqrg | `Gnasher_Furgutt` |
| qeytoqrg | `Sarri_Modav` |
| qeytoqrg | `a_strange_skeleton` |
| skyshrine | `Sentry_Kale` |

For each, one of the two files is dead code. Per-file review needed to
decide which side is authoritative and consolidate.

**Fix pattern (mirrors what we did in this PR):**
1. Inspect both files. Identify which handlers exist in each.
2. If the `.pl` has quest logic (item handins, hail dialogue, spawn
   hooks) and the `.lua` just has extra emote / combat text: patch the
   `.pl` in perl syntax to add the emote handler and delete the `.lua`.
3. If the `.lua` has been actively maintained (recent commits, more
   sophisticated logic): port the `.pl` logic into the `.lua`, then
   delete the `.pl`. Migration checklist: `EVENT_SAY` → `event_say`,
   `EVENT_ITEM` handin → `items.check_turn_in` in lua's `event_trade`,
   `quest::spawn2` → `eq.spawn2`, `quest::signal` → `eq.signal`, etc.

## 2. Numeric-NPCID quest files — 246 total

Files named `<NPCID>.lua` / `<NPCID>.pl` rather than `<NPC_Name>.<ext>`.
The parser looks these up before name-based files (see
`GetQIByNPCQuest`), so they take precedence when both exist.

Top zones:

| Zone | Count |
| --- | --- |
| airplane | 44 |
| eastwastes | 37 |
| nektulos | 22 |
| befallen | 18 |
| timorous | 12 |
| crushbone | 11 |
| soltemple | 10 |
| lakeofillomen | 9 |
| butcher | 8 |
| freporte | 7 |
| qeynos | 5 |
| erudsxing | 5 |
| tox / southkarana / oot | 4 each |

**Of those 246, 37 have IDs that do not exist in `npc_types` at all**
— dead files. Sample:

```
arena/78252, befallen/4953, cobaltscar/6709,
cshome/122380, cshome/122382,
emeraldjungle/6289, everfrost/4881, freporte/2684,
halas/5547, halas/5751, iceclad/5545,
kaladima/6194, lakeofillomen/5139, lakeofillomen/5841,
lfaydark/57140, lfaydark/5796,
overthere/5637, overthere/6475,
qeynos/2160, qeynos/3702, ...
```

**The other 209 map to real IDs, but many hook logic to unintended
NPCs.** Example:

```
airplane/552 → NPC "SumAirR2"  (summoned raid participant)
airplane/553-566 → SumAirR3..R16
airplane/614 → NPC "skel_pet_1_"
airplane/615 → skel_pet_5_
airplane/616-635 → skel_pet_9_..73_
```

These read like quest scripts (based on filename comments) but the ID
actually resolves to a placeholder / summoned pet in the DB. Whatever
logic is inside those files fires for the wrong NPC. Recommend a
per-file audit: read the header comment / logic, look up the DB name
for the ID, decide if the file should be renamed to `<Name>.<ext>`,
deleted as dead code, or kept as-is because the ID mapping is
intentional.

## 3. Name-based orphans (case-sensitive DB miss) — 58 files

Files whose base name (converted backtick↔dash) doesn't appear in
`npc_types.name`. Breakdown:

**~17 are trivial case-mismatch fixes** — the DB has the NPC with
different capitalization:

| File | DB name |
| --- | --- |
| `commons/orc_centurion.lua` | `Orc_Centurion` |
| `crushbone/orc_centurion.lua` | `Orc_Centurion` |
| `ecommons/orc_centurion.lua` | `Orc_Centurion` |
| `gfaydark/orc_centurion.pl` | `Orc_Centurion` |
| `crushbone/Orc_Scoutsman.lua` | (case variant of `orc_scoutsman`) |
| `crushbone/Orc_Warden.lua` | (case variant) |
| `crushbone/orc_trainer.lua` | (case variant) |
| `crushbone/orc_taskmaster.lua` | (case variant) |
| `crushbone/orc_warlord.lua` | (case variant) |
| `crushbone/The_Prophet.lua` | (case variant) |
| `crushbone/Lord_Darish.lua` | (case variant) |
| `eastwastes/a_Coldain_lookout.pl` | `a_coldain_lookout` |
| `cabwest/an_Iksar_hermit.pl` | `an_iksar_hermit` |
| `highpass/a_Highpass_Citizen.lua` | `a_highpass_citizen` |
| `frozenshadow/#Incoherent_spirit.pl` | `incoherent_spirit` |
| `kael/A_gust_of_wind.lua` | `a_gust_of_wind` |
| `kael/The_sound_of.lua` | (variant) |
| `hole/Protector_of_the_ruins.pl` | (case variant) |
| `iceclad/#Boat_Watcher.pl` | (case variant) |
| `hateplane/#Grandmaster_R-tal.lua` | (case variant) |
| `hateplane/#Magi_P-tasa.lua` | (case variant) |
| `hateplane/an_elite_dragoon.lua` | (case variant) |
| `erudnext/Geoard_Bluehawk.lua` | (case variant) |
| `fieldofbone/#an_iksar_manslayer.pl` | (case variant) |

**Fix:** rename to match the DB name exactly. On Windows this requires
a two-step git rename (`git mv old temp; git mv temp new`) because the
filesystem is case-insensitive.

**~41 are truly orphaned** — no case-insensitive match either. Sample:

```
airplane/71107_____.lua           (numeric-prefix junk name)
befallen/the_thaumaturgist.pl
befallen/Wraps_McGee.lua
befallen/Flighty_Rose_Wisp.lua
cauldron/#Captain_Klunga.lua
dreadlands/Kunark_Spires.lua
charasis/the_spirit_of_Rile.pl
akanon/Clockwork_MM.lua
akanon/Morlan_Tanlonikan.lua
akanon/Reuben_Reldnok.lua
akanon/Exterminator_VII.pl
arena/Soulbinder_Gendal.lua
cobaltscar/Cedrick.pl
cobaltscar/Yoppa_Greenthumb.pl
commons/a_Broken_Claw_Bandit.pl
```

Full list at `/tmp/master_orphans.txt` when the analysis was run. Each
needs a per-file decision: NPC was renamed / deleted / never spawned
→ file can go; or NPC exists under a completely different name → merge
into the correct file.

**Note:** `player.lua` / `player.pl` files at various zones are
legitimate zone-specific player-event overrides, not orphans. My
tooling flagged them as "no matching NPC" but that's expected — they
hook into `EVENT_PLAYER_*` hooks, not per-NPC.

**Test / dev stubs** are also in the orphan list and are candidates
for deletion:
- `butcher/#Tester.pl`
- `droga/2r.pl`

## Recommended cleanup order

If you want to tackle these systematically:

1. **Shadow bugs (11)** — highest impact per fix. Silent quest breakage.
2. **Case-mismatch orphans (17)** — mechanical, low-risk, biggest bang
   for effort (every one of these means a broken hook right now).
3. **Numeric-ID files pointing at wrong NPCs** — needs per-file audit
   but likely lots of dead code (airplane summoned-raid IDs, skel_pet
   IDs).
4. **37 numeric-ID files with no DB match** — safe to delete after
   reading their headers to confirm they're not doing anything the DB
   needs (e.g. spawning a placeholder that's still referenced by
   another quest).
5. **41 truly-orphaned name-based files** — usually safe to delete
   after quick header-comment inspection.

## Assessment tooling used

For reproducibility, these are the commands that produced the above:

```bash
# Master baseline file list (root-level zone files only)
git ls-tree -r master --name-only |
  grep -E '\.(lua|pl)$' |
  awk -F/ '{if(NF==2) print}' > master_files.txt

# 1. Shadow bugs
awk -F. '{print $1}' master_files.txt | sort | uniq -d

# 2. Numeric NPCID files
awk -F/ '{split($2,a,"."); if(a[1] ~ /^[0-9]+$/) print $1"/"a[1]}' \
  master_files.txt

# 2a. Which numeric IDs don't resolve in DB
mysql -N -e 'SELECT id FROM npc_types;' > db_ids.txt
# then loop each ID from step 2 and grep -Fxq

# 3. Name-based orphans (case-sensitive DB miss)
mysql -N -e 'SELECT DISTINCT name FROM npc_types;' > db_npcs.txt
# for each non-numeric base name from master_files.txt:
#   convert dash→backtick, strip optional leading #
#   grep -Fxq against db_npcs.txt
#   if no hit → orphan

# 3a. Case-only mismatch subset
tr '[:upper:]' '[:lower:]' < db_npcs.txt | sort -u > db_npcs_lower.txt
# same as #3 but grep against db_npcs_lower with lowercase base name;
# hits here that missed the case-sensitive check are case-only fixes
```

Run these against `master` any time to get a fresh snapshot.
