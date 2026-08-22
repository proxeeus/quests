# Emote Pollution Log — nektulos (Nektulos Forest)

Ref priority applied per NPC: **p2002 > Alkabor > peq > neq**.

## Skipped / discarded ref entries (data conflicts / lore mismatch)

- **peq 25010 `a_deathfist_legionnaire`** — DISCARDED. Alkabor wins for NPCID 25010 (`Guard_E`tru`, dark-elf guard). Existing `Guard_E-tru.pl` matches Alkabor. Applying peq's orc dialogue to a dark-elf guard would be wrong.
- **peq 25013 `a_deathfist_scout`** — DISCARDED. Alkabor wins for NPCID 25013 (`Leatherfoot_Deputy`, halfling ranger). Existing `Leatherfoot_Deputy.lua` covers.
- **peq 25038 `a_deathfist_legionnaire`** — DISCARDED. Existing `25038.pl` on this server is a Neriak Dragoon (Angelox guard template with "Die, like the fool you are!" combat text). NPC name in DB is not `a_deathfist_legionnaire`, so applying orc dialogue would fire against a dark-elf guard. Pollution risk too high.
- **peq 25099 `Leatherfoot_Captain`** — DISCARDED. Existing `Venenzi_Oberzendi.pl` on this server owns NPCID 25099 (Necromancer epic NPC — comment reads `Zone:nektulos ID:25099 -- Venenzi_Oberzendi`). NPC name on this server is not `Leatherfoot_Captain`; `Leatherfoot_Captain.lua` (used for other IDs) already carries the correct dialogue.
- **peq 25055 `Guard_T`Quetal`** — Data merged into name-scoped `Guard_T-Quetal.lua` (created from p2002 25117 which is more complete: Enter Combat + After Death). peq only had After Death.

## Applied with caveats

- **Alkabor 25169 `Missionary_of_Rodcet`** — Existing `25169.pl` on this server is a Neriak Dragoon guard template (Angelox `# Guards / # Nektulos / # Angelox` file, "Prepare to meet the skilled fury of a Neriak Dragoon" combat lines). NPCID conflict between DBs. Only added `EVENT_DEATH_COMPLETE` with "My comrades will avenge my death." — flavour-neutral, fits both a Neriak Dragoon guard and an out-of-place Rodcet Nife missionary. Skipped Enter Combat "Time to die $name" since existing Neriak Dragoon randomized combat lines already cover the "aggressive greeting" role.

## Already covered — no action

Where existing `.lua` handlers via `eq.ChooseRandom` (An_Arcane_*, Leatherfoot_* series) or `.pl` handlers already contain equivalent or matching lines, no edit was made. Case-insensitive dedupe was applied per-file.

Deathfist orc scripts (`a_deathfist_legionnaire.pl`, `a_deathfist_templar.pl`) use `EVENT_DEATH` instead of the rule's preferred `EVENT_DEATH_COMPLETE`. Left unchanged (rule: "Never remove existing"). Adding `EVENT_DEATH_COMPLETE` with the same "Argh! Clan Deathfist..." line would double-fire.

## Lore judgment

Nektulos Forest = Neriak dark-elf territory bordering Commonlands. Included NPC categories: Neriak Dragoon guards, Deathfist orc raiders, snakes (moss/garter/tree/black mamba), ash drakelings, Arcane cultists (dark-elf casters), and the Leatherfoot Halflings encamped at the Nektulos–Commonlands zone line. Rodcet Nife initiates/missionaries (Erudite paladins on a mission through Nektulos) are lore-plausible transients — included.
