# Rivervale — Emote/Flavor Pollution Log

Ref dirs available: Alkabor only. Priority: Alkabor.

## Lore filter — nothing skipped as clearly-wrong

Rivervale is the halfling home city. All 28 referenced NPCs (Deputies of the Rivervale Militia, city bouncers, a shady halfling, a scarecrow-golem quest NPC, Chomper, Nillipuss the jumjum thief, Silna the bard mail NPC, Shayde the tavern regular, Hobb Tagglefoot the Bristlebane priest) are on-lore and included.

## Skipped / GM-only NPCs

- none

## Duplicate / cross-ref notes

- The 21 Deputies (Raynin/Kapop/Chopo/Quillto/Leeot/Rollin/Banto/Regno/Antana/Sertlin/Percin/Higrin/Goltin/Dopkin/Millin/Higley/Shelmy/Tonlo/Lowmot) plus the shady halfling all share the identical generic ref template (`Enter Combat: Time to die $name.` / `After Death: My comrades will avenge my death.`). Applied as event_combat + event_death_complete to each; each NPC keeps its unique existing content (nice-hat hail on Deputies, quest handler on Deputy_Lowmot, random-face spawn + death line on a_shady_halfling).
- Chomper (19001) ref repeats `Emote -- Enter Combat: smells flesh.` three times — same NPC copy pattern (multi-spawn model); a single event_combat covers all copies.
- Nillipuss (19015) existing `event_attack` + `event_death_complete` already carry the ref text verbatim (jumjum stalk stew line + curse/pox line). No edit made.
- Shayde_Higginsbot (19048) existing `event_say` hail already carries the ref text verbatim (bub / rogues / gold). No edit made.

## Merge decisions

- **Silna_Songsmith (19113)** — bard-mail-quest NPC. Ref combat line is unique (`Die, like a motherless gnoll!`) — overrides the generic guard rally. After-death is generic and kept.
- **Hobb_Tagglefoot (19103)** — Bristlebane priest, ref line (`Heretic! Thou shalt feel my magic scorn!`) fits a caster/cleric better than the generic guard rally. Used as combat, plus the generic after-death line.
- **Bouncer_Bigboot / Bouncer_Bogglebin (19091/19094)** — identical unique bouncer line (`That's it, buddy!  You're outta' here!`) applied as event_combat. No after-death in ref.
- **Shakey_Scarecrow (19046)** — enter-combat emote (`'s hay begins to rustle loudly.`) added alongside the existing hail-emote + trade quest handler. No after-death in ref.

## Files touched

Patched existing `.lua` files (event_combat / event_death_complete appended, existing code untouched):

- Deputy_Raynin, Deputy_Kapop, Deputy_Chopo, Deputy_Quillto, Deputy_Leeot, Deputy_Rollin, Deputy_Banto, Deputy_Regno, Deputy_Antana, Deputy_Sertlin, Deputy_Percin, Deputy_Higrin, Deputy_Goltin, Deputy_Dopkin, Deputy_Millin, Deputy_Higley, Deputy_Shelmy, Deputy_Tonlo, Deputy_Lowmot, a_shady_halfling, Shakey_Scarecrow (combat emote only), Silna_Songsmith.

Created new `.lua` files (no `.pl` exists for any of these NPCs — safe to add per Lua-shadows-Perl rule):

- Chomper, Bouncer_Bigboot, Bouncer_Bogglebin, Hobb_Tagglefoot.

## Duplicate/orphan quest files noticed

- none
