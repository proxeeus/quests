# Emote Pollution Log — warslikswood (Warsliks Wood)

Ref source: `C:/eqemu/ref_emotes/Emotes_Alkabor/warslikswood/` (Alkabor only)
Scope: 13 NPC ref files. All events reviewed for lore fit and duplicates.

## Skipped / rejected refs

None. All 13 ref NPCs (goblin pit fighter, Crusaders of Greenmist, Legion of Cabilis troopers, forest giant) are lore-consistent with Warsliks Wood (Kunark iksar mountain forest bordering Cabilis — iksar patrols, goblins, mountain/forest giants).

## Internal duplicates in ref

- `79016_a_goblin_pit_fighter.txt`: three identical `Emote -- Enter Combat` lines → deduped to 1.
- Troopers 79084/79085/79086/79087/79088/79089/79090/79091/79092: all share the identical 3-line block (Enter Combat / After Death / unlabeled monologue). Not pollution — each row belongs to a distinct NPC id. Treated per-NPC.
- The unlabeled `Say -- : Another victory for the Legion of Cabilis.` on every trooper is a monologue → mapped to `event_slay` per standard.

## Implementation notes

Nothing new written. All 13 refs were already fully implemented in the zone folder:

- Lua handlers present and content-accurate for: `a_goblin_pit_fighter`, `Crusader_Myxl`, `Crusader_Eaxl`, `Trooper_Agash`, `Trooper_Lunmiz`, `Trooper_Olon`, `Trooper_Gepwyz`, `Trooper_Syldon`, `Trooper_Melzok`, `Trooper_Walrun`, `Trooper_Kroniz`, `#a_forest_giant`.
- Perl handler present for `Trooper_Roklon.pl` (has quest turn-in logic; contains full `EVENT_COMBAT` / `EVENT_SLAY` / `EVENT_DEATH_COMPLETE` matching ref). Per rule: never shadow existing `.pl` with a new `.lua`.

## Cross-check (ref vs on-disk)

| NPC ID | Ref events | On-disk file | Status |
|--------|------------|--------------|--------|
| 79016 | Enter Combat | `a_goblin_pit_fighter.lua` | matches |
| 79081 | Enter Combat, After Death | `Crusader_Myxl.lua` | matches |
| 79082 | Enter Combat, After Death | `Crusader_Eaxl.lua` | matches |
| 79084 | Enter Combat, After Death, slay | `Trooper_Agash.lua` | matches |
| 79085 | Enter Combat, After Death, slay | `Trooper_Lunmiz.lua` | matches |
| 79086 | Enter Combat, After Death, slay | `Trooper_Olon.lua` | matches |
| 79087 | Enter Combat, After Death, slay | `Trooper_Gepwyz.lua` | matches |
| 79088 | Enter Combat, After Death, slay | `Trooper_Syldon.lua` | matches |
| 79089 | Enter Combat, After Death, slay | `Trooper_Melzok.lua` | matches |
| 79090 | Enter Combat, After Death, slay | `Trooper_Roklon.pl` | matches (patched into existing .pl) |
| 79091 | Enter Combat, After Death, slay | `Trooper_Walrun.lua` | matches |
| 79092 | Enter Combat, After Death, slay | `Trooper_Kroniz.lua` | matches |
| 79113 | Enter Combat | `#a_forest_giant.lua` | matches |

Nothing removed, nothing added. Zone is fully in sync with Alkabor ref.
