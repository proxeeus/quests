# Emote Pollution Log — zone: hole (The Hole / ruins of Old Paineel)

Records anomalies encountered while importing ref-dump emotes into `C:/eqemu/quests/hole/`.
Priority order per NPC: p2002 > Alkabor > peq > neq.

## Skipped / dropped

- None dropped for lore reasons this pass. All source lines fit Old Paineel setting
  (undead erudites, ratmen, elementals, animated constructs, gargoyles, spirits).

## Naming-conflict warnings

- **NPC ID 39004**: Alkabor names this `a_ratman_warrior`, peq names it
  `an_elemental_monstrosity`. Per priority Alkabor wins for the shared ID; however
  the ref files use NAME as the lua target, so both files are written independently
  (`a_ratman_warrior.lua`, `an_elemental_monstrosity.lua`). Which NPC exists on the
  local server depends on the current npc_types row for id 39004.
- **NPC ID 39005**: p2002 = `an_elemental_warrior` (used), Alkabor = same,
  peq = same. No conflict — p2002 wins by priority.
- **NPC ID 39017**: Alkabor = `a_ratman_warrior`, peq = `a_broken_construct`.
  Same situation as 39004 — both name-lua files written; server DB decides.
- **NPC ID 39009**: Alkabor = `Commander_Yarik` (named boss), peq =
  `an_elemental_crusader`. Both files written (named boss + generic).

## `#`-prefixed NPC names

- `#an_old_construct` (peq 39065) and `#a_temple_researcher` (peq 39074) have a
  literal `#` prefix in the DB name. Existing hole quests already follow this
  convention (`#Ghost_of_Glohnor.pl`, `#High_Scale_Kirn_.pl`, `#Pellillo_Cogswin.pl`).
  Files written as `#an_old_construct.lua`, `#a_temple_researcher.lua`.

## Existing files unchanged

- `Caradon.pl`, `Kejar_the_Mighty.pl`, `Polzin_Mrid.pl`,
  `Protector_of_the_ruins.pl`, `#Ghost_of_Glohnor.pl`, `#High_Scale_Kirn_.pl`,
  `#Pellillo_Cogswin.pl` — no ref emotes found for these NPCIDs. Left alone.
- `Jaeil_the_Wretched.pl` — no ref emotes found for NPCID 39041. Ref file
  `39162_Irslak_the_Wretched.txt` is a distinct NPC (Irslak != Jaeil). Left alone.
- `a_spirit_of_the_ruins.lua` — no ref emotes found matching this NPC name.
  Left alone (existing `event_death_complete` preserved).

## Perl-only NPCs skipped for lua conversion

- None this pass — no ref emotes matched existing `.pl`-only NPCs, so no perl
  patching was required. Rule per task: if only `.pl` existed and a ref emote
  matched, we would have patched the perl. Not triggered here.

## Sources with no matching NPC

- All ref files produced a target `.lua`.
