# qcat Emote Pollution Log

Zone: qcat (Qeynos Catacombs)
Ref priority applied: p2002 > Alkabor > peq > neq
Date: 2026-08-21

## Summary

Ref dumps supply combat/death emotes for 20 NPCs (Alkabor mostly, plus one
p2002/neq pair for Ronn_Castekin). Most named NPCs and unique-name mobs had
no prior handler and got fresh `.pl` files. Several generic-name lua files
already existed with a race-plural taunt pattern that DOES NOT match the ref
"Guards! Guards! Help me!!" pattern — those were left alone to honor the
critical rule (never create/overwrite when existing handler present).

## Files Added

- `Krynta_Darkdagger.pl` (45192) — combat + death rally (Guards! / comrades)
- `Beggar_Wyllin.pl` (45115) — combat + death (Guards! / Deepwater Knights)
- `a_courier.pl` (45001) — combat + death (Guards! / comrades)
- `an_exhausted_guard.pl` (45046) — combat + death (Time to die $name / comrades)
- `a_spectre.pl` (45013) — combat cry (Areeeeewwwww)
- `a_mangy_rat.pl` (45014) — combat emote (Hiss. SNAP.)

## Files Patched

- `Argyn_Shieldstan.pl` (45015/45016) — added EVENT_COMBAT + EVENT_SLAY monologue,
  preserved existing hail handler.
- `Bait_Masterson.pl` (45094) — added EVENT_COMBAT ("Attack, my pets!"), preserved
  existing hail/quest handlers.
- `Ronn_Castekin.pl` (45124) — added EVENT_COMBAT + EVENT_SLAY monologue,
  preserved existing EVENT_DEATH_COMPLETE.
- `a_zombie.pl` (45126) — added EVENT_COMBAT + EVENT_SLAY monologue,
  preserved existing item + death handlers. Note: preserved existing
  DEATH_COMPLETE text "ARGH!!!!!.. Thank.. you.." though ref differs
  slightly ("ARGH!... Thank... you...") — considered stylistic variance.

## Pollution / Shadowing (LEFT AS-IS)

The following existing `.lua` files carry a generic `races_plural` combat
taunt + "My comrades will avenge my death" death line. Alkabor ref shows
simple "Guards! Guards! Help me!!" combat rally for these same NPCs. The lua
handlers shadow the ref-authentic behavior, but per rules we cannot
create/overwrite them (lua takes precedence over any new .pl):

- `a_thug.lua` (45036/45198)
- `a_smuggler.lua` (45194/45202/45203)
- `a_beggar.lua` (45021) — also has hail handler; combat/death shadow ref
- `a_ring_leader.lua` (45037)
- `a_shady_mercenary.lua` (used for mercenary variants 45030/45041/45042/45043/45045/45052)
- `a_thug_leader.lua` (45035)
- `a_necromancer.lua` (no ref data, informational)

Follow-up (would require user approval to delete lua before repatching in pl):
if desired, replace race-plural taunt with authentic "Guards! Guards! Help
me!!" for the mercenary/thug/smuggler/beggar lineage.

## NPC ID Discrepancy

Ref file `45015_Argyn_Shieldstan.txt` but existing pl footer marks
`ID:45016 -- Argyn_Shieldstan`. Same-named NPC, either spawn variant or a
DB drift. Both spawn ids will pick up the `.pl` (perl matches by npc name),
so no action needed; noted for awareness.

## Ref Sources Used

- Alkabor: 20 files (primary source for nearly all entries)
- p2002:   1 file  (Ronn_Castekin — same content as Alkabor minus 3rd line)
- neq:     1 file  (Ronn_Castekin — same content as p2002)
- peq:     none

## Skipped

None — Qeynos Catacombs criminal-underworld / Bloodsaber flavor fits every
NPC in ref. No lore-wrong entries encountered.
