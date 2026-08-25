# Iceclad Ocean (iceclad) — Emote Import Pollution Log

Ref source priority: p2002 > Alkabor > peq > neq. All 4 ref dirs had identical files/content for iceclad — used **p2002** throughout.

## Summary

All 12 ref-provided NPCs are members of Fionna's pirate crew and share the SAME two lines:
- Enter Combat: `Take this ya lily livered landlubber!`
- Killed PC: `Dead fools tell no tales.`

This is Verant/EQLive canon — the same recycled combat barks were reused across the pirate roster. All 12 NPCs are lore-appropriate to iceclad (pirates on the icebergs), so all imported.

## Per-NPC actions

| NPCID | NPC Name | Ref file (p2002) | Target file | Action |
|-------|----------|------------------|-------------|--------|
| 110040 | Madan Eflik | 110040_Madan_Eflik.txt | `Madan_Eflik.lua` | CREATED (no prior .lua/.pl) |
| 110041 | patrolling sentry | 110041_patrolling_sentry.txt | `patrolling_sentry.lua` | CREATED (no prior .lua/.pl) |
| 110042 | pirate sentry | 110042_pirate_sentry.txt | `pirate_sentry.lua` | EDITED — added combat variant + event_slay |
| 110058 | Masurt Dok | 110058_Masurt_Dok.txt | `Masurt_Dok.lua` | EDITED — appended event_combat + event_slay |
| 110059 | Nelet Durzit | 110059_Nelet_Durzit.txt | `Nelet_Durzit.lua` | CREATED (no prior .lua/.pl) |
| 110060 | Rendap | 110060_Rendap.txt | `Rendap.lua` | CREATED (no prior .lua/.pl) |
| 110061 | gnomish pirate | 110061_gnomish_pirate.txt | `gnomish_pirate.lua` | EDITED — added combat variant + event_slay |
| 110063 | Relit | 110063_Relit.txt | `Relit.lua` | CREATED (no prior .lua/.pl) |
| 110064 | Traboh | 110064_Traboh.txt | `Traboh.lua` | CREATED (no prior .lua/.pl) |
| 110065 | Nilham the Chef | 110065_Nilham_the_Chef.txt | `Nilham_the_Chef.pl` | PATCHED perl (only .pl existed) — added EVENT_COMBAT + EVENT_SLAY |
| 110068 | Tsilos the Swabby | 110068_Tsilos_the_Swabby.txt | `Tsilos_the_Swabby.lua` | CREATED (no prior .lua/.pl) |
| 110069 | Captain Nalot | 110069_Captain_Nalot.txt | `Captain_Nalot.pl` | PATCHED perl (only .pl existed) — added EVENT_COMBAT + EVENT_SLAY |

## Merge notes

- **pirate_sentry.lua** and **gnomish_pirate.lua** already had a race-based `event_combat` ChooseRandom rant (4 variants) and an `event_death_complete` line. Wrapped existing block in `if(e.joined)` (was firing on every combat event including leave), appended `"Take this ya lily livered landlubber!"` as a 5th ChooseRandom variant, and added a new `event_slay` for the "Dead fools tell no tales." line. Existing race-rant lines preserved unchanged. Existing `event_spawn` and `event_death_complete` untouched.
- **Masurt_Dok.lua** already had a full `event_say` hail/quest dialogue tree. Appended fresh `event_combat` and `event_slay` at the bottom; existing hail logic untouched.
- **Captain_Nalot.pl** and **Nilham_the_Chef.pl** already had EVENT_SAY + EVENT_ITEM. Inserted new `EVENT_COMBAT` (guarded on `$combat_state == 1` per zone perl convention e.g. `sample.pl`) and `EVENT_SLAY` immediately before EVENT_ITEM. Existing quest logic untouched.

## Dedupe

The refs contain internal repetition (patrolling_sentry: 5 identical enter/killed pairs; pirate_sentry: 3; gnomish_pirate: 3). Deduped down to one bark per event per NPC — nothing lost, no variant text existed.

## Skipped

None. All 12 refs are pirate crew and lore-appropriate to Iceclad Ocean.

## NPCID-vs-name conflicts

None encountered. No `110040.lua`, `110041.lua`, `110058.lua`, `110059.lua`, `110060.lua`, `110061.lua`, `110063.lua`, `110064.lua`, `110065.lua`, `110068.lua`, `110069.lua` or corresponding `.pl` files existed alongside the name-based files.

## Untouched pre-existing files

Zone contained many other NPCs with no ref data (Ami, Balix_Misteyes, Errgriz, Grizlin_Bloodfang, Joshel_the_Large, Keref_Spiritspear, Ratop, Ritap, Snowfang_fisher, Sojan_the_Sleepless, Soulbinder_Cubnitskin, Adisson_Stubblechin, a_lost_pirate, a_snow_dervish, enraged_walrus, Lodizal, pirate_runners_skiff, #Boat_Watcher, #Translocator_Eniela, #Translocator_Kurione, sample, 110036, 110115, 116008, 5545). Not modified.
