# kaladimb — emote review

## Skipped as suspected ref pollution
- None; all ref lines fit lore of North Kaladim (inner dwarf keep, Kazon Stormhammer's guards, Church of Underfoot, Miners Guild 628 / 249).

## Duplicate/orphan quest files noticed
- Founy Jestands (67000) Alkabor ref has an unlabeled `Say -- : Another unworthy opponent. Never cross Mining Guild 628!` — treated per spec as a slay/monologue line (routed to `EVENT_SLAY`); logged here as ambiguous.
- Datur Nightseer (67029) peq hail response is a paragraph-length paladin-guildmaster welcome; existing `.pl` already handles `EVENT_ITEM` handins and an `EVENT_ENTER` new-recruit whisper, but had no `EVENT_SAY`/hail handler — added minimally without disturbing the level-1 recruit whisper or handin flow.
- All five Guard_* .lua files (Ainamar, Dalammer, Dalthur, Doradek, Kaldolar) already contained a canonical "For the glory of Kaladim..." combat/slay/death set; the Alkabor ref "Time to die $name." / "My comrades will avenge my death." lines were added as ChooseRandom variants (the death line was an exact-dedupe match to existing and preserved as-is).
- Guard_Kanuf (67047) had no existing `.lua` or `.pl`; created new `Guard_Kanuf.lua` mirroring sibling-guard style plus the ref lines.
