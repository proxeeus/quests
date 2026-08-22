# Suspected Ref Emote Pollution / Review

Lines flagged during the emote implementation pass — either semantically odd, lore-mismatch, or ambiguous unlabeled event context. Skipped in the actual edits pending review.

## freportw
- Guard_Effel, Guard_Bonlo, Guard_Jacsen, Guard_Corpillius (p2002 After Death): `"You shall never get my testimony. I shall fight you from the grave!! Ha Ha Ha!! You cannot stop the undead!! Foolish mortal!! Your foul deeds have earned my contempt."` — Sir Lucan's undead-transformation line appeared under 4 ordinary guards; skipped. Only Sir Lucan legitimately transforms (spawn 9147 handles it).

## befallen
- Priest_Amiaz (Alkabor unlabeled Say): `"You should feel honored that your soul shall finally be made useful. I will donate its energy to the hungry Marnek, so that he may soon walk the face of Antonica once again."` — Reads like a slay-player monologue, not an enter-combat rally. **Correction applied by user**: moved to `event_slay(e)` — confirms the "unlabeled Say sometimes fits Killed PC rather than Enter Combat" hypothesis. Future zones: prefer semantic fit for unlabeled Say (Enter Combat is the default only when text sounds like a battle-shout/rally; monologue-style unlabeled lines belong in event_slay).

## Orphan / duplicate quest files noticed
- freportw/Deathfist_Pawn.lua vs a_deathfist_pawn.lua — user confirmed both NPCs exist and both files load.
- befallen/36103.lua (waypoint-only) exists alongside Gynok_Moltor.lua. Likely the name-based file wins in EQEmu quest lookup; 36103.lua may be dead code. Emotes added to Gynok_Moltor.lua only.
