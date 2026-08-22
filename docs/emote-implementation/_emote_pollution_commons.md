# commons — emote review

## Skipped as suspected ref pollution
- Mojax_Hikspin (21050, peq): `"You shall bleed!! All hail the Deathfist!!"` / `"Aaarrghh!! The Deathfist shall hunt you down. My death will not go unnoticed."` — Mojax is a peaceful gnome messenger for Antonius Bayle (per existing Mojax_Hikspin.pl); orc Deathfist lines are wrong-NPC pollution (likely an NPCID collision in the peq dump).

## Duplicate/orphan quest files noticed
- orc_centurion.lua + an_orc_centurion.lua — both variants exist; each fed by its own ref (orc_centurion from p2002 21097, an_orc_centurion from Alkabor 21102). Kept both.
- orc_legionnaire.lua + an_orc_legionnaire.lua — analogous split; kept both.
- Skipynn_Stoneheart p2002 ref had 6 identical "My comrades will avenge my death." lines (After Death); deduped to a single Say.
- orc_pawn 21005 p2002 ref had 96 identical duplicate pairs; already-covered by existing orc_pawn.lua, no edit needed.
- orc_weaponsmith 21155 (peq): ref emotes are stock Deathfist centurion combat/death lines. Included as default; may be slightly off-flavor for a crafter NPC but plausibly reasonable defense behavior for a Deathfist clan member.
