# Emote / Flavor-Text Implementation

This subfolder holds documentation for the NPC emote and flavor-text
implementation pass done against the `ref_emotes` dumps
(`Emotes_p2002`, `Emotes_Alkabor`, `Emotes_peq`, `Emotes_neq`).

## Contents

| File | Purpose |
| --- | --- |
| `REPO_HEALTH_ASSESSMENT.md` | Snapshot of pre-existing quest-repo issues surfaced during the emote import: silent shadow bugs (`.lua`+`.pl` for the same NPC), numeric NPCID files pointing at wrong or missing NPCs, filename case mismatches vs. the DB, truly orphaned quest files. |
| `_emote_pollution_review.md` | Master review file listing suspected ref-data pollution flagged across zones (Sir-Lucan-undead-line assigned to ordinary guards, monologue vs. rally routing decisions, etc.). |
| `_emote_pollution_<zone>.md` | Per-zone pollution / decision log written while processing that zone. Each file documents: (a) skipped ref lines with reason (lore-mismatch, unlabeled ambiguity, cross-contamination), (b) duplicate or orphan quest-file observations, (c) notable judgment calls, (d) NPCID vs. name resolution notes. |

## How to read a per-zone pollution file

Each `_emote_pollution_<zone>.md` has (roughly) three sections:

1. **Skipped as suspected ref pollution** — lines from the reference
   dumps that were deliberately NOT applied to any quest file because
   the text doesn't semantically fit the target NPC. Example:
   Sir_Lucan_D`Lere's "you cannot stop the undead" line appeared under
   several ordinary Freeport-militia guards in the p2002 dump; only
   Sir_Lucan actually transforms into an undead spawn, so the line was
   skipped on the guards. Each skip has the NPC, the offending line in
   backticks, and the reason.
2. **Duplicate/orphan quest files noticed** — `#`- or `##`-prefixed
   files, `<NPCID>.lua` variants that coexist with a `<Name>.lua`,
   backtick-vs-dash filename variants, etc. Recorded for follow-up
   cleanup; not necessarily broken.
3. **Judgment calls / notable decisions** — anything that required
   context beyond the mechanical rules (e.g. picking one variant over
   another when multiple ref sources disagreed, or applying a template
   line to a `.pl` file rather than shadowing it with a new `.lua`).

## Rules that were applied during the import

Documented for reference so future iterations follow the same
conventions.

- **Priority (strict per NPC):** `Emotes_p2002 > Emotes_Alkabor > Emotes_peq > Emotes_neq`. The first ref dir that contains a file for a given NPC wins; lower-priority dirs are ignored for that NPC.
- **Perl precedence:** if a `.pl` file already exists for an NPC, patch it in perl syntax. Never create a sibling `.lua` — EQEmu's quest parser registers Lua before Perl (see `Server/zone/main.cpp`) and its lookup returns the first matching file (see `GetQIByNPCQuest` in `Server/zone/quest_parser_collection.cpp`), so a `.lua` sibling silently shadows every handler in the `.pl`.
- **Filename convention:** backtick in the DB `npc_types.name` maps to a dash `-` in the filename (per `Strings::FindReplace(npc_name, "\`", "-");` in `GetQIByNPCQuest`). Casing must match the DB exactly.
- **Merge, never remove:** emote lines from ref data are added as new `eq.ChooseRandom(...)` variants (case-insensitive dedupe) alongside existing content. Existing quest logic (hail dialogue, item turn-ins, spawn hooks) is preserved verbatim.
- **`$name` placeholder** → `string.format("...%s...", e.other:GetName())` in lua / `$name` (Perl auto-set) in perl. Empty gaps in ref text (e.g. `taste of this, ?!!` where the dump stripped the name) are auto-repaired when the pattern is clear.
- **Dedupe internally duplicated identical ref lines** (dump artifacts) to a single unique variant.
- **Unlabeled Say (`Say -- : <text>`):** rally/challenge text is routed to `event_combat`; long slay-monologue text is routed to `event_slay`.
- **Lore judgment:** ref lines that don't semantically fit the target NPC (undead-defiance on ordinary mortals, boss lines on trash mobs, wrong-faction/race lines) are skipped and logged.
- **NPCs must exist in the current database.** Filenames must match `npc_types.name` exactly (case-sensitive, backtick→dash). Files pointing at NPC IDs from foreign databases (PEQ/NEQ/Alkabor/P2002) are treated as orphans if the ID doesn't resolve in the current DB.

## Event mapping

| Ref event | Lua handler | Perl handler |
| --- | --- | --- |
| Enter Combat | `event_combat(e)` with `if(e.joined)` | `sub EVENT_COMBAT { if($combat_state == 1) { ... } }` |
| Leave Combat | `event_combat(e)` with `elseif not e.joined` | same sub, `elsif ($combat_state == 0)` |
| On Death | `event_death(e)` | `sub EVENT_DEATH` |
| After Death | `event_death_complete(e)` | `sub EVENT_DEATH_COMPLETE` |
| Killed PC/NPC | `event_slay(e)` (unified if identical) | `sub EVENT_SLAY` |
| Hailed | merged into `event_say(e)` with `if e.message:findi("hail")` | merged into existing `sub EVENT_SAY` |
| On Spawn | `event_spawn(e)` | `sub EVENT_SPAWN` |
