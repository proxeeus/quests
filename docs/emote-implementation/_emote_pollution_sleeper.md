# Emote Pollution Log — sleeper (Sleeper's Tomb)

Ref sources scanned: `C:/eqemu/ref_emotes/Emotes_{p2002,peq,neq}/sleeper/`.
Priority per NPC: p2002 > Alkabor (none) > peq > neq.

## Skipped ref entries (not authored to quests)

### Proximity-emote descriptive lines (client-side 3rd-person "look" emotes, not NPC dialog)
These `Proximity Emote - Other Say` entries are visual descriptions of the NPC striking (target-emote style),
not spoken NPC dialog. They read as narrator text and would be jarring as `Say`/`Shout` combat lines.
Skipped to avoid gameplay-side dialog pollution.

- `128015_a_scorn_spectre.txt` — "The spectre's eye sockets glow red with contempt as it strikes at you."
- `128023_a_screeching_banshee.txt` — same line (spectre wording applied to a banshee — also likely mis-tagged in ref).
- `128024_a_flailing_phantom.txt` — same line (spectre wording applied to a phantom — likely mis-tagged in ref).

### Duplicate ref file for same NPC name
- `128049_a_drakonine_opportunist.txt` (peq) — same NPC name as `128017_a_drakonine_opportunist.txt` and identical
  content ("Of dragon kin I come at thee..." / "Life is lost, how can this be..."). Single `a_drakonine_opportunist.lua`
  covers both spawn IDs.
- `128110_a_newly_created_sentry.txt` (p2002 + peq + neq) — same NPC name as `128014` and `128109` and identical
  content. Single existing `a_newly_created_sentry.lua` covers all three spawn IDs.
- `128145_#Master_of_the_Guard.txt` (peq) — same NPC name as `128054`, identical content. Single existing
  `Master_of_the_Guard.lua` covers both.

## Merge decisions where an existing quest file already had dialog

### `Master_of_the_Guard.lua` — PRESERVED existing dialog
- Existing combat/death/slay text (in-file, likely earlier canonical or PEQ-team authored) differs from ref:
  - Existing combat: "You shall not pass this point."
  - Existing death: "Progenitor, one has fallen, a replacement is needed."
  - Existing slay: "As it is willed, none shall pass."
  - Ref (peq 128054/128145) combat: "One has been engaged, reinforcements come forth and eliminate this threat!"
  - Ref (peq 128054/128145) death: "Foolish mortals, this one is but one of many, you will not survive the rest!"
- Both variants are lore-consistent (guard commander alerting reinforcements). Leaving existing file
  untouched per merge policy (do not stomp pre-existing authored dialog).

### `a_newly_created_sentry.lua` — ALREADY MATCHES REF
- Existing file already contains the exact p2002/peq/neq ref lines. No edit needed.

### `an_ancient_sentry.lua`, `an_aged_caretaker.lua`, `#Kerafyrm.lua`, `#The_Final_Arbiter.lua`, `#The_Progenitor.lua`, `A_wardstone.lua`, `A_warning.lua`
- No matching ref files. Existing dialog preserved as-is.
