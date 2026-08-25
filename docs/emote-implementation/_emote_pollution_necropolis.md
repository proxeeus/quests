# Emote Pollution Log — necropolis (Dragon Necropolis)

Ref-source priority applied per NPC: **p2002 > Alkabor > peq > neq**.
Dedup within ref files (all ref dumps repeat lines many times).

## Skipped / Pollution

No lines were rejected as clearly wrong for Dragon Necropolis lore. The zone
is a velious mausoleum populated by undead Chetari (goblin-like servants of
Zlandicar), rebel Paebala goblins, dragon-themed undead (Zlandicar, Vilefang,
Vaniki, Jaled Dar's shade), phase spiders, entropy serpents, carrion bats,
amorphous masses, and a few dwarven excavators (Excavator Quellin cluster).
All emote content is thematically consistent (goblin chatter for
Chetari/Paebala, dragon-lore for uniques, monstrous emotes for beasts).

## Ref filename mismatches

- `123166_#Excavator_Quellin.txt` (peq) — dwarven excavator; content is
  battle-cry / clutching-wounds emote. Included; thematically consistent as
  a mercenary NPC.
- `123159_a_mercenary_excavator.txt` (peq) — same faction cluster.
- `123028_Pierre.txt` (Alkabor) — non-lore-standard name but shares the
  Chetari `Aiyi` chatter pattern; NPC clearly slotted into Chetari faction.
  Included as-is (Alkabor content is authoritative for this NPC).

## Duplicate-content clusters (per priority resolution)

The following NPCs all share the standard Chetari `Aiyiyiyiyiyiyi!` (Enter)
+ `ai...yiyiyiyiyi....erp!` (After Death) pattern:

- 123005 a_Chetari_Dominator, 123029 a_Chetari_worker, 123030 a_Chetari_neophyte,
  123035 a_Chetari_Dustshaper, 123038 a_Chetari_guard, 123069 a_Chetari_master,
  123074 a_Chetari_Scavenger, 123086 a_Chetari_hunter, 123098 a_Chetari_Seeker,
  123101 a_Chetari_warrior, 123110 a_chetari_runemage, 123233 a_Chetari_guard
  (dup entity name at different ID; single file), 123239 a_Chetari_seeker
  (already covered by a_Chetari_Seeker.lua), 123037 a_Chetari_servant,
  123063 a_Chetari_adolescent, 123152 Whelp_Kidnapper.
- With additional Alkabor `dances in triumph!` event_slay:
  123007 Chetari_Courier, 123008 Warmaster_Utvara, 123019 #Dominator_Yisaki,
  123021 Seeker_Bulava, 123028 Pierre.

Chetari `Tiktakiyiyiyi!` variant:
- 123070 a_Chetari_Deathbinder.

Paebala `Viyiyiyi!` / `poit....narfnarf...erp!`:
- 123052 a_Paebala_warrior (and 123235 dup).

Paebala/Chetari-rebel `Wikiwikiwiki!` / `Neeeeeeeee........`:
- 123106 a_Paebala_rebel, 123142 #Dustbinder_Grakina.
- With Alkabor `gnashes its teeth in victory.` event_slay:
  123025 / 123068 a_Paebala_Spirit_Talker, 123036 Vilefang.

Phase spider (emote pattern):
- 123014 a_phase_spider.

Entropy serpent + Alkabor slay:
- 123046 an_entropy_serpent.

Carrion bat:
- 123118 a_carrion_bat.

Amorphous mass:
- 123033 / 123231 an_amorphous_mass (single .lua covers both;
  same NPC name at different IDs).

Uniques:
- 123006 / 123149 Vaniki (both point to same NPC name; single Vaniki.lua).
- 123011 Jaled_Dar-s_shade (merged into existing .lua handler).
- 123045 Neb (patched existing .pl).
- 123115 Zlandicar (patched existing .pl).
- 123148 a_nest (patched existing .pl).
- 123162 a_pile_of_bones (patched existing .pl).
- 123166 #Excavator_Quellin (peq).
- 123159 a_mercenary_excavator (peq).

## Files created

30 new `.lua` files, all in `C:/eqemu/quests/necropolis/`. Existing `.pl`
handlers were extended (never replaced) for Neb, Zlandicar, a_nest, and
a_pile_of_bones. `Jaled_Dar-s_shade.lua` extended with
`event_death_complete`.

## Rule-followed notes

- Never created a `.lua` where a `.pl` already existed for the same NPC
  (Neb, Zlandicar, a_nest, a_pile_of_bones).
- Existing hash-prefixed lua/pl handlers (#Garzicor-s_Corpse,
  #Spirit_of_Garzicor, #Stiggles_Cogswin, #an_Odd_Looking_Spider,
  #a_dragon_construct, #a_ghostly_presence) were untouched — no ref
  emote data exists for those NPCs.
