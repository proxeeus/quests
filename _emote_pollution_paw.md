# Emote Pollution Log — Zone: paw (Splitpaw Lair)

Scope: NPC emote/flavor-text data implemented from ref dumps at
`C:/eqemu/ref_emotes/Emotes_{p2002,Alkabor,peq,neq}/paw/`.
Priority order per NPC: p2002 > Alkabor > peq > neq.

## Skipped ref entries

### 18037_a_gnoll_prisoner.txt (peq main)
- **Ref content**: `Emote -- Enter Combat: rushes toward you. 'Prepare to die, air breather!'` / `Emote -- After Death: looks surprised as you end its life.`
- **Verdict**: SKIP. Content is clearly wrong for a Splitpaw gnoll prisoner —
  "air breather" is water-elemental dialogue that leaked into the wrong NPC row
  in peq's export. A captive gnoll would not taunt PCs as an outsider.
- **Action**: No quest file created. NPCID 18037 has no active quest in the
  current tree (only `#a_gnoll_prisoner.lua` exists for 18110, which is prefixed
  `#` and inactive). Peq entry `18110_#a_gnoll_prisoner.txt` uses the correct
  gnoll TomEar chant; ignored to avoid touching a deactivated quest.

### 18106_#Fire_Elemental_Brigand.txt (peq only)
- **NPCID collision**: 18106 in p2002/Alkabor/neq is `Tesch_Val_Kadvem`
  (a Splitpaw gnoll captain) with the standard TomEar gnoll chant.
- **Verdict**: SKIP peq entry. Priority p2002 wins; the `#` prefix in the peq
  filename indicates a disabled/dev-only NPC that never coexisted with the
  gnoll assignment. `Tesch_Val_Kadvem.lua` already has the correct gnoll
  emotes — untouched.

### 18107_#Scorch.txt (peq only)
- **Ref content**: `Emote -- Enter Combat: hisses and strikes.` / `Emote -- After Death: sinks to the ground, its scales dripping with rivulets of blood.`
- **Verdict**: SKIP. Prefix `#` = disabled NPC and no active quest file
  matches. The lines describe a scaled reptile — not a Splitpaw denizen.
  Likely leftover from another zone's dev data.

### 18109_#Sertiki_the_Master_of_Tides.txt (peq only)
- **Ref content**: same water-elemental combat/death emote pair as invaders/wavecrashers.
- **Verdict**: SKIP. Prefix `#` = disabled NPC, no active quest file.
  The water emotes are already implemented on the two active water-elemental
  quest files.

### 18112_#Overlord_Flargor.txt (peq only)
- **Ref content**: fire/wrath boss taunts ("erupts into flames…").
- **Verdict**: SKIP. Prefix `#` = disabled NPC, no active quest file.
  Not part of the shipping Splitpaw roster.

## Mapping judgments (recorded, not pollution)

### 18104 Kurrpok Splitpaw ↔ `a_one_eyed_gnoll.lua`
- No quest file named `Kurrpok_Splitpaw.lua` exists. The active quest
  `a_one_eyed_gnoll.lua` matches Kurrpok by lore (Kurrpok is famously the
  one-eyed gnoll; the ref lines reference "eye" and "BARK" chatter).
- Patched with Kurrpok's unique lines. If DB NPCID mapping differs, roll back
  to the generic TomEar chant.

### Generic Splitpaw gnolls (18001, 18008, 18020, 18029, 18031, 18039, 18040, 18044, 18063, 18064, 18074, 18079, 18080, 18083, 18091, 18092, 18097, 18103, 18105, 18106, 18119, 18121, 18123, 18124, 18126, 18127, 18129, 18130, 18131)
- All ref files share the identical 4-line TomEar pattern (Enter Combat / After
  Death / Killed PC / Killed NPC). Dedup handled at the file level — each
  active `.lua` implements the same 3-handler template
  (event_combat + event_death_complete + event_slay), which was already in
  place at the start of this task. No changes needed.

### 18000 The Ishva Mal (Alkabor only)
- Uses the same TomEar gnoll pattern. `The_Ishva_Mal.lua` already implements
  it. No changes needed.

### 18117 Verishe Mal Judge (Alkabor only)
- Uses the same TomEar gnoll pattern. `Verishe_Mal_Judge.lua` already
  implements it. No changes needed.

## Files patched this pass
- `an_air_elemental_breeze_lord.lua` — added air combat/death emotes; preserved boss-spawn logic.
- `an_air_elemental_infiltrator.lua` — added air combat/death emotes; preserved boss-spawn logic.
- `a_water_elemental_invader.lua` — added water combat/death emotes; preserved boss-spawn logic.
- `a_water_elemental_wavecrasher.lua` — added water combat/death emotes; preserved boss-spawn logic.
- `an_earth_elemental_intruder.lua` — added earth combat/death emotes; preserved boss-spawn logic.
- `an_earth_elemental_rockshaper.lua` — added earth combat/death emotes; preserved boss-spawn logic.
- `a_fire_elemental_blazemaster.lua` — added fire combat/death emotes; preserved boss-spawn logic.
- `a_fire_elemental_raider.lua` — added fire combat/death emotes; preserved boss-spawn logic.
- `a_one_eyed_gnoll.lua` — replaced generic TomEar chant with Kurrpok Splitpaw's unique "eye" lines (see mapping judgment above).
- `Brother_Hayle.pl` — appended EVENT_COMBAT (rally), EVENT_SLAY (pity), EVENT_DEATH_COMPLETE (Rodcet Nife blessing) alongside existing EVENT_SAY + EVENT_ITEM handlers. Kept as .pl (never shadow a .pl with a .lua).
