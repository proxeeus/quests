# Solusek's Eye (soldunga) — Emote/Flavor Pollution Log

Ref dirs available: Alkabor only. Priority: Alkabor.

## Lore filter — nothing skipped as clearly-wrong

Solusek's Eye upper mines: dwarven outpost overrun by Fire Peak goblins (kobold-adjacent), fire elementals, efreetis, and gnomish clockwork constructs (CWG models — Clockwork Gnome variants). All 30 referenced NPCs fit the zone's lava-mine/fire-cult theme. Included in full.

## Skipped / GM-only NPCs

- none

## Duplicate / cross-ref notes

The zone has three homogeneous ref templates — every ref file consists of pure repetition of one line pair. This is the classic "one NPC copy per spawn cluster" pattern.

**Template A — Fire Peak goblin combat rally** (`Say -- Enter Combat: Die by lava - Die by flame - Fire Peak goblins kill and maim.`)
Applied to all goblin NPCs. All targets already had this event_combat implemented pre-run:
- 31019 inferno_goblin, 31021 fire_goblin_wizard, 31026 young_goblin_shaman, 31028 cinder_goblin, 31040 fire_goblin, 31044 flame_goblin_shaman, 31045 inferno_goblin_shaman, 31046 flame_goblin, 31047 goblin_merchant, 31087 young_goblin_wizard, 31091 Solusek_goblin, 31099 Solusek_champion, 31101 Solusek_mage, 31102 Solusek_priest, 31104 fire_goblin_shaman, 31109 flame_goblin_wizard, 31111 inferno_goblin_wizard, 31114 young_goblin, 31134 inferno_goblin_captain, 31145 inferno_goblin (dup name 31019), 31147 cinder_goblin (dup name 31028), 31149 fire_goblin (dup name 31040), 31151 flame_goblin (dup name 31046), 31157 young_goblin (dup name 31114). No edit needed.

**Template B — Clockwork gnome construct combat noise** (`Say -- Enter Combat: Click...whir...whir...click!`)
Applied to CWG_Model_* NPCs (Clockwork Gnome constructs — abandoned gnomish mining machinery reactivated by the fire cult). All targets already had this event_combat implemented pre-run:
- 31048 CWG_Model_CX, 31052 CWG_Model_MB, 31056 CWG_Model_MA, 31057 CWG_Model_XA, 31061 CWG_Model_CA, 31065 CWG_Model_XC, 31066 CWG_Model_CB, 31083 CWG_Model_MC, 31107 CWG_Model_XB, 31118 CWG_Model_EXG. No edit needed.

**Template C — generic monster guard rally** (`Say -- Enter Combat: Time to die $name.` + `Say -- After Death: My comrades will avenge my death.`)
Applied to the three exile/elemental non-goblin combatants. NEW lua files created.

## Merge decisions

- **Lynada_the_exiled (31001)** — dwarven exile boss NPC. No pre-existing handler. Created new lua with the generic guard rally (Template C) — verbatim ref template. Race-plural insult flavor (as used in gnomish_conjurer / Marfen_Binkdirple) was NOT applied — ref uses the plain `$name` form.
- **blazing_elemental (31006)** — fire elemental. No pre-existing handler. Created new lua with Template C verbatim.
- **reckless_efreeti (31085)** — efreeti / fire elemental. No pre-existing handler. Created new lua with Template C verbatim.

## Files touched

Created new `.lua` files (no `.pl` exists for any of these NPCs — safe to add per Lua-shadows-Perl rule):

- Lynada_the_exiled.lua
- blazing_elemental.lua
- reckless_efreeti.lua

Patched existing files: none — all 27 already-existing goblin / CWG / Solusek_* / Marfen / bipnubble / gnomish_* files already carried their ref-correct emotes verbatim from prior passes.

## Duplicate/orphan quest files noticed

- **CWG_Model_CC.lua**, **CWS_Model_SX.lua**, **large_fire_goblin.lua**, **fire_goblin_bartender.lua**, **flame_goblin_foreman.lua**, **goblin_drunkard.lua**, **goblin_high_shaman.lua**, **inferno_goblin_torturer.lua**, **cinder_goblin_shaman.lua**, **cinder_goblin_wizard.lua**, **Solusek_goblin_king.lua**, **Lord_Gimblox.lua** — lua handlers present in quests dir but no matching Alkabor ref file. Left as-is (out of scope — pre-existing content is either dev-added, sourced from other refs, or targets NPCs absent from Alkabor snapshot).
- ref NPCID 31145 / 31147 / 31149 / 31151 / 31157 are duplicate-name entries for existing inferno/cinder/fire/flame/young_goblin — same handler covers both spawns (name-based lua dispatch).
