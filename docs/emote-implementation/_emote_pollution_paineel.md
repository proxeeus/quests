# Emote Pollution Report — paineel (Paineel)

Zone: **paineel** — Heretic Erudite necromancer city (dark magic students, cultists, undead servants).

Ref priority applied: **p2002 > Alkabor > peq > neq** (peq had no data).

## NPCs Processed

| NPC ID | NPC Name | Ref Source | Existing Handler | Action | Events Added |
|--------|----------|------------|------------------|--------|--------------|
| 75000 | Noclin_Saah | Alkabor | Noclin_Saah.pl | PATCH | EVENT_COMBAT (Enter Combat) |
| 75011 | Azzar_Habbib | Alkabor | Azzar_Habbib.pl | PATCH | EVENT_COMBAT (Enter Combat) |
| 75017 | library_assistant | Alkabor | library_assistant.lua | PATCH | event_combat (Enter Combat) |
| 75018 | Dzan_Amo | p2002 (=Alkabor) | Dzan_Amo.pl | PATCH | EVENT_COMBAT (Enter Combat) |
| 75019 | Atdehim_Sqonci | p2002 (=Alkabor) | Atdehim_Sqonci.pl | PATCH | EVENT_COMBAT (Enter Combat) |
| 75020 | Elia_Athrex | Alkabor | Elia_Athrex.lua | SKIP (already present) | Existing event_combat text is identical to ref |
| 75021 | a_spirit_chanter | p2002 (=Alkabor, deduped) | none | CREATE .pl | EVENT_COMBAT (Enter Combat) |
| 75029 | Ernax_the_Scholar | Alkabor | Ernax_the_Scholar.pl | PATCH | EVENT_COMBAT (Enter Combat) |
| 75030 | Tormented_Soul | p2002 | none | CREATE .pl | EVENT_COMBAT (Enter Combat) |

## Priority Skips / Notes

- **75030 Tormented_Soul**: p2002 has ONLY the Enter Combat line. Alkabor additionally offered `On Spawn: "Was oonncee... aliiive..."`. Per strict priority (p2002 wins outright), the On Spawn line was skipped. This is thematically fitting flavor and could be re-considered if p2002 rule is relaxed.
- **75018 / 75019 / 75021**: p2002 and Alkabor have identical Enter Combat text ("Your worst nightmares shall not compare..."), so priority choice has no content impact. Internal duplicates in `a_spirit_chanter` (same line twice) were deduped.
- **75020 Elia_Athrex**: The existing `.lua` already contains the ref's `event_combat` line verbatim ("Cazic-Thule, lend me your power!"). No modification needed.

## Lore Filter

All Enter Combat lines are consistent with a Heretic Erudite necromancer city: invocations of Cazic-Thule, soul-torture threats, boasts of dark magic. No lore-inconsistent lines were skipped.

## Handler Rule Compliance

- **No new `.lua` files were created for NPCs that already had a `.pl`**. All patches to existing `.pl` files were done in Perl syntax.
- `library_assistant` already had `.lua` (no `.pl` present), so patched the `.lua` in place.
- New handlers for `a_spirit_chanter` and `Tormented_Soul` were created as `.pl` (no pre-existing lua handler for either).
