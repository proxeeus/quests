# Emote Pollution Log — tox (Toxxulia Forest)

Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/tox/*.txt` (15 files, Alkabor only)
Date: 2026-08-22

## Summary
15 ref files processed. 12 NPCs already had matching handlers in place (no-op / dedupe skip). 1 patched (missing enter-combat line). 2 created (no prior file existed).

## Per-NPC decisions

| NPCID | Name | Ref content (deduped) | Existing target | Action |
|---|---|---|---|---|
| 38000 | a_thistle_snake | Emote EnterCombat: "hisses and strikes!" | `a_thistle_snake.lua` | SKIP — line already present |
| 38001 | a_kobold_sentry | Say EnterCombat: "Grrrrr. Bark. Bark. Grrrrr." | `a_kobold_sentry.lua` | SKIP — line already present |
| 38004 | a_kobold_runt | Say EnterCombat: "Grrrrr. Bark. Bark. Grrrrr." | `a_kobold_runt.lua` | SKIP — line already present |
| 38005 | a_kobold_shaman | Say EnterCombat: "Grrrrr. Bark. Bark. Grrrrr." | `a_kobold_shaman.lua` | SKIP — line already present |
| 38007 | a_moss_snake | Emote EnterCombat: "hisses and strikes!" | `a_moss_snake.lua` | SKIP — line already present |
| 38008 | a_kobold_watcher | Say EnterCombat: "Grrrrr. Bark. Bark. Grrrrr." | `a_kobold_watcher.lua` | SKIP — line already present |
| 38035 | a_kobold_scout | Say EnterCombat: "Grrrrr. Bark. Bark. Grrrrr." | `a_kobold_scout.lua` | SKIP — line already present |
| 38053 | Sentinel_Creot | Say EnterCombat: "Prepare to die, infidel!!" | `Sentinel_Creot.pl` | SKIP — line already present |
| 38061 | Elial_Brook | Say EnterCombat + Say AfterDeath | `Elial_Brook.lua` | PATCH — added missing `event_combat` (AfterDeath already present) |
| 38067 | Shintar_Vinlail | Say EnterCombat + Say AfterDeath | `Shintar_Vinlail.pl` | SKIP — both lines already present |
| 38075 | Sentinel_Flavius | Say EnterCombat: "Prepare to die, infidel!!" | `Sentinel_Flavius.pl` | SKIP — line already present |
| 38076 | Sentinel_Drom | Say EnterCombat: "Prepare to die, infidel!!" | `Sentinel_Drom.pl` | SKIP — line already present |
| 38134 | Rungupp | Say EnterCombat: "Bash 'n Smash!..." | `Rungupp.pl` | SKIP — line already present |
| 38151 | Fittorn_Bladespur | Emote EnterCombat + Emote AfterDeath | none | CREATE — `Fittorn_Bladespur.pl` |
| 38158 | Poacher_Hill | Say EnterCombat "Time to die $name." + Say AfterDeath | none | CREATE — `Poacher_Hill.pl` |

## Notes
- All ref files contained massive internal duplication (dozens–hundreds of identical lines); deduped as expected.
- No cross-target conflicts (no NPC had both `.pl` and `.lua`).
- Convention for new custom-named NPCs in `tox/` is `.pl` (Sentinel_*, Rungupp, Shintar_Vinlail, Poacher_*), so new files created as `.pl`.
- Fittorn_Bladespur emote text intentionally preserves the ref's mid-sentence quote style (no closing punctuation) — matches source verbatim.
- Poacher_Hill uses raw `$name` interpolation via Perl `quest::say` — standard idiom.
- No lines dropped for lore reasons; all content is straightforward combat/death banter consistent with Erudin sentinels, kobolds, snakes, and named outlaws in Toxxulia Forest.
