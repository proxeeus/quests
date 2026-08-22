# Emote Pollution Log — gukbottom (Lower Guk)

Generated 2026-08-21 from `C:/eqemu/ref_emotes/Emotes_{p2002,Alkabor,peq,neq}/gukbottom/`.

Priority applied per-NPC: **p2002 > Alkabor > peq > neq**.

## Ref dataset summary

The entire ref corpus for gukbottom contains only **two unique lines**, both `Say -- Enter Combat`:

| Line | NPC family |
|------|-----------|
| `Frrroooaaakkk!` | all `a_froglok_*` variants + `Slaythe_the_Slayer` |
| `Areeeeewwwww` | `a_greater_ice_bones` (undead) |

No `Emote`, `Shout`, `On Death`, `After Death`, `Killed PC/NPC`, `Hailed`, `On Spawn`, or `On Despawn` events exist in any priority dir. No `$name` substitutions. All internal duplicates dedupe to a single line each.

## NPC ID collapse (name-based targeting)

Ref dumps contain many spawn-slot duplicates (same NPC name, different IDs). All merge into a single name-based Lua file per the target-resolution rule. Priority winner per unique name shown below (all IDs across all dirs → one Lua file):

### Frogloks (all say `Frrroooaaakkk!` on Enter Combat)

| Lua file | Winning ref (priority) | Also present in |
|----------|------------------------|-----------------|
| `a_froglok_slave.lua` | p2002 66038 | Alkabor, peq (66037, 66077), neq |
| `a_froglok_shin_knight.lua` | p2002 66047 | Alkabor, peq (66025, 66048, 66065, 66081), neq |
| `a_froglok_zol_knight.lua` | p2002 66053 | Alkabor, peq (66029, 66031, 66074, 66082), neq |
| `a_froglok_vis_knight.lua` | p2002 66059 | Alkabor, peq (66032, 66078, 66110, 66140), neq |
| `a_froglok_wan_knight.lua` | p2002 66060 | Alkabor, peq (66052, 66055, 66058, 66061), neq |
| `a_froglok_jin_shaman.lua` | p2002 66067 | Alkabor, peq, neq |
| `a_froglok_kor_shaman.lua` | p2002 66069 | Alkabor, peq (66068, 66118, 66134), neq |
| `a_froglok_bok_knight.lua` | p2002 66071 | Alkabor, peq (66070, 66072), neq |
| `a_froglok_dar_knight.lua` | p2002 66075 | Alkabor, peq (66066, 66073), neq |
| `a_froglok_yun_shaman.lua` | p2002 66083 | Alkabor, peq (66056, 66119, 66133), neq |
| `a_froglok_tsu_shaman.lua` | p2002 66104 | Alkabor, peq (66063, 66079, 66152), neq |
| `a_froglok_yun_priest.lua` | p2002 66120 | Alkabor, peq, neq |
| `a_froglok_tactician.lua` | p2002 66121 | Alkabor, peq, neq |
| `a_froglok_tal_shaman.lua` | p2002 66123 | Alkabor, peq (66057), neq |
| `a_froglok_guk_shaman.lua` | p2002 66139 | Alkabor, peq (66117), neq |
| `a_froglok_crusader.lua` | p2002 66153 | Alkabor, peq, neq |
| `a_froglok_herbalist.lua` | p2002 66160 | Alkabor, peq, neq |
| `a_froglok_noble.lua` | p2002 66175 | Alkabor, neq |
| `a_froglok_shin_warrior.lua` | p2002 66240 | Alkabor, peq (66024, 66064, 66105), neq |
| `a_froglok_guk_knight.lua` | p2002 66246 | Alkabor, peq (66154), neq |
| `a_froglok_urd_shaman.lua` | peq 66054 (p2002/Alkabor absent) | peq (66084, 66103) |
| `Slaythe_the_Slayer.lua` | p2002 66145 | Alkabor, neq |

### Undead

| Lua file | Winning ref (priority) | Also present in |
|----------|------------------------|-----------------|
| `a_greater_ice_bones.lua` | p2002 66045 (`Areeeeewwwww`) | Alkabor, peq (66027, 66046, 66096, 66109), neq |

## Files created (22)

New name-based `.lua` handlers, one per unique NPC name — all in `C:/eqemu/quests/gukbottom/`.

## Existing files preserved

- `a_froglok_shin_warrior.lua` — **already had** the exact `Frrroooaaakkk!` combat handler; ref content deduplicates to zero net additions, so file was left untouched (would have been an idempotent no-op).
- `a_ghoul_scribe.lua` — has `event_trade` (enchanter epic lead-in). No ref emote data for this NPC. Untouched.
- `#a_corrupted_gnome_explorer.pl`, `#a_spectral_shimmer.pl` — no ref emote data. Untouched.

## Notes / skipped

- **peq-only alt IDs (`66024`, `66025`, `66027`, `66029`, `66031`, `66032`, `66037`, `66046`, `66048`, `66052`, `66054`–`66058`, `66061`, `66063`–`66084`, `66096`, `66103`, `66105`, `66109`, `66110`, `66117`–`66119`, `66133`, `66134`, `66140`, `66152`, `66154`)** — every one is a spawn-slot duplicate of an NPC name already covered by a higher-priority dir (or by `a_froglok_urd_shaman` from peq itself). All content collapses into the existing name-based files. Priority chain still respected: for names present in p2002/Alkabor, the p2002 version wins; only `a_froglok_urd_shaman` is peq-exclusive.
- **No `On Death` / `Killed PC` / `Hailed` / spawn events** anywhere in the corpus for this zone — reasonable given the low-level trash-mob nature of Lower Guk.
- **No lore-based skips** — every NPC in the ref set is a frog-goblin or an undead ice-bones spawn, both of which fit Lower Guk perfectly. Content ("Frrroooaaakkk!" / "Areeeeewwwww") is on-lore.
- **No pollution/wrong-zone contamination detected.**
