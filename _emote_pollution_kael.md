# Kael Drakkel Emote Pollution / Import Notes

Zone: **kael** (Kael Drakkel, Velious Kromzek/Kromrif capital).

Ref sources scanned (priority p2002 > Alkabor > peq > neq; peq empty):
- `C:/eqemu/ref_emotes/Emotes_p2002/kael/` (~119 files, all "Enter Combat" only)
- `C:/eqemu/ref_emotes/Emotes_Alkabor/kael/` (~247 files, superset of p2002; adds guards/watch sergeants)
- `C:/eqemu/ref_emotes/Emotes_neq/kael/` (~120 files, subset of Alkabor; never used as fallback)

## Summary
Ref data is exclusively **Enter Combat** across every file (verified with grep for
Leave/Death/Hailed/On Spawn/etc — zero hits). Almost every existing kael quest lua
already carries the correct combat line matching ref; this pass is largely a **gap
fill** for NPCs that had no quest file yet, plus two `.pl` combat-line patches.

## Canonical combat text buckets (dedupe verified across all refs)
- Kromzek units: `Say: "Your bones will be crushed by the Kromzek of Kael Drakkel!"`
- Kromrif units: `Say: "Your bones will be crushed by the Kromrif of Kael Drakkel!"`
- Zek-temple guardians: `Say: "How dare you tread on this holy ground?!"`
- Drakkel/direwolves: `Emote: growls and lunges at you!`
- Berserker: `Emote: howls and charges!`
- Commoners: `Say: "I am no warrior but you will pay!"`
- Kromrif recruiter: `Say: "I will show them all that I am a true Kromrif warrior!"`
- Arena spectator: `Say: "How dare you interrupt the games!"`
- Sorcerer / storm noble: `Say: "I will wash my hands of your blood when I am done!"`
- Priest / cleric of Zek: `Say: "You will not defile our temple!"`
- Merchants (Kellek/Weyrevar/Bjorak/Svekk): `Say: "Only a fool would attack a merchant in the city of Kael Drakkel!"`
- Named uniques (Tormax Shout, Tuuak fish, Vkjor arms, Wenglawks regret, Slaggak
  trainer, Fjokar fate, Keldor mistake, Kallis fool's death, Reivaj Rallos-power,
  Derakor Rallos shout + "Only the strong will survive")

## Files created (new lua added, no prior lua/pl)
p2002-priority combat lines used. Naming follows kael convention: `#Watch_Sergeant_*`
prefix for the septet family (matches sibling `#Watcher_Sergeant_*` files),
`#Sergeant_*` for standalone sergeants, `Guard_Kkrean` (no `#` — matches ref file
`113019_Guard_Kkrean.txt` capitalization).

- `Guard_Kkrean.lua` — 113019 (Kromrif line)
- `#Watchman_Bloodrune.lua` — 113048 (Kromrif line)
- `#Watch_Sergeant_Mjaek.lua` — 113009 (Kromrif line)
- `#Watch_Sergeant_Kredrer.lua` — 113011 (Kromrif line)
- `#Watch_Sergeant_Icestrider.lua` — 113110 (Kromrif line)
- `#Watch_Sergeant_Vedravik.lua` — 113129 (Kromrif line). Distinct from existing
  `#Watchman_Vedravik.lua` (113236); two NPCs share the surname on Alkabor.
- `#Watch_Sergeant_Feljar.lua` — 113134 (Kromrif line)
- `#Watch_Sergeant_Deraekk.lua` — 113272 (Kromrif line)
- `#Watch_Sergeant_Reldryel.lua` — 113298 (Kromrif line)
- `#Watch_Sergeant_Tlygrerion.lua` — 113299 (Kromrif line)
- `#Watch_Sergeant_Coldbones.lua` — 113455 (Kromrif line)
- `#Watchman_Berakor.lua` — 113176 (Kromzek line)
- `#Sergeant_Squallsounder.lua` — 113278 (Kromzek line)
- `#Lieutenant_Nvellor.lua` — 113274 (Kromrif line)
- `a_Kromrif_wolf_master.lua` — 113253 (Kromrif line — Kromrif giant handler)

## Files patched (existing .pl kept, combat handler updated)
Rule: when only `.pl` exists, patch perl (never add sibling `.lua`).

- `Yetarr.pl` — 113247, added `sub EVENT_COMBAT` with ref Kromzek line (Yetarr is
  the Kromzek noble hunting Coldain leaders; file previously had no combat block).
- `Derakor_the_Vindicator.pl` — 113118, converted `EVENT_ATTACK` shout to
  `EVENT_COMBAT` and added the unlabeled Alkabor Say `"Only the strong will
  survive."` as a `ChooseRandom` between the two ref lines. Kept EVENT_ATTACK
  removed so we don't double-fire on aggro.

## Files intentionally NOT modified
Every other Kael NPC already carries the correct `event_combat` line matching
p2002/Alkabor ref data. Verified spot-checks across ~40 handlers (guards,
watchmen, chanters, sentinels, adjutants, troopers, veterans, watchers, sergeants,
merchants, priests, arena spectators, direwolves, commoners, recruiters,
berserkers, uniques). No corrections were required.

Notable pre-existing correct handlers:
- Named uniques: `King_Tormax.lua`, `Tuuak.lua`, `Vkjor.lua`, `Wenglawks_Kkeak.lua`,
  `Kallis_Stormcaller.lua`, `Noble_Helssen.lua`, `Kellek_Felhammer.lua`,
  `Bjrakor_the_Cold.lua`, `Bjorak_Stonefist.lua`, `Reivaj_the_Battlerager.lua`,
  `Weyrevar_Bluehammer.lua`, `Svekk_Fangbinder.lua`, `Semkak_Prophet_of_Vallon.pl`,
  `Fjokar_Frozenshard.pl`, `Keldor_Dek-Torek.lua`, `Gkrean_Prophet_of_Tallon.lua`,
  `Vealok_the_Angry.lua`, `Nojas_Blackfist.lua`, `Slaggak_the_Trainer.pl`,
  `Captain_Bvellos.pl`, `Staff_Sergeant_Drioc.lua`.
- Bucket handlers: `a_Drakkel_Dire_Wolf`, `a_domesticated_direwolf`,
  `a_frost_giant_berserker`, `a_frost_giant_commoner`, `a_storm_giant_commoner`,
  `a_Frost_Giant_Lord`, `a_kromzek_sorcerer`, `a_visiting_noble`,
  `a_priest_of_Tallon_Zek`, `a_priest_of_Vallon_Zek`, `a_cleric_of_Tallon_Zek`,
  `a_cleric_of_Vallon_Zek`, `a_kromrif_recruiter.pl`, `Armor_of_Zek`,
  `a_guardian_of_Zek`, `protector_of_Zek`, `113181.lua` + `113182.lua` (arena
  spectators, ID-based files).

## Duplicate spawn IDs
Ref shows several NPCs on multiple spawn IDs sharing a name+text bucket:
- `a_kromrif_recruiter` — 113366 + 113602 (same combat line, one `.pl` file
  serves both since the target lookup is by NPC name not spawn ID).
- `a_frost_giant_commoner` — 113296 + 113600 (single `a_frost_giant_commoner.lua`).
- `a_storm_giant_commoner` — 113362 + Alkabor variant (single lua).
- `an_arena_spectator` — 113182 + 113598 (kael has two ID-based files:
  `113181.lua`, `113182.lua` — Alkabor 113598 shares the same combat line so
  falls through to existing bucket handler when it spawns).
- `#Adjutant_Frinvan` (113092 Alkabor) vs `#Adjutant_Frinevrn` (113092 p2002 — note
  spelling differs). Both existing `.lua` files kept; content already matches.

## Duplicate lua files (name+ID coexist)
- `_#Lieutenant_Bloodeye.lua` and `_#Watcher_Yeldor.lua` — underscore-prefixed
  files exist alongside potential name-based lookups. Both contain correct combat
  lines already; edited neither (existed pre-run).
- `##Doldigun_Steinwielder.lua` (double-hash) vs `#Doldigun_Steinwielder.lua` +
  `Doldigun_Steinwielder.pl` — three files for the same NPC family. Not touched;
  no ref data for these IDs anyway.

## Lore judgment (skips)
None. All Kael residents worship Rallos Zek / serve Tormax; every ref line
passes the "is this a Kromzek/Kromrif line or the arena/wolf/temple context"
sniff test. Zero skips.

## Ref-format quirks encountered
- Alkabor sometimes emits an **unlabeled** Say/Emote after the labeled block.
  Only two hits in kael: 113118 Derakor `Say -- : Only the strong will survive.`
  and 113215 King Tormax `Say -- : I will bring more glory to the city of Kael
  Drakkel!`. Per rules unlabeled → Enter Combat.
  - Derakor: merged into new `event_combat` ChooseRandom (fresh handler).
  - Tormax: p2002 has 113215 (Shout only). Priority p2002 wins per rules — the
    Alkabor unlabeled line is NOT merged (would violate the per-NPC priority
    resolution). Logged here for visibility.
- Every ref file across all three sources contains only "Enter Combat" events;
  no Death, Slay, Hail, Spawn, Depop content in kael.
