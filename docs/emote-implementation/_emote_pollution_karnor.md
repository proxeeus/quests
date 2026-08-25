# Karnor's Castle — Emote Pollution Log

Zone: karnor (Karnor's Castle — Kunark iksar undead / Venril Sathir stronghold)
Ref priority: Alkabor > neq (p2002 + peq have no data)
Date: 2026-08-21

## Ref inventory
- Alkabor: 1 file (`102004_a_drolvarg_pawbuster.txt`)
- neq:     1 file (`102004_a_drolvarg_pawbuster.txt`) — identical content to Alkabor, no new lines added

## NPCs processed

### a_drolvarg_pawbuster (NPCID 102004)
- Ref (Alkabor, wins): `Say -- Enter Combat: Once with tail now with claw!!  I am the greatest brawler of all!!`
- Existing quest file: `a_drolvarg_pawbuster.lua` already contained the same rally line (case-insensitive dedupe; only difference was `!!` vs `!` — kept existing punctuation to preserve local style).
- Change: added `if e.joined then` gate so the rally only fires on combat enter, not on leave. Text preserved verbatim from existing file.
- Target resolution: `.lua` present, `.pl` absent — edited `.lua`.
- Lore: fits (drolvarg brawler taunt in Kunark iksar stronghold).

## Notes
- No new NPCs created for this zone (ref had only 1 file, already covered).
- No skipped/pollution lines: only line in ref is lore-consistent combat taunt.
- No ambiguity flags: line was explicitly labeled `Enter Combat`.
- Other quest files present but with NO ref data (untouched): `Spirit_of_Venril_Sathir.pl`, `Venril_Sathirs_remains.pl`, `a_human_skeleton.pl`.
