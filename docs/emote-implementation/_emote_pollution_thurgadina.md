# Thurgadin (thurgadina) — Emote/Flavor Pollution Log

Zone: **thurgadina** (Thurgadin, Coldain dwarven capital, Velious).

Ref dirs available: Alkabor only (`C:/eqemu/ref_emotes/Emotes_Alkabor/thurgadina/`, 99 files).
Priority: Alkabor.

## Summary

Ref data is dominated by a single "After Death" template. Verified across all
99 ref files:

- **93 NPCs**: only `Say -- After Death: My comrades will avenge my death.`
- **5 NPCs**: variations on the template (see below).
- **1 NPC** (Betti_Frostweaver): fully bespoke shade-necromancer combat script.

No Hail/Enter/Leave/Spawn/Slay lines exist anywhere in the Alkabor dump.
This pass is therefore almost entirely gap-fill: add a death-cry handler to
every ref-listed NPC that lacks one.

## Canonical text buckets

- **Template A — generic guard/citizen death** (93 NPCs)
  `Say: "My comrades will avenge my death."` fired on death_complete.
- **Template B — Underbelly combat rally** (2 NPCs: Dalgrim, Terman Underbelly)
  Enter Combat `Say: "Time to die $name."` + Template A death line.
- **Template C — Tobart Dirkins** (label variance only)
  Ref says `Say -- On Death:` instead of `After Death:` — same text, same
  semantics. Implemented as `EVENT_DEATH_COMPLETE`.
- **Template D — Gilthan Brittleblade** (unique)
  Enter Combat `Say: "Our pain will soon be yours!"` + On Death
  `Say: "At last... my suffering will end!"` (lore: cursed/suffering craftsman).
- **Template E — Betti Frostweaver** (unique shade necromancer)
  Enter Combat `Say: "Tekar Ans Sivuelaeus!"` + Emote (unlabeled)
  `reaches into the chest of the fallen causing it to twitch and convulse
  violently.  The shade pulls back leaving nothing but a wrinkled husk of a
  corpse.` + On Death Emote `quivers and then melts silently into the dark
  marble.` Wife of Rexx_Frostweaver (regular Coldain) — Betti's Alkabor bark
  set implies she's replaced by / possessed by a shade during combat. Ref
  data taken verbatim.

## Lore filter — nothing skipped

Every ref NPC is a Coldain citizen, priest, guard, smith, or Underbelly-clan
member of Thurgadin. All in-theme. Zero skips. Even the Betti shade-necro
bark set, though incongruous with her friendly merchant Hail, is faithfully
included from ref.

## Merge decisions

Standard 5-step decision tree. Existing `.pl` files patched with an added
`EVENT_DEATH_COMPLETE` (or `EVENT_COMBAT`+`EVENT_DEATH_COMPLETE` for the
special templates); existing `.lua` files patched with `event_death_complete`;
NPCs with no prior handler received a new `.lua` file (Template A one-liner).

## Files patched (existing .pl / .lua kept; ref events appended)

Perl (25):

- `Ungdin.pl` (115008) - Template A
- `Karey.pl` (115017) - Template A
- `Grimthor_Brewbeard.pl` (115049) - Template A
- `Pearce_Icefang.pl` (115063) - Template A
- `Mandla_Klolp.pl` (115064) - Template A
- `Fergus_Sawdust.pl` (115065) - Template A
- `Trademaster_Kroven.pl` (115073) - Template A
- `Trita_Coldheart.pl` (115075) - Template A
- `Valdicar_Shadowfrost.pl` (115077) - Template A
- `Boris.pl` (115078) - Template A
- `Yates_the_Butler.pl` (115079) - Template A
- `Clifus.pl` (115089) - Template A
- `Hunter_Tarvin.pl` (115092) - Template A
- `Travit_Conwil.pl` (115093) - Template A
- `Petcas_Coldbeard.pl` (115141) - Template A
- `Doogle_McBanick.pl` (115142) - Template A
- `Dalgrim_Underbelly.pl` (115146) - **Template B** (combat + death)
- `Terman_Underbelly.pl` (115147) - **Template B** (combat + death)
- `Kyla_Frostbeard.pl` (115149) - Template A
- `Lorekeeper_Brita.pl` (115152) - Template A
- `Lorekeeper_Derrin.pl` (115154) - Template A
- `Perkins_Doughbeard.pl` (115158) - Template A
- `Mordin_Frostcleaver.pl` (115159) - Template A
- `Agar.pl` (115160) - Template A
- `Meg_Tucter.pl` (115161) - Template A
- `Talem_Tucter.pl` (115162) - Template A
- `Durgan_Bottlenip.pl` (115163) - Template A
- `Tobart_Dirkins.pl` (115164) - Template A (ref label "On Death" → same handler)
- `Tavir.pl` (115165) - Template A
- `Argash.pl` (115166) - Template A
- `Rexx_Frostweaver.pl` (115167) - Template A
- `Betti_Frostweaver.pl` (115168) - **Template E** (shade combat + emote + death emote)
- `Gilthan_Brittleblade.pl` (115172) - **Template D** (unique combat + unique death)
- `Nimren_Stonecutter.pl` (115170) - Template A
- `Brina_Snowfox.pl` (115171) - Template A
- `Lorekeeper_Gundlt.pl` (115186) - Template A
- `Mauren_Frostbeard.pl` (115216) - Template A (also serves 115148 per file header)

Lua (11):

- `Elder_Reevis.lua` (115068) - Template A
- `#Loremaster_Sarl.lua` (115082) - Template A (kept dragon-lore waypoint script)
- `Guard_Pert.lua` (115109) - Template A
- `Guard_Bjorn.lua` (115112) - Template A
- `Guard_Kristrun.lua` (115130) - Template A
- `Guard_Eyvindur.lua` (115131) - Template A
- `Guard_Baldvin.lua` (115132) - Template A
- `Guard_Dagur.lua` (115133) - Template A
- `Grand_Historian_Thoridain.lua` (115135) - Template A
- `Guard_Dobbs.lua` (115206) - Template A
- `Guard_Gord.lua` (115209) - Template A

## Files created (no prior handler; Template A one-liner lua)

49 new `.lua` files, each with a single `event_death_complete` handler
saying `"My comrades will avenge my death."`:

- `Flonts.lua` (115009)
- `Loremaster_Fronden.lua` (115014) — `.pl_` sibling is inactive (underscore suffix)
- `Durfa.lua` (115021)
- `Belinda.lua` (115045)
- `Denise.lua` (115046)
- `Kier.lua` (115047)
- `Celtir_Gronback.lua` (115048)
- `Zrelik_the_Scout.lua` (115051)
- `Churn_the_Axeman.lua` (115052)
- `Kargin_the_Archer.lua` (115053)
- `Loremaster_Kels.lua` (115054)
- `Schmit_Icepike.lua` (115055)
- `Fradin.lua` (115056)
- `Klarp_Bartleby.lua` (115057)
- `Bixx_Bartleby.lua` (115058)
- `Jinx.lua` (115059)
- `Hason_Klolp.lua` (115060)
- `Girk_Glacierbane.lua` (115061)
- `Jeril_Kettletop.lua` (115066)
- `Seril_Kettletop.lua` (115067)
- `Dorin_Amberfeld.lua` (115070)
- `Hopkins_Coldheart.lua` (115076)
- `Katrin.lua` (115080)
- `Huldin.lua` (115081)
- `Guard_Kilandur.lua` (115083)
- `Freyja_Wintershade.lua` (115084)
- `Clara.lua` (115086)
- `Darts_O`Gavin.lua` (115088) — backtick preserved in filename to match spawn name
- `Gissur.lua` (115091)
- `Guard_Eirikur.lua` (115094)
- `#Wolfmaster_Finnur.lua` (115099) — hash-prefix preserved to match spawn name
- `Guard_Valdis.lua` (115106)
- `Guard_Audun.lua` (115121)
- `Guard_Karl.lua` (115122)
- `Guard_Bergur.lua` (115123)
- `Guard_Iris.lua` (115125)
- `Guard_Jonas.lua` (115129)
- `Gage.lua` (115136)
- `Mort.lua` (115137)
- `Brynjar.lua` (115138)
- `Adia_Coldbeard.lua` (115140)
- `Fogerty_Bottlenip.lua` (115143)
- `Caitlin_Underbelly.lua` (115145)
- `Lorekeeper_Taben.lua` (115151)
- `Keegan.lua` (115155)
- `Brigam.lua` (115156)
- `Wevil_Doughbeard.lua` (115157)
- `Flendun.lua` (115192)
- `Lorran.lua` (115193)
- `Arikain.lua` (115194) — `.pl_` sibling is inactive (underscore suffix)
- `Guard_Fjola.lua` (115210)

## Ref-format quirks encountered

- **Label variance**: ref files use both `Say -- After Death:` and (once,
  Tobart Dirkins 115164) `Say -- On Death:` for identical semantics.
  Implemented uniformly as `EVENT_DEATH_COMPLETE` / `event_death_complete`.
- **Unlabeled Emote** (Betti Frostweaver 115168 only): between her labeled
  combat Say and labeled After Death emote, ref contains one Emote line
  with no event label — `reaches into the chest of the fallen...`.
  Per convention, unlabeled → Enter Combat. Merged into her
  `EVENT_COMBAT` alongside the "Tekar Ans Sivuelaeus!" say (both fire on
  `$combat_state == 1`).
- **`$name` placeholder** in Enter Combat Say (Underbelly template):
  substituted with `quest::say("Time to die $name.")` in perl — perl
  interpolates `$name` at call time to the aggressor's name.
- **Inactive `.pl_` handlers**: `Loremaster_Fronden.pl_` and `Arikain.pl_`
  have underscore-suffixed names → not loaded by the quest engine.
  Fresh `.lua` files (Template A) created for these two IDs; no risk of
  shadowing anything active.
- **`#`/`##` name-prefix files**: `#Loremaster_Sarl.lua` (active dragon-lore
  handler, ID 115082) got the death handler appended. `##Loremaster_Sarl.lua`
  is a sibling for the shape-shifted 115148 spawn — no ref for 115148, left
  untouched.
- **Underbelly ID collision**: `Dalgrim_Underbelly.pl` header comments cover
  both `115146` and `115214`; `Terman_Underbelly.pl` covers `115147` and
  `115215`. Only 115146/115147 appear in the Alkabor ref. Since the perl
  handler is name-scoped, both IDs will inherit the Template B combat+death
  lines automatically — this is expected and correct (siblings share the
  same shopkeeper mob personality).
- **Mauren_Frostbeard.pl multi-ID**: header lists `115148` and `115216`;
  ref file is `115216_Mauren_Frostbeard.txt` only. `115148` is separately
  claimed by `##Loremaster_Sarl.lua` (shape-shifted Sarl form). Name-scoped
  dispatch means Mauren's death cry will fire whenever a mob named
  "Mauren Frostbeard" dies — both IDs, but that's the intended behavior for
  a level-scaled duplicate.

## Duplicate / orphan quest files noticed (not modified, no ref)

- `#Utilpray.pl`, `Utilman.lua`, `You.pl` — utility/testing NPCs.
- `A_Butchered_Butcher.lua`, `A_Conquered_Coldain.lua`, `A_Crispy_Coldain.lua`,
  `A_Gored_Guard.lua`, `A_Gutted_Guard.lua`, `A_Murdered_Merchant.lua`,
  `A_Perforated_Priest.lua`, `A_Punctured_Priestess.lua` — corpse-prop
  spawns from the Coldain Prayer Shawl "Ronin" event, `SetAppearance(3)`
  handlers. Not combatants; correctly excluded from ref.
- `Alpine.lua`, `Frostpaw.lua`, `Avalanche.lua` — Wolfmaster's pack;
  event_spawn/timer follow handlers, not standalone combatants.
- Named ancillary NPCs with no ref: `Battlepriest_Daragor.pl`,
  `Brimgald_Brightsteel.pl`, `Captain_Njall.pl`, `Cobi_Frostbeard.pl`,
  `Dardek_Bladewright.pl`, `Erdarf_Restil.lua`, `Foreman_Felspar.pl`,
  `Frundle_Frenkler.pl`, `Guard_Clorn.lua`, `Guard_Enre.lua`,
  `Guard_Leif.pl`, `Guard_Mason.lua`, `Hakon_Brightsteel.pl`,
  `Initiate_Corrith.lua`, `Initiate_Kroskain.lua`,
  `Initiate_Sirchthain.pl`, `Jorumin.lua`, `Leifur.pl`,
  `Lieutenant_Grimur.lua`, `Lieutenant_Ulfur.lua`, `Lorekeeper_Einar.pl`,
  `Lorekeeper_Zorik.pl`, `Loremaster_Borannin.pl`, `Loremaster_Dorinan.pl`,
  `Normon_Stonetooth.pl`, `Rumagur.lua`, `Templar_Franchus.lua`,
  `Templar_Tingar.lua`, `Thermin_Wandereye.pl`, `##Loremaster_Sarl.lua`
  — all left untouched; not in Alkabor ref for this zone.
