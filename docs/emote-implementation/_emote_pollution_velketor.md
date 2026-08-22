# Velketor's Labyrinth — Ref Emote Pollution Log

Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/velketor/` (Alkabor dump only).

All 24 Alkabor ref files were homogeneous — every line in each file was an
identical repeat of one Enter-Combat line. No off-topic chatter, no cross-NPC
bleed, no OOC. Nothing was dropped as pollution.

## Ref inventory (all lore-consistent, all included)

- `Emote: lunges at you.` — spiders, crystalline drones, watchers, statues
  (112000, 112001, 112002, 112004, 112019, 112027, 112028, 112043)
- `Emote: howls and lunges.` — Icepaw kobolds + related, crystaline sentinel
  (112008, 112011, 112012, 112014, 112015, 112038, 112039, 112044, 112193)
- `Say: All outlanders must be cleansed.  So is the will of Velketor!` —
  crystal sentinels/guardians/destroyers (112020, 112021, 112030, 112063)
- `Say: By the bidding of my master I will slay you.` — gargoyles
  (112023, 112024)
- `Say: I will destroy all outlanders for the master!` — crystal statue
  (112005, 112026)
- `Say: How dare ye attack a hurt man!` — captured male dwarves
  (112031 Bjoron, 112032 Khlem, 112034 Brumen, 112035 Dlemin)
- `Say: How dare ye attack a hurt woman!` — captured female dwarves
  (112033 Drella, 112036 Bryma, 112037 Frekka)

## Lore notes / judgment calls

- The seven Halas/Icepaw dwarf prisoners (Bjoron, Khlem, Drella, Brumen,
  Dlemin, Bryma, Frekka) share the "hurt man/woman" barks. Consistent with
  lore where Velketor holds captive dwarves in the labyrinth; included per
  default policy.
- NPC 112038 (`a_crystaline_sentinel`, single-L typo) is a genuinely distinct
  spawn from 112021 (`a_crystalline_sentinel`, double-L) with a different
  emote (howls-and-lunges vs will-of-Velketor). Both scripts kept separate.
- 112193 `an_Icepaw_kobold` collides on name with 112012 — the existing
  shared `an_Icepaw_kobold.lua` already emits the correct `howls and lunges`
  line, so no additional file needed.

## Merge decisions

- `#Bledrek.pl` and `#Kerdelb.pl` (`#`-prefixed, disabled) are unrelated
  death-spawn scripts. Kerdelb has a hardcoded "I will crush you for the
  master." combat say that does NOT appear in the Alkabor ref for this
  zone. Not touched — script is disabled anyway and no ref file to reconcile.

## Files created (9 new .lua)

- `Bjoron_Axefall.lua`, `Khlem_Alestone.lua`, `Drella_Stonegrinder.lua`,
  `Brumen_Firehammer.lua`, `Dlemin_Whiteforge.lua`, `Bryma_Loftaxe.lua`,
  `Frekka_Alebringer.lua`
- `a_crystaline_sentinel.lua` (single-L variant)
- `a_crystal_destroyer.lua`

## Files already present and verified against ref (no change)

15 pre-existing lua files (a_blizzard_spider, a_crystal_gargoyle,
a_crystal_sentinel, a_crystal_statue, a_crystalline_devourer,
a_crystalline_gargoyle, a_crystalline_hunter, a_crystalline_sentinel,
a_crystalline_statue, a_crystalline_watcher, a_shard_spider,
a_velium_broodling, a_velium_hunter, a_velium_stalker, an_Icepaw_champion,
an_Icepaw_cleric, an_Icepaw_kobold, an_Icepaw_kobold_priest,
an_Icepaw_kobold_warrior, an_Icepaw_prophet, an_ice_paw_sorcerer,
an_icy_watcher, plus 112039.lua stub for capital-C variant) all already
implement the correct ref combat lines. Two pre-existing files use a
single space instead of the ref's double space between sentences of the
"All outlanders" line — left as-is (not new work, cosmetic-only).
