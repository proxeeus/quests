# Emote Pollution / Anomaly Log — guktop (Upper Guk)

Generated during ref-dump import for zone `guktop`.

## Ref dirs surveyed
- `C:/eqemu/ref_emotes/Emotes_p2002/guktop/` — 35 files
- `C:/eqemu/ref_emotes/Emotes_Alkabor/guktop/` — 35 files
- `C:/eqemu/ref_emotes/Emotes_peq/guktop/` — 101 files (superset)
- `C:/eqemu/ref_emotes/Emotes_neq/guktop/` — 35 files

Priority order applied per NPC: **p2002 > Alkabor > peq > neq**.

## Content uniformity
100% of every file in every ref dir contains exclusively:

```
Say -- Enter Combat: Frrroooaaakkk!
```

Repeated N times per file (internal duplicates trivially deduped to a single entry).

No other events observed across all 4 dirs and all NPCs:
- No Leave Combat, On Death, After Death, Killed PC, Killed NPC, Hailed, On Spawn, On Despawn
- No Emote or Shout lines
- No `$name` interpolations
- No variant combat lines (no "Kroaaak!", no faction-specific taunts)

## Existing state pre-import
All 33 pre-existing `.lua` files in `C:/eqemu/quests/guktop/` (mob NPCs) already implement the exact target handler verbatim:

```lua
function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Frrroooaaakkk!");
	end
end
```

No merges / no ChooseRandom refactors required — existing single-Say already matches the ref content.

## Files created (5 net-new NPCs missing from quests/ but present in ref)
| NPC (name-based file) | Ref IDs (peq) | Rationale |
|---|---|---|
| `a_froglok_sentinel.lua` | 65045, 65048, 65091 | Present in all 4 ref dirs; no prior quest file |
| `a_froglok_neophyte.lua` | 65046, 65090, 65141 | Present in all 4 ref dirs; no prior quest file |
| `a_froglok_priest.lua`   | 65066, 65108 | Present in all 4 ref dirs; no prior quest file |
| `a_froglok_realist.lua`  | 65105 | Distinct from existing `a_froglok_shin_realist.lua` (different clan) |
| `the_froglok_warden.lua` | 65104 | Distinct from existing `the_froglok_shin_warden.lua` (different clan) |

Each new file contains the identical minimal `event_combat` handler above.

## Name-collision / clan disambiguation note
The `_shin_` middle-word variants (`a_froglok_shin_realist`, `the_froglok_shin_warden`) are DIFFERENT NPCs from their non-`shin` counterparts (`a_froglok_realist` = 65105, `the_froglok_warden` = 65104). Both sets exist in DB; quest files must remain separate. Confirmed by:
- ref filename NPC-name field (identity source)
- pre-existing `.lua` uses `_shin_` names for one set of NPCID rows

## NPCs skipped (in quests/ but NOT in ref — no ref data to import)
No action taken — existing files untouched per "never remove existing" rule.
- `a_saltwater_croc.lua`, `an_ancient_croc.lua`, `croc_trigger.lua` — snakes/crocs (no ref entry; keep as-is)
- `an_old_froglok.lua` — quest NPC with dialogue (no ref entry)
- `a_froglok_tal_shaman.lua` — has ref only in peq (present, imported already)
- `a_froglok_vis_knight.lua` — no ref entry in any dir; keep as-is

## Naming rules applied
- `a_*` / `an_*` / `the_*` NPCs: lowercase filenames (matches existing convention in this zone).
- Target resolution: only `.lua` files exist here — no `.pl` collisions.

## Pollution / red flags
- **Massive internal duplication in ref files**: many files repeat the identical line 30-60 times. Trivially deduped. This appears to be sampling noise from live-server dumps (same mob shouting on every combat entry).
- **Zero variety in ref set**: unusual — most Kunark zones ship at least a few variant taunts. Guktop frogloks apparently only ever croak. Treated as canonical, not as missing data.
- **peq contains ~66 extra NPCID rows** (65001-65099 range) beyond the 35 shared by p2002/Alkabor/neq. All map to name-duplicates of the same 35 NPC-name set, so no new name-based files are induced by peq's superset.
- **Priority irrelevance**: because all 4 dirs contain identical content, priority ordering (p2002 > Alkabor > peq > neq) produces the same result regardless of which dir "wins". Documented for methodology audit only.

## Not done / follow-up
None. Zone is at ref parity after the 5 net-new files.
