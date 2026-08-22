# Emote pollution log — mistmoore

Zone: **mistmoore** (Castle Mistmoore)
Ref sources scanned: `p2002`, `Alkabor`, `peq`, `neq`
Priority used per NPC: `p2002 > Alkabor > peq > neq`
Generated: 2026-08-21

## Summary of the ref data

The mistmoore ref dumps are dominated by a single generic combat rally line:

> `Say -- Enter Combat: Do not underestimate the might of Mistmoore!`

Roughly 60 of the ~70 distinct NPC IDs in every source only ever emit this one line
(repeated 8-63 times per file, all identical). After dedupe this collapses to a single
combat line per NPC and provides no per-NPC flavor. It looks like a shared say-bank
that Verant wired to almost every hostile mob in the zone rather than authored
per-NPC dialogue.

The **only NPCs with truly distinctive/authored content** across all four ref sources
after dedupe are:

| NPC ID | NPC Name | Source | Lines |
|--------|----------|--------|-------|
| 59017 | a_Mistmoore_guard | p2002 | Enter Combat: `Submit before the sovereign might of Mayong Mistmoore!` |
| 59020 | an_avenging_caitiff | Alkabor | Enter Combat: `I must free your soul, $name!` |
| 59055 | an_advisor | p2002 | After Death vengeance monologue + Hailed insult monologue |
| 59015 / 59016 / 59145 | a_gypsy_musician | p2002 / peq | Enter Combat: `Help me!  Let me out!  Don't leave me here!` + After Death: `My comrades will avenge my death.` |
| 59084 / 59144 | a_gypsy_dancer | p2002 / peq | same "gypsy captive" pair |
| 59008 / 59092 | a_gypsy_ambassador | p2002 / peq | same "gypsy captive" pair |
| 59150 | Mynthi_Davissi | peq | same "gypsy captive" pair (kidnapped gypsy NPC) |

Every other NPC file in every source resolves to the same single line above.

## Cross-source mismatches (name/id disagreements)

Same NPCID with different names across sources — resolved via the p2002 > Alkabor > peq > neq priority:

- **59060** — p2002: `a_soul_inveigling` ; peq: `an_initiate_familiar` → used p2002 (`a_soul_inveigling`).
- **59088** — p2002: `an_ancille_cook` ; peq: `a_dark_offerer` → used p2002 (`an_ancille_cook`).
- **59177** — p2002: `a_pledge_familiar` ; Alkabor: `a_glyphed_sentry` → used p2002 (`a_pledge_familiar`).

Content is identical in each mismatched case (all "Do not underestimate..."), so no functional difference —
noted only for provenance.

## Pollution / skipped

- **"Do not underestimate the might of Mistmoore!"** is not skipped — it is the ONLY line most NPCs
  have and it is lore-consistent for a castle full of Mistmoore vampires/loyalists. Kept.
- No lines from any ref file were skipped for lore reasons. Mistmoore is a vampire lord's castle;
  undead speaking is expected. Every ref line is thematically consistent.

## Existing handler state

Most quest files in `C:/eqemu/quests/mistmoore/` already implement the generic
combat line. This pass:

- **Patched** `a_Mistmoore_Guard.lua` — added the authored `Submit before the sovereign might of Mayong Mistmoore!` line alongside the existing generic one (random pick).
- **Patched** `an_advisor.lua` — added `event_death_complete` (vengeance monologue) and `event_say`/hail handler.
- **Patched** `an_avenging_caitiff.pl` (Perl) — added `EVENT_COMBAT` with `I must free your soul, $name!` (existing quest EVENT_SAY preserved).
- **Created** `.lua` files for every remaining NPC name that appeared in ref but had no handler.
  Each new file just implements the generic combat line — that is genuinely all the ref has
  for these NPCs.

## Notes for future authors

- Do NOT add ambient timers or random-cast flavor to Mistmoore hostiles beyond what
  ref shows. The ref is dominated by one combat line by design; adding invented flavor
  would exceed the source-of-truth.
- The four gypsy-related NPCs (musician / dancer / ambassador + `Mynthi_Davissi`) are the
  only "captured prisoner" flavor in the zone; treat their lines as gypsy-caravan-captive
  dialogue (they are victims, not defenders).
- `an_advisor` (59055) is the only NPC with a Hailed monologue — worth preserving as-is.
