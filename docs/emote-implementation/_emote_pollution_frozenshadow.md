# Emote Pollution Report - frozenshadow (Tower of Frozen Shadow)

Generated from ref dumps at `C:/eqemu/ref_emotes/Emotes_{p2002,Alkabor,peq,neq}/frozenshadow/`.
Priority order: p2002 > Alkabor > peq > neq (first dir with data wins per NPC).

## Ref-dump content summary

All 4 ref dirs contain only **three** distinct emote/say lines across the entire zone. Every file is a
single Enter Combat line, repeated many times, with no other event types recorded (no Death, Killed,
Hailed, Spawn, Despawn, Emote, or Shout entries anywhere).

The three lines:

1. `Say -- Enter Combat: Heretic!  Dare you enter our sacred halls?  Your crimes shall not go unpunished.  You shall die for your deeds.`
   - Emitted by the Library / study-hall inhabitants: ghostly scholars/students/teachers, Librarian, Librarian assistant.
2. `Say -- Enter Combat: More souls for the mistress.`
   - Emitted by shadow beasts (base). Fits Tserrina lore (all shadow beasts serve the mistress of the tower).
3. `Say -- Enter Combat: Areeeeewwwww`
   - Emitted by nearly every other undead in the tower (zombies, skeletons, ice shades, shadowbones,
     familiars, crystallized guards, named 5th-floor vampires, etc.). A stylized wraith/undead moan.

## Skipped / pollution notes

- **No skipped lines.** All three lines are lore-appropriate for a Velious undead tower dungeon
  populated by Tserrina Syl'Tor's servants. Even the "Areeeeewwwww" moan is thematically appropriate
  for undead/vampiric mobs (per project rule: "undead speaking IS expected here").
- **Duplicate-heavy dumps.** Many p2002/Alkabor files repeat the same line 5-25+ times; deduped to a
  single occurrence per NPC. No ChooseRandom variance is possible for combat lines - the ref sources
  do not supply distinct variants.
- **Casing/typo notes.**
  - p2002 has `111147_Iucid_spirit_of_Abrams.txt` (misspelled "Iucid" with capital-I instead of "lucid").
    Mapped to existing quest file `lucid_spirit_of_Abrams.pl` (correct spelling per project convention).
  - peq uses `111059_incoherent_spirit.txt` (lowercase) while p2002/Alkabor/neq use
    `111059_Incoherent_spirit.txt` (TitleCase). Existing `#Incoherent_spirit.pl` uses TitleCase; new
    file created as `Incoherent_spirit.lua` for consistency.
- **`#`-prefixed refs.** These represent shadow/hidden NPCs paired with a base-name NPC. Both share the
  same wire line in this zone. Where both a base and shadow quest .pl already exist (e.g. `a_shadowbone.pl`
  + `#a_shadowbone.pl`), both are patched with the same emote so behaviour is uniform whichever variant
  spawns.

## Target-resolution notes

- Zone quest dir contains ONLY perl scripts (except `player.lua`). Per rules:
  - Existing `.pl` (no `.lua`) → **patched perl in place** (added `sub EVENT_COMBAT`).
  - Neither `.pl` nor `.lua` → **created new `.lua`** (lowercase for `a_*`/`an_*`, TitleCase named).
- No `<Name>.lua` + `<NPCID>.lua` collisions observed.
- All perl scripts here use `EVENT_DEATH_COMPLETE`-style handlers; adding `EVENT_COMBAT` alongside is
  additive and preserves existing on-death-spawn logic (Angelox-era 5-10% enraged-relative spawns,
  spectral-librarian spawns, undead-gnoll spawns, Cara_Omica trigger).

## NPC coverage

| Ref NPC(s)                                              | Wire line                              | Target                              | Action    |
| ------------------------------------------------------- | -------------------------------------- | ----------------------------------- | --------- |
| a_ghostly_scholar / #a_ghostly_scholar                  | Heretic!...                            | a_ghostly_scholar.pl                | patch pl  |
| a_ghostly_student                                       | Heretic!...                            | a_ghostly_student.pl                | patch pl  |
| #a_ghostly_student                                      | Heretic!...                            | #a_ghostly_student.pl               | patch pl  |
| a_ghostly_teacher                                       | Heretic!...                            | a_ghostly_teacher.pl                | patch pl  |
| Librarian                                               | Heretic!...                            | Librarian.pl                        | patch pl  |
| Librarian_assistant                                     | Heretic!...                            | Librarian_assistant.pl              | patch pl  |
| a_shadow_beast                                          | More souls for the mistress.           | a_shadow_beast.pl                   | patch pl  |
| a_shadow_beast_cook                                     | Areeeeewwwww                           | a_shadow_beast_cook.pl              | patch pl  |
| a_shadow_beast_servant / #a_shadow_beast_servant        | Areeeeewwwww                           | a_shadow_beast_servant.pl           | patch pl  |
| a_shadow_beast_necromancer                              | Areeeeewwwww                           | a_shadow_beast_necromancer.lua      | create    |
| a_shadow_beast_guard / #a_shadow_beast_guard            | Areeeeewwwww                           | a_shadow_beast_guard.lua            | create    |
| a_shadowbone / #a_shadowbone                            | Areeeeewwwww                           | a_shadowbone.pl + #a_shadowbone.pl  | patch pl  |
| a_lesser_ice_shade                                      | Areeeeewwwww                           | a_lesser_ice_shade.pl               | patch pl  |
| an_ice_shade                                            | Areeeeewwwww                           | an_ice_shade.lua                    | create    |
| an_icy_shade                                            | Areeeeewwwww                           | an_icy_shade.lua                    | create    |
| a_zombie_butler                                         | Areeeeewwwww                           | a_zombie_butler.pl                  | patch pl  |
| a_zombie_maid                                           | Areeeeewwwww                           | a_zombie_maid.pl                    | patch pl  |
| an_armored_shadow                                       | Areeeeewwwww                           | an_armored_shadow.lua               | create    |
| a_skeleton_sleeper / #a_skeleton_sleeper                | Areeeeewwwww                           | a_skeleton_sleeper.pl + #variant.pl | patch pl  |
| a_golem_usher                                           | Areeeeewwwww                           | a_golem_usher.pl                    | patch pl  |
| an_undead_dancer / #an_undead_dancer                    | Areeeeewwwww                           | an_undead_dancer.pl                 | patch pl  |
| an_undead_musician / #an_undead_musician                | Areeeeewwwww                           | an_undead_musician.pl               | patch pl  |
| an_undead_bridesmaid                                    | Areeeeewwwww                           | an_undead_bridesmaid.pl             | patch pl  |
| a_shadow_familiar                                       | Areeeeewwwww                           | a_shadow_familiar.lua               | create    |
| a_blood_familiar                                        | Areeeeewwwww                           | a_blood_familiar.lua                | create    |
| an_emerald_familiar                                     | Areeeeewwwww                           | an_emerald_familiar.lua             | create    |
| a_frost_familiar                                        | Areeeeewwwww                           | a_frost_familiar.lua                | create    |
| a_crystallized_shadow_guard                             | Areeeeewwwww                           | a_crystallized_shadow_guard.lua     | create    |
| Incoherent_spirit / #incoherent_spirit                  | Areeeeewwwww                           | Incoherent_spirit.lua               | create    |
| Daman / #Daman                                          | Areeeeewwwww                           | Daman.pl                            | patch pl  |
| Nosja / #Nosja                                          | Areeeeewwwww                           | Nosja.pl                            | patch pl  |
| Priest_Majes_Medory / #Priest_Majes_Medory              | Areeeeewwwww                           | Priest_Majes_Medory.pl              | patch pl  |
| Isopca / #Isopca                                        | Areeeeewwwww                           | Isopca.pl                           | patch pl  |
| Eugie / #Eugie                                          | Areeeeewwwww                           | Eugie.pl                            | patch pl  |
| Lerty / #Lerty                                          | Areeeeewwwww                           | Lerty.pl                            | patch pl  |
| Otdd / #Otdd                                            | Areeeeewwwww                           | Otdd.pl                             | patch pl  |
| Pelpa / #Pelpa                                          | Areeeeewwwww                           | Pelpa.pl                            | patch pl  |
| Tihgren / #Tihgren                                      | Areeeeewwwww                           | Tihgren.pl                          | patch pl  |
| Uenlarc / #Uenlarc                                      | Areeeeewwwww                           | Uenlarc.pl                          | patch pl  |
| Varjie / #Varjie                                        | Areeeeewwwww                           | Varjie.pl                           | patch pl  |
| Vyakna / #Vyakna                                        | Areeeeewwwww                           | Vyakna.pl                           | patch pl  |
| Iucid_spirit_of_Abrams (p2002 typo for "lucid")         | Areeeeewwwww                           | lucid_spirit_of_Abrams.pl           | patch pl  |
| Xalgoti (Alkabor only, no quest file)                   | Areeeeewwwww                           | Xalgoti.lua                         | create    |

## Refs with no matching NPC entry in dumps beyond combat

Ref dumps supply **only combat lines** - no death, killed, hailed, spawn, or despawn text for any NPC in
this zone. No event_death / event_death_complete / event_slay / event_say / event_spawn / event_depop
handlers added from ref data.
