# trakanon — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- Only one Alkabor ref file existed for this zone: `95106_Crusader_Vragor.txt` — a single "On Despawn" emote ("vanishes into a mist, his sigh of relief the only thing left behind.").
- The despawn emote is already implemented verbatim in the existing `Crusader_Vragor.pl` at the end of `EVENT_ITEM` (fires just before `depop_withtimer()` when the crusader tome + coffin turn-in completes). No new file created, no modification needed — Perl handler is authoritative and would shadow any new `.lua`.
- All other trakanon NPC quests (Trakanasaurus_Rex, Ffroaak, Emperor_Ganak, various dreadlords/champions/keepers, froglok wildlife, etc.) have no Alkabor emote refs and were left untouched.
