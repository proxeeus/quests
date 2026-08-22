# cobaltscar — emote review

## Skipped as suspected ref pollution
- a_siren_seductress (p2002 117022): `"The might of the oceans is at my command, and with it I shall end your existence, strange one!!"` — Othmir combat line contaminating a siren NPC dump; peq dumps for the same NPC name across multiple IDs show sirens only emit the enchanting-song emote. Skipped Say line, kept the siren-appropriate Emote (via peq/Alkabor cross-reference judgment).
- a_siren_seductress (p2002 117022): `"Welcome strange one! I am on watch duty so I'm afraid I have not the time to converse. Perhaps when my shift is over we can exchange words over a bowl of spicy clam chowder."` — same pollution; clam-chowder/watch-duty is an Othmir warrior line, not a mermaid/siren line.

## Duplicate/orphan quest files noticed
- Bungre_Crawcrusher.pl — file header comment says "Quest for Lodizal Shell Shield" and hail lore is Othmir warrior-trainer flavor (training pups, wyverns, Kelorek'Dar), which does not match Bungre's role as head craftsman elsewhere in the zone. Left as-is; only added EVENT_COMBAT per ref.
- 6709.pl — orphan file (npc-id filename) implementing Chief_Kalan handin logic (Ulthork Tusks). Note: Chief_Kalan.pl also exists as a separate quest file. No ref-emote data for either ID, no changes made.
