# Skyshrine Emote Pollution / Implementation Log

Zone: **skyshrine** (Skyshrine, Claws of Veeshan dragon city, Velious)
Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/skyshrine/` (Alkabor only)
Date: 2026-08-21

## Ref inventory (Alkabor)

9 ref files present:

| NPC ID  | NPC Name             | Combat Emote | Death Emote                                | Notes |
|---------|----------------------|--------------|--------------------------------------------|-------|
| 114343  | Ziglark_Whisperwing  | Yes          | Yes                                        | Kin flavor |
| 114410  | Commander_Leuz       | Yes          | Yes                                        | Kin flavor |
| 114437  | a_kromzek_spy        | Yes          | -                                          | Kromzek invader |
| 114600  | Zildainez            | Yes          | Yes                                        | Kin flavor |
| 114601  | Hytloc               | Yes          | Yes                                        | Kin flavor |
| 114602  | Salginor             | Yes          | Yes                                        | Kin flavor |
| 114603  | Guardian_Trekolz     | Yes          | Proximity emote (velium figure spawn)      | Golem/construct |
| 114604  | Guardian_Seacly      | Yes          | Proximity emote (velium figure spawn)      | Golem/construct |
| 114626  | Sentry_Rotiart       | Yes          | Proximity emote (velium golem spawn)       | Golem/construct |

## Implementation status

**All 9 ref entries are already fully implemented in existing quest scripts.** No edits required.

| NPC ID  | Script file                          | Type | Ref combat matched | Ref death matched |
|---------|--------------------------------------|------|--------------------|-------------------|
| 114343  | `Ziglark_Whisperwing.pl`             | Perl | Yes (line 51)      | Yes (line 56)     |
| 114410  | `Commander_Leuz.pl`                  | Perl | Yes (line 35)      | Yes (line 40)     |
| 114437  | `#a_kromzek_spy.lua`                 | Lua  | Yes (line 3)       | (no death in ref) |
| 114600  | `Zildainez.lua`                      | Lua  | Yes (line 3)       | Yes (line 9)      |
| 114601  | `Hytloc.lua`                         | Lua  | Yes (line 3)       | Yes (line 9)      |
| 114602  | `Salginor.lua`                       | Lua  | Yes (line 3)       | Yes (line 9)      |
| 114603  | `Guardian_Trekolz.lua`               | Lua  | Yes (line 3)       | Proximity spawn (line 9) — cosmetic figure spawn substitutes for on-death emote text |
| 114604  | `Guardian_Seacly.lua`                | Lua  | Yes (line 3)       | Proximity spawn (line 9) — cosmetic figure spawn substitutes for on-death emote text |
| 114626  | `Sentry_Rotiart.pl`                  | Perl | Yes (line 26)      | Proximity spawn (line 36) — cosmetic golem spawn substitutes for on-death emote text |

## Notes on golem/construct death emotes (114603, 114604, 114626)

The ref lists their death lines as "Proximity Emote - Other Say" describing the
velium figure/golem crumbling. The existing scripts implement this correctly by
spawning a "lifeless velium figure" (NPC 114589) or "velium golem" (NPC 114588)
whose own scripts (`The_lifeless_velium_figure.lua`, `The_velium_golem.lua`)
deliver the proximity emote text. The current cosmetic-spawn approach matches
Alkabor behavior.

## Files touched this pass

- None. All ref lines already present in existing scripts.

## Pollution / lore concerns

- No pollution: every ref line is fully aligned with Skyshrine (Claws of Veeshan
  kin flavor) or the appropriate Kael Drakkel Kromzek intruder line for 114437.
- No lore-inappropriate lines were dropped.
