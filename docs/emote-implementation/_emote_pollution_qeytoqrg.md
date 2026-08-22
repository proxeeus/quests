# Emote pollution log — qeytoqrg

Zone: Qeynos Hills (Qeynos-to-Surefall-Glade wilderness).
Reference: `C:/eqemu/ref_emotes/Emotes_Alkabor/qeytoqrg/*.txt` (Alkabor only).

This log records handlers/lines that exist in `C:/eqemu/quests/qeytoqrg/` that are NOT present in the Alkabor reference dumps. Lines were left in place (no removal) — this file is informational so a future pass can decide whether to prune, keep as modern additions, or split into optional custom content.

## Cross-mob line contamination (gnoll types)

The current scripts mix the pup line with the watcher line via `eq.ChooseRandom` — Alkabor keeps each mob to its own single line.

- `a_gnoll.lua` — Alkabor ref (4006): only `Say -- Enter Combat: You have trespassed long enough on Sabertooth land!` (watcher line). Current script also randomly emits the pup line `YAP! YAP! YAP! ...`.
- `a_gnoll_pup.lua` — Alkabor ref (4079): only `YAP! YAP! YAP! In the way of my father, I claim your blood for the glory of Blackburrow!! WOOOOOOOF!!`. Current script also emits the watcher trespass line.
- `a_gnoll_scout.lua` — Alkabor ref (4147): only the watcher trespass line. Current script also emits the pup YAP line.
- `a_gnoll_watcher.lua` — matches ref (only trespass line). No pollution.

## Modern additions (present in current script, absent in Alkabor ref)

- `Rephas.lua` — `event_say` handlers for `hail` (`Aagggh.. Get away from here..`) and `karana` (`Ignorant one!..`). Alkabor ref has only Enter Combat.
- `Pyzjn.lua` — `event_say` "Is that your BREATH.. did something die in here.." and "I didn't know Slime could speak common..". Alkabor ref has only Enter Combat.
- `Niclaus_Ressinn.lua` — waypoint 7/10 says (`Guard! Come quick! The undead gather near the ruins of Geupal!` / `Shh.. The fiends seems to dwell amongst the ruins...`) — modern scripted patrol dialogue not in Alkabor ref.
- `Guard_Chrighton.lua` — `donate` say handler with Temple of Thunder line (not in Alkabor ref which has only combat+after_death).
- `Guard_Cheslin.lua` — extensive Illusion-card quest content, all waypoint says (`Hail, fellow guards!`, `Fear not, simple travelers.`, drop-card monologues) and full `event_trade` handler. Alkabor ref has ONLY: Enter Combat (`Never fear!! Guard Cheslin is here!! Die, foul beast!`), After Death (`The Qeynos Guards shall avenge me...`), and unlabeled slay (`Another victory for the Qeynos Guards and the mighty Cheslin, master swordsman!!`).
- `Neclo_Rheslar.lua` — full `event_trade` handler (Note to Neclo → Minor Shielding spell). Alkabor ref only has combat line — quest content is legitimate modern gameplay, listed for completeness.
- `Konem_Matse.lua` — `event_trade` (Message to Konem) and waypoint anims. Ref only has combat/after_death.
- `Baobob_Miller.lua`, `Chanda_Miller.lua` — extensive tanner quest dialogue + trade. Ref only has combat + after_death (Baobob) or combat (Chanda). Quest content legitimate; noted for completeness.
- `Holly_Windstalker.lua` — `event_say` hail response. Ref only has combat + after_death.
- `Sarri_Modav.pl`, `Ubzial_Iyeaql.pl`, `Axe_Broadsmith.pl` (trade sections) — full quest content not in Alkabor ref; kept intact.
- `Crumpy_Irontoe.lua` — hail line has typo `yo` (should be `you`) vs ref `Bug off! Unless you want an Irontoe boot to caress your head?!`. Cosmetic only.

## Text divergence (kept — modern reword)

- `Guard_*` "Time to die %s!" vs Alkabor `Time to die $name.` — modern uses exclamation; both scripts newly added (Westyn/Yalroen/Sironan/Beris/Nash/Philbin/Bixby/Leopold/Monroe/Chrighton) use period per Alkabor. Existing pre-existing guards use `!` — not normalized to avoid unrelated cleanup.
- `Hadden.pl` combat/after_death — matches ref (already present, single-space punctuation slight difference kept).

## Notes

- No lua files were created where a `.pl` already existed (rule enforced): `Axe_Broadsmith.pl`, `Gnasher_Furgutt.pl`, `Hadden.pl` were patched in-place with the missing Alkabor events.
- `#Apprentice_of_Saxuus` uses the leading-hash filename (shared-script prefix) — matches ref NPC name.
- Alkabor ref for `Guard_Cheslin` includes an unlabeled monologue treated as `event_slay` per standard mapping.
