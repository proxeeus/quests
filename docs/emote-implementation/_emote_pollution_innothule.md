# innothule -- emote review

Zone: `innothule` (Innothule Swamp — troll swamp with alligators, snakes, kobolds, frogloks, and House-Guard/Deepwater Knight/Paladin-of-Tunare troll hunters. Grobb newbie feeder zone.)
Priority: p2002 > Alkabor > peq > neq

## NPCID conflicts across ref dirs (same NPCID, different NPC name)

These IDs have different names in different ref dirs; per-NPC higher-priority ref wins. Lower-priority name variants dropped:

- **46006**: Alkabor=`Tann_Cellus` (WINS) vs peq=`Bunk_Odon` (dropped). peq `Bunk_Odon` is redundant — Alkabor gives Bunk_Odon at NPC 46016 instead, which was imported.
- **46020**: Alkabor=`Zepin_Winsle` (WINS) vs peq=`Gwynn_Marthank` (dropped). peq `Gwynn_Marthank` redundant — Alkabor has Gwynn_Marthank at NPC 46015, imported.
- **46023**: Alkabor=`Fandl_Arathin` (WINS) vs peq=`Jyle_Windstorm` (dropped). peq `Jyle_Windstorm` redundant — Alkabor has Jyle_Windstorm at NPC 46027, imported.
- **46024**: Alkabor=`Hogus_Durmas` (WINS) vs peq=`a_kobold_hunter` (dropped). `a_kobold_hunter.lua` already existed independently — no data lost.

Duplicate names at different NPCIDs (both entries kept for the shared name-based lua; higher-priority ref content used):

- `Peltin_Funter` (46021 Alkabor / 46029 peq) — Alkabor ref used.
- `Rell_Ostodl` (46009 p2002 / 46030 peq) — p2002 ref used.
- `Tann_Cellus` (46006 Alkabor / 46039 peq) — Alkabor ref used.
- `Zepin_Winsle` (46020 Alkabor / 46043 peq) — Alkabor ref used.
- `a_froglok_guard` (46051 p2002 / 46107 peq) — p2002 ref used (identical content anyway).

## Skipped as suspected ref pollution

- **a_young_water_moccasin (46042)**: `"Frrroooaaakkk!"` — froglok croak pasted onto a snake. Snakes don't croak. Same line appears verbatim on `a_froglok_guard` (46051/46107), suggesting a data-entry autofill bug. Present in both p2002 and peq dumps but still lore-wrong.
- **Slayer_Captain (46034)**: three Basher lines (`"I shall pluck you limb from limb!!"` / `"Those who play with da Basher always gets bashed good!!"` / `"Curse you!! Da bashers will have yer head."`) — Broken Skull troll dialogue pasted onto a Paladin-of-Tunare Slayer Captain (context confirmed by neighbouring `Jyle_Windstorm` = "Paladins of Tunare"). Clearly wrong faction; skipped.
- **Zimbittle (46044, Alkabor)**: same three Basher lines pasted onto a non-troll (gnome/human) NPC. Skipped.

## Duplicate/orphan quest files noticed

- `#Basher_Kazrak.pl` and `#Sugal_The_Fist.pl` — filenames prefixed with `#` (disabled/backup copies). `Sugal_The_Fist.pl` is the active version. No ref data for `Basher_Kazrak`; left alone.

## Files with existing `.lua` + `.pl` collisions

None — where both existed, only the `.lua` was edited (per rules). Where only `.pl` existed (the four `Basher_*` perl files, `a_troll_slayer.pl`, `Basher_Nkekta.pl`), the perl file was patched.

## Notes on refactors

- Existing bare `event_combat` handlers on `Rell_Ostodl.lua`, `a_lesser_kobold.lua`, `a_kobold_hunter.lua`, `a_snake.lua` were wrapped in the standard `if (e.joined) then ... end` guard to match repository convention.
- All four `Basher_*.pl` files (Oggrik, Smag, Trak, Nkekta) and `a_troll_slayer.pl` gained `EVENT_DEATH_COMPLETE` (After Death) to match ref data.
