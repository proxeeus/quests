# Emote Pollution Log — frontiermtns

Zone: Frontier Mountains (Kunark)
Source: `C:/eqemu/ref_emotes/Emotes_neq/frontiermtns/` (neq only)
Date: 2026-08-21

## Summary

Only 1 reference file exists for this zone (neq). All entries applied. No pollution or lore-mismatches detected.

## Applied

| NPC ID | NPC (file target) | Events | Notes |
|--------|-------------------|--------|-------|
| 92002 | `a_burynai_squad_leader.lua` (created) | After Death (1 Emote) | New Lua file; no prior handler. |

## Skipped / Filtered

None.

## Naming / Target Resolution

- Ref filename `92002_burynai_squad_leader.txt` → target `a_burynai_squad_leader.lua` (lowercase `a_` NPC convention confirmed by sibling `#a_burynai_miner.pl`).
- No existing `.lua` or `.pl` found under either `a_burynai_squad_leader` or `92002` — created fresh Lua.

## Lore Check

- "is torn in a time lapse." — cryptic but consistent with Kunark/burynai flavor (time-warped Sarnak experiments). Included.
