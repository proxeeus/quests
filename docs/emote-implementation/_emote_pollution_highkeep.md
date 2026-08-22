# Highkeep Emote Import Pollution Log

Zone: `highkeep` (High Keep, human castle stronghold of Lord Bayle)
Priority: p2002 > Alkabor > peq > neq

## NPCID conflicts across ref dirs (same NPCID, different NPC name)

These IDs have different names in different ref dirs; priority selection wins per rules. The lower-priority name variants were dropped:

- **6000**: Alkabor=`a_pickclaw_visionary` (WINS) vs peq=`Guard_Heltch` (dropped). Note peq also has 6000 Guard_Heltch — dropped.
- **6084**: p2002=`a_pickclaw_seer` (WINS) vs peq=`Guard_Yeltin` (dropped). NPC 6104 in p2002 is Guard_Yeltin.
- **6179**: Alkabor=`Guard_Queztin` (WINS) vs peq=`a_pickclaw_spiritist` (dropped). peq NPC 6093 is also a_pickclaw_spiritist — that one imported.
- **6188**: p2002=`Guard_Bicker` (WINS) vs peq=`Guard_Bicker` (same, fine).
- **6192** (Alkabor): `a_kitchen_drudge` — merged into `a_kitchen_drudge.lua`.

## NPCs with existing Perl quests (unpatched)

- `Fenn_Kaedrick.pl` (no ref data in any dir; no changes required)

## Files with existing `.lua` + name mismatch to NPCID

None found — all edits performed on existing name-based `.lua` files; no `<NPCID>.lua` collisions detected in highkeep.

## Invalid ref filenames

- `Emotes_peq/highkeep/6189_#a_noble.txt` — filename begins with `#`, appears to be a placeholder/template. Content is standard noble EC/AD; imported into `a_noble.lua` (no dedicated file created for NPC 6189).

## NPCs skipped for lore reasons

None — High Keep is a neutral human castle stronghold with humans, gnomes (bank), Pickclaw goblins in the basement, dark elves in the dungeon, and paladins/rogues on quest chains. All ref emotes fit this setting.

## Files pre-populated with standard Guard combat template

The existing quest folder had 42+ files (all `Guard_*`, `a_guard`, `a_noble`, `a_prisoner`, `Xentil_Herkanon`, `Captain_Bosec`, `Captain_Boshinko`) that already contained the standard `event_combat` (ChooseRandom with `Time to die, %s.` + 4 alt lines) plus `event_death_complete` ("My comrades will avenge my death."). These files already satisfy the p2002/Alkabor guard emote set; no dedupe/change was needed for those handlers.

## Multi-ID NPCs (multiple NPCIDs share a single generic name/lua)

The following generic mob names appear at many NPC IDs and were merged into a single `.lua` file:

- `a_guard` (6014, 6015, 6016, 6017, 6175) — 6016 adds unique `On Spawn` shout
- `a_noble` (6086, 6089, 6096, 6142, 6143, 6146, 6190, 6189)
- `a_prisoner` (6043, 6045, 6053, 6054, 6126)
- `a_kitchen_drudge` (6071, 6072, 6073, 6136, 6137, 6173, 6174, 6192)
- `a_lady_in_waiting` (6069, 6070, 6133, 6169)
- `a_maid` (6124, 6168)
- `a_goblin_thief` (6040, 6144, 6150, 6176)
- `a_pickclaw_cabalist` (6088, 6138, 6147)
- `a_pickclaw_guard` (6098, 6156)
- `a_pickclaw_lookout` (6080, 6091, 6095)
- `a_pickclaw_raider` (6119, 6120)
- `a_pickclaw_seer` (6038, 6039, 6084)
- `a_pickclaw_visionary` (6000, 6149)
- `a_pickclaw_warrior` (6037, 6041)
- `Isabella_Cellus` (6082, 6092, 6167)
- `Dyrna_Nlith` (6047, 6134)
- `Tyrana_Slil` (6044, 6132)
- `Princess_Lenia` (6046, 6135, 6172)
- `Lucky_the_Beggar` (6010, 6157)
- `Guard_*` (each guard family has multiple IDs — all satisfied by the shared name-based lua file)
