# Nagafen's Lair (soldungb) — Emote/Flavor Pollution Log

Ref dirs available: Alkabor only. Priority: Alkabor.

## Lore filter — nothing skipped as clearly-wrong

Nagafen's Lair (Solusek's Eye lower): lava dungeon populated by Solusek/greater kobolds (kobold cultists of the fire god), a lava guardian (fire elemental), efreetis (Djarn), guano harvesters (Fire Peak goblin miners), and Lord Nagafen the ancient red dragon. All 10 referenced NPCs are in-theme (kobold barks, elemental/efreeti guard rally, goblin fire-cult chant). Included in full.

## Skipped / GM-only NPCs

- none

## Duplicate / cross-ref notes

Two homogeneous ref templates dominate the zone — every ref file is repetition of one line pair. Classic "one NPC copy per spawn cluster" pattern.

**Template A — kobold combat bark** (`Say -- Enter Combat: Grrrrr. Bark. Bark. Grrrrr.`)
Applied to all kobold-type NPCs. All targets already have this event_combat line implemented pre-run (as first entry of a ChooseRandom triple with two modern flavor additions):
- 32006 greater_kobold, 32009 Solusek_kobold, 32011 greater_kobold_shaman, 32044 Solusek_kobold_shaman, 32045 kobold_champion, 32059 kobold_priest, 32060 a_greater_kobold. No edit needed.

**Template B — generic guard rally** (`Say -- Enter Combat: Time to die $name.` + `Say -- After Death: My comrades will avenge my death.`)
Applied to the two elemental/efreeti non-kobold combatants. NEW lua files created (verbatim ref template, matches soldunga Lynada_the_exiled / blazing_elemental / reckless_efreeti pattern).

**Template C — Fire Peak goblin combat rally** (`Say -- Enter Combat: Die by lava - Die by flame - Fire Peak goblins kill and maim.`)
Same string as Alkabor soldunga Template A. Applied to the sole goblin NPC in this zone (guano_harvester). NEW lua file created.

## Merge decisions

- **lava_guardian (32033)** — fire elemental guardian. No pre-existing handler. Created new lua with Template B verbatim (Say on Enter Combat + Say on After Death via event_death_complete).
- **Efreeti_Lord_Djarn (32062)** — named efreeti mini-boss. No pre-existing handler. Created new lua with Template B verbatim. Ref template is generic (no unique lore lines in Alkabor dump) — used as-is.
- **guano_harvester (32068)** — Fire Peak goblin miner. No pre-existing handler. Created new lua with Template C verbatim.
- All seven Template-A kobold NPCs already had "Grrrrr. Bark. Bark. Grrrrr." as first ChooseRandom entry with two extra modern flavor lines ("Your foul deeds have earned my contempt.", "I shall rid the land of another infamous villain.") plus a corpse-crumples emote on death_complete. Superset of ref — LEFT AS-IS (per merge rule: pre-existing content that includes ref line verbatim is compatible, no rewrite needed).

## Files touched

Created new `.lua` files (no `.pl` exists for any of these NPCs — safe to add per Lua-shadows-Perl rule; only pre-existing .pl in zone is Zordak_Ragefire.pl which has no ref file):

- lava_guardian.lua
- Efreeti_Lord_Djarn.lua
- guano_harvester.lua

Patched existing files: none — all seven pre-existing kobold lua files already carry the ref-correct bark verbatim from prior passes.

## Duplicate/orphan quest files noticed

- **kobold_noble.lua**, **a_kobold_advisor.lua**, **a_kobold_guardian.lua** — kobold handlers present in quests dir but no matching Alkabor ref file. All carry the same Template A kobold bark ChooseRandom. Left as-is (out of scope — pre-existing content is either dev-added or sourced from other refs; targets NPCs absent from this Alkabor snapshot).
- **Lord_Nagafen.lua** — no ref file; contains level-53-cap banishment logic and Sleeper-awakened Shout signal. Left as-is (mechanic, not emote pollution).
- **Targin_the_Rock.lua** — no ref file; contains its own Enter-Combat monologue. Left as-is.
- **Solusek_kobold_king.lua** — no ref file; uses Template A bark. Left as-is.
- **Zordak_Ragefire.pl** + **#Zordak_Ragefire.lua** — .pl is the active handler (Hail + Shimmering Pearl handin → spawn 32084 KOS human form + depop). The `#Zordak_Ragefire.lua` file is name-prefixed with `#` (disabled/commented) so it does NOT shadow the .pl. Left untouched per critical rule.
