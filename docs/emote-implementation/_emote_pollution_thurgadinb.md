# Emote Pollution Log — thurgadinb (Icewell Keep)

Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/thurgadinb/*.txt` (Alkabor only)
Zone: thurgadinb — King Dain Frostreaver IV's royal court, Icewell Keep
Date: 2026-08-22

## Skipped / Judgment Calls

None skipped. All 32 Alkabor ref emotes were merged into the corresponding
`.pl` / `.lua` files. Every NPC in the ref is a Coldain court member, royal
guardsman, sentinel, watcher, councilor, or the Dain himself — all fit the
zone lore (King Dain's throne room and inner keep).

Repeated identical lines in ref files (e.g. 14x Enter Combat + 14x After
Death for `129033_an_Icewell_Sentinel`, 10x After Death for
`129059_an_Icewell_Sentry`, 10x After Death for `129101_#Dain_Frostreaver_IV`)
were collapsed to a single emote handler — these repeats represent multiple
Alkabor spawns of the same NPC template firing the same emote, not distinct
lines.

## Overrides / Notes

- **`129003` and `129101`** — both are `#Dain_Frostreaver_IV`. Existing
  `#Dain_Frostreaver_IV.pl` already had matching Enter Combat text. No
  After Death emote in ref, so nothing added.
- **`129059` and `129100`** — both are `an_Icewell_Sentry`. Shared file
  `an_Icewell_Sentry.lua` covers both. Existing death emote text
  (`My comrades will avenge my death.`) was **overridden** to match Alkabor
  ref (`Defeated by the likes of you!? Avenge me, brothers!`).
- **`an_Icewell_Sentinel.lua`** — same override as above; ref text takes
  precedence over pre-existing custom text.
- **`Chamberlain_Krystorf.pl`** — ref shows a unique Enter Combat line
  (`Time to die $name.`) and generic After Death; added both. Kept per
  "default include" rule.
- **`Loremaster_Solstrin.pl`** — existing Enter Combat already matches
  Alkabor ref exactly; ref has no After Death emote. No change.
- **`Councilor_Juliah_Lockheart`** — both `.pl` (NPC 129045) and
  `#Councilor_Juliah_Lockheart.lua` (spawn variant, NPC 129063) exist.
  Files handle different NPCs; patched `.pl` only for the ref emote.
- **`Sentry_Ellison.pl`** — new file created (NPC 129001 had no quest
  file).
- All Royal Guardsmen / Sentinels / Watchers share the same standard
  invaders/defeated emote pair.
