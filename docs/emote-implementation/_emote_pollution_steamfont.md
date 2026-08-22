# Steamfont Mountains (steamfont) — Emote/Flavor Pollution Log

Ref dirs available: Alkabor only. Priority: Alkabor.

## Lore filter — nothing skipped as clearly-wrong

Steamfont Mountains: gnomish mountain zone north of Ak'Anon. Inhabitants split among (a) friendly Deep Slumber Watchmen patrolling from the observatory, (b) kobolds of the Grikbar clan holed up in Grikbar Camp, (c) rogue/runaway/Red-5 clockworks (Meldrath's escaped inventions), (d) Meldrath's minotaur legion (Snort/For-Meldrath rally), (e) ebon drakes/drakelings around the giant tree, (f) misc bosses (Meldrath himself, Bugglegupp the harpy, Gorehorn the minotaur champion). All 26 referenced NPCs fit the zone theme. Included in full.

## Skipped / GM-only NPCs

- none

## Ref templates used across multiple NPCs

**Template A — Kobold bark** (`Say -- Enter Combat: Grrrrr. Bark. Bark. Grrrrr.`)
Applied to standard Grikbar kobolds: 56013 a_kobold_runt, 56019 a_grikbar_kobold, 56046 a_kobold_scout. All three already carried this line exactly. No edit needed.

**Template B — Grikbar shaman variant bark** (`Say -- Enter Combat: <Bark!> Grrrr!`)
Applied only to 56031 a_grikbar_shaman. Existing lua carried Template A text ("Grrrrr. Bark. Bark.") instead — patched to match ref shaman-specific line.

**Template C — Clockwork combat/death** (`Say -- Enter Combat: Click.. Whirr..  Warning. Enemy.. Attack. Destroy. Kill.` + `Say -- After Death: This unit is terminally damaged..  Tick..  Broadcasting violation to other units.`)
Applied to 56037 rogue_clockwork, 56050 Nilit's_contraption, 56324 rogue_clockwork. Created new lua files for each (no pre-existing handler).

**Template D — Red 5 clockwork combat/death** (`Say -- Enter Combat: Click..  Inferior being. Red 5 shall exterminate.` + `Say -- On Death: Scrap..  Red 5 shall salvage for parts.`)
Applied to 56071 runaway_clockwork, 56081/56326 a_runaway_clockwork. 56081/56326 already carried both lines exactly. Created new lua for 56071 (no pre-existing handler).

**Template E — Minotaur Meldrath rally** (`Say -- Enter Combat: <Snort!!>..  Death to you! Meldrath commands!!` + `Say -- After Death: I die soon! Meldrath, help me!` + idle `Say -- : <Snort!!>.. For Meldrath!!`)
Applied to 56024/56317 minotaur_slaver (already covered by existing .pl handlers), plus 56139 Gorehorn, 56149 Minotaur_Sentry, 56313 Minotaur_Guard (new lua files created). Idle "For Meldrath!!" line not implemented per zone convention (see below).

**Template F — Watchman rally** (`Say -- Enter Combat: Die, you vile beast!!`)
Applied to 56107 Watchman_Mylz, 56124 Watchman_Prenn, 56125 Watchman_Dreeb, 56126 Watchman_Prynn, 56155 Watchman_Halv. All five already carried this line exactly. No edit needed.

**Template G — Ebon drake screech** (`Emote -- Enter Combat: screeches shrilly as it swoops in to attack.` + `Emote -- After Death: falls to the ground with a pathetic screech.`)
Applied to 56320 an_ebon_drakeling (already exact) and 56329 a_young_ebon_drake (new lua created).

## Merge decisions

- **56006 Meldrath_The_Malignant.lua** — patched. Existing combat line missing comma ("Die like a fool you are!" vs ref "Die, like the fool you are!") and had cosmetic wording drift. Rewrote to match ref exactly. Idle Say (`The Lord of Disease welcomes you!`) not implemented — see convention note.
- **56013 a_kobold_runt.lua** / **56019 a_grikbar_kobold.lua** / **56046 a_kobold_scout.lua** — no edit; already ref-exact.
- **56024 a_minotaur_slaver.pl** / **56317 minotaur_slaver.pl** — no edit; existing .pl already carries the exact Enter Combat + After Death lines (plus zone-specific death spawn logic for Minotaur Hero/Lord that predates this pass).
- **56031 a_grikbar_shaman.lua** — patched combat text from Template A to ref-correct Template B (`<Bark!> Grrrr!`).
- **56037 rogue_clockwork** — new lua (Template C). No pre-existing handler.
- **56050 Nilit's_contraption** — new lua (Template C). File named ``Nilit`s_contraption.lua`` (backtick-apostrophe matches ref filename convention). No pre-existing handler; distinct from Nilit_Druzlit (56136 gnome inventor NPC with own .pl).
- **56071 runaway_clockwork** — new lua (Template D). No pre-existing handler; distinct from 56081/56326 a_runaway_clockwork (leading `a_`).
- **56081 / 56326 a_runaway_clockwork.lua** — no edit; already ref-exact.
- **56106 Zondo_Hyzill.pl** — no edit; existing hail response already ref-exact.
- **56107 / 56124 / 56125 / 56126 / 56155 Watchman_*.lua** — no edit; all already ref-exact.
- **56139 Gorehorn** — new lua (Template E). No pre-existing handler.
- **56149 Minotaur_Sentry** — new lua (Template E). No pre-existing handler.
- **56157 Bugglegupp** — new lua. Combat "Come here and fill my belly with your tasty flesh." + Death "My Crakneks will make you bleed..." Idle "Hmm...  Let's see.  Where do I start?  A breast or a drumstick?" not implemented per convention.
- **56161 Minotaur_Lord.pl** — no edit; existing EVENT_AGGRO carries the ref "gladiator pens of Qeynos" combat line and EVENT_DEATH carries the "I die soon!" line exactly (minor whitespace difference from ref's double-space between sentences — left alone, pre-existing).
- **56313 Minotaur_Guard** — new lua (Template E). No pre-existing handler.
- **56320 an_ebon_drakeling.lua** — no edit; already ref-exact.
- **56324 rogue_clockwork** — same emu_id name as 56037. Already covered by the new `rogue_clockwork.lua` (name-based dispatch).
- **56326 a_runaway_clockwork** — same emu_id name as 56081. Already covered by existing `a_runaway_clockwork.lua`.
- **56329 a_young_ebon_drake** — new lua (Template G).

## Convention note — skipped idle `Say -- :` lines

Several ref files include a bare `Say -- :` prefix (no Enter Combat / After Death / Hailed marker) representing a killed-player taunt or ambient boast the client emits from an unknown trigger. Following the runnyeye/misty convention (no clean EQEmu event maps to that trigger), these lines were NOT implemented:

- 56006 Meldrath: `The Lord of Disease welcomes you!`
- 56024 / 56139 / 56149 / 56161 / 56313 / 56317 minotaurs: `<Snort!!>.. For Meldrath!!` (also Minotaur_Hero 56152 uses this as its combat line in existing .pl)
- 56157 Bugglegupp: `Hmm...  Let's see.  Where do I start?  A breast or a drumstick?`

## Files touched

Created new `.lua` files (no `.pl` exists for any of these NPCs — safe to add per Lua-shadows-Perl rule):

- rogue_clockwork.lua
- Nilit`s_contraption.lua
- runaway_clockwork.lua
- Gorehorn.lua
- Minotaur_Sentry.lua
- Bugglegupp.lua
- Minotaur_Guard.lua
- a_young_ebon_drake.lua

Patched existing files:

- Meldrath_The_Malignant.lua (combat/death text drift → ref-exact)
- a_grikbar_shaman.lua (wrong template A text → correct template B text)

## Duplicate / cross-ref notes

- **56037 vs 56324 rogue_clockwork** — two ref dumps, same emu display name. Single new `rogue_clockwork.lua` covers both spawns (name-based lua dispatch).
- **56081 vs 56326 a_runaway_clockwork** — same pattern as above; existing `a_runaway_clockwork.lua` covers both.
- **56024 vs 56317 minotaur_slaver / a_minotaur_slaver** — two distinct emu_ids with two distinct existing .pl files (`a_minotaur_slaver.pl` and `minotaur_slaver.pl`), both already ref-correct.
- **Nilit_Druzlit (56136) vs Nilit's_contraption (56050)** — different NPCs. Nilit is the gnome quest-giver (`Nilit_Druzlit.pl` handles his hail dialogue about his runaway creation); the contraption is his out-of-control clockwork spawned as a hostile mob. Separate handlers.
