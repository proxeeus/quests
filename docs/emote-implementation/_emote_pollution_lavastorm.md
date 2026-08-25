# Lavastorm Emote Pollution Log

Zone: lavastorm (Lavastorm Mountains)
Ref priority applied: p2002 > Alkabor > peq > neq

## NPCID vs NPC-name file mismatches (ref-vs-live-DB drift)

The following refs list an NPCID whose current EQEmu DB name / existing quest file wiring diverges from the ref:

- **27033 = a_burnt_protector (per ref)** but the existing `27033.pl` is a zone-safepoint proxy (from Najena → lavastorm at -1033.8,-992.4,15.8). Skipped patching `27033.pl` — the proxy NPC never enters combat; injecting EVENT_COMBAT/EVENT_DEATH_COMPLETE would be dead code and misleading. `a_burnt_protector.lua` still ships (covers NPCID 27023 and any other live a_burnt_protector spawn by name).
- **27114 = (no ref)** existing `27114.pl` is also a zone-safepoint proxy. Untouched.
- **27126 = a_lava_basilisk (per ref)** but existing `a_fire_goblin_scout.lua` is authored with a header comment "NPCID: 27126" and spawns npctypeid 27126 on death — clearly the file was written when NPCID 27126 was still named `#Scorchfist`/similar. The lua file is dispatched by CURRENT NPC name (`a_fire_goblin_scout`) so it now runs for scouts (NPCIDs 27025 / 27027 / 27048), which will 10%-spawn NPCID 27126 (currently a_lava_basilisk) on death. Behaviour is legacy/broken but PRE-EXISTING and out-of-scope; emote lines were added to the file for scout flavour without touching the spawn logic.

## Same-name multi-NPCID collisions (per-name canonical file)

Multiple NPCIDs share the same NPC name → single NPC-name file used with priority-selected text:

- `a_fire_elemental` (27020, 27030, 27039, 27043, 27055, 27059, 27070, 27128) — all refs agree on identical text. p2002 authoritative.
- `a_fire_drake` (27001, 27008, 27010) — identical text across peq + p2002. p2002 authoritative.
- `a_lava_basilisk` (27009, 27034, 27126) — TWO distinct text variants across p2002:
  - 27034: "narrows its eyes which glow with an inner heat." / "falls and begins to smolder."
  - 27126: "opens its jaws and scuttles forward." / "sinks to the ground, its scales dripping with rivulets of blood."
  Merged both into random-pick tables in `a_lava_basilisk.lua`.
- `a_lava_crawler` (27007, 27041, 27067, 27071) — identical. p2002 authoritative.
- `a_rock_dervish` (27004, 27036, 27037) — identical. p2002 authoritative.
- `a_fire_goblin_scout` (27025, 27027, 27048) — identical. p2002 authoritative. Emotes added to existing lua (which also carries legacy spawn logic — see NPCID note above).
- `a_burnt_guardian` (27013, 27014, 27022) — identical. peq authoritative.
- `a_burnt_protector` (27023, 27033) — identical. peq authoritative. Only NPCID 27023 gets the new file; 27033 skipped (proxy).
- `a_scorched_lavaspinner_elite` (27024, 27035, 27042) — identical. peq authoritative.
- `a_Solusek_goblin_sage` (27002, 27028, 27061) — identical. peq authoritative.
- `a_Solusek_goblin_fighter` (27058, 27069) — identical. peq authoritative.
- `a_fire_goblin` (27005, 27026) — identical. peq authoritative.
- `a_swirling_smoke` (27012, 27060) — identical. peq authoritative.
- `a_magma_war_drake` (27011, 27015, 27029) — identical. peq authoritative.
- `a_cinder_goblin_wizard` (27045, 27051, 27053) — identical. peq authoritative.
- `a_lesser_lavaspinner` (27000, 27021, 27054) — identical. peq authoritative. Merged with existing lua enter-combat.
- `a_greater_lavaspinner` (27032, 27049, 27057) — NEW text ("charges as its multi-faceted eyes shimmer like fire." / "oozes fiery blood across the ground.") DIFFERS from existing lua's "scuttles from the shadows." Both preserved via random-pick in existing lua.

## Filesystem case-insensitivity

- Ref `27065_a_Lavaspinner.txt` (capital L) has identical text to `a_lavaspinner.txt` (lowercase, 27064/27066). Windows filesystem treats `a_Lavaspinner.lua` and `a_lavaspinner.lua` as the same file. Single `a_lavaspinner.lua` shipped; capital-L NPCID 27065 will resolve to the same handler by case-insensitive filename match.

## Canonicalization

- Ref `27125_#Sir_Lindeal.txt` → existing file is `Sir_Lindeal.lua` (leading `#` stripped by prior authors). Merged there.
- Ref `27127_#Scorchwing.txt` → created `Scorchwing.lua` (leading `#` stripped to match repo convention seen on `Sir_Lindeal.lua`).

## Skipped

- No ref lines were dropped for lore mismatch. All Lavastorm ref content (volcanic mobs, gobs, drakes, basilisks, spinners, elementals, undead miners, Knight of Thunder captive) fits the zone.
