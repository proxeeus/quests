# Qeynos (South Qeynos) — Emote/Flavor Pollution Log

Ref dirs (priority order): p2002 > Alkabor > peq > neq.

## Skipped / GM-only NPCs

- **1305 #Lanhern_Firepride** (Alkabor) — `#` prefix indicates a GM-invoked spawn variant, not a live zone NPC. No `.lua` file exists and no live spawn. Skipped; retain only the primary 1155 Lanhern_Firepride handler.
- **1312 #a_furtive_figure** (peq) — `#` prefix GM-only spawn used by an event chain. Not a persistent Qeynos city NPC. Skipped.

## Duplicate / cross-ref notes

- **1145 a_sewer_rat** (p2002) — `Emote On Death: .squeak, squeak..` chosen (highest priority).
- **1156 a_sewer_rat / 1157 a_sewer_rat** (peq) — both variants show `Emote After Death: squeaks as it wanders.` These are distinct NPC IDs sharing the shared `a_sewer_rat.lua` filename. The p2002 variant already covers the intent (death squeak). No per-ID quest file split exists in EQEmu; the shared `a_sewer_rat.lua` will fire for all three IDs. Preferred p2002 wording used; peq variant text noted here.

## Merge decisions

- **1042 Trumpy_Irontoe** — p2002 gives only Enter Combat (`Prepare to meet my iron toe!`). Existing `event_death_complete` (custom `<BURP!>` line referencing Kane) is IC-specific and PRESERVED (specific > generic). Added event_combat with the iron-toe line, replacing what would otherwise be the generic guard rally (Trumpy is a shady dwarf, not a guard).
- **1085 Lieutenant_Arathur** — Alkabor provides a rich unique Enter Combat line + an unlabeled monologue (`How I loathe to soil my blade with such filth.`) mapped to `event_slay`, and a unique After Death line. Overrides the generic guard rally + generic "My comrades will avenge my death."
- **1089 Raz_The_Rat_Misk** — Duplicate lines in Alkabor (Enter Combat and unlabeled monologue are identical: `This is what happens when ya cross the Circle.`). Used once for Enter Combat and once for event_slay per merge rules.
- **1137 Wylin_Dodmil** — Unlabeled monologue (`A valiant effort! Unfortunately, no match for the mettle of a Steel Warrior!`) mapped to `event_slay` (Killed PC/NPC — Wylin is a fighter-guild trainer, monologue fits slay context).
- **1150 Guard_Lasen** — Alkabor unique drunk-guard line (`Halt! In the... *burp*... name of... *hic!*... Antonius Bayle!`) overrides the generic guard rally. Guard_Lasen also had a "hot day / need water" hail already; keeping it. No After Death in ref → keep generic `My comrades will avenge my death.` from existing.
- **1092 Madame_Serena** — Ref line (`I put a curse upon thee! Thou shalt never sire children!`) chosen over generic — fits fortune-teller lore. No After Death in ref; no generic added (not a guard).
- **1158 Anehan_Treol** — Unique After Death line (`League of Antonican Bards has many members...`) overrides generic; Anehan is a bard, not a guard. Enter Combat uses standard gnoll shout.

## NPCs already fully covered by existing generic guard event_combat + event_death_complete

The following guards already carry the shared 4-option `Time to die $race.` / `My comrades will avenge my death.` template that matches the Alkabor ref content verbatim. No edits made:

- 1001 Guard_Mezzt, 1002 Guard_Jerith, 1006 Guard_Cyrillian, 1090 Guard_Beren, 1091 Guard_Corshin, 1147 Guard_Wenbie, 1148 Guard_Relam, 1149 Guard_Calik, 1151 Guard_Kwint, 1152 Guard_Naret, 1174 Guard_Forbly, 1181 Guard_Dunix, 1189 Guard_Phaeton, 1200 Guard_Urius.

## Lore filter — nothing skipped as clearly-wrong

South Qeynos is the human capital city; all referenced NPCs (Guards of Qeynos, Antonican Bards, Priests of Life adjuncts, merchants, dockside NPCs, tax collectors, sewer rats) are on-lore and included.

## Files touched

Patched existing `.lua` files (event_combat / event_death_complete / event_slay appended, existing code untouched):

- Behroe_Dlexon, Marlin_Bizmite, Trumpy_Irontoe, Vicus_Nonad, Danaria_Hollin, Klieb_Torne, Micc_Koter, Bruno_Barstomper, Zamel, Endric, Gharin, Indaria, Lieutenant_Arathur (overrode generic guard combat + death), Raz_The_Rat_Misk, Madame_Serena, Hansl_Bigroon, Eve_Marsinger, Tralyn_Marsinger, Wylin_Dodmil, Gash_Flockwalker, Menkes_Tabolet, a_sewer_rat, Guard_Lasen (overrode generic guard combat), Den_Magason, Morty_Prysmith, Lanhern_Firepride, Anehan_Treol, Faren, Cassius_Messus, Lomarc.

Created new `.lua` files:

- Meera_Lylon, Gero_Yopetu, Tomas_Zelnik, Iala_Lenard, Ian_Silverbright, Talym_Shoontar, Largon_Welsh.

No `.pl` file for any of these NPCs existed — safe to add `.lua` per Lua-shadows-Perl rule.
