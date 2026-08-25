# crushbone — emote review

## Skipped as suspected ref pollution
- an_elven_slave (58049, 58052, 58053, 58054) [Alkabor]: `"Time to die $name."` (Enter Combat) / `"My comrades will avenge my death."` (After Death) — reason: Crushbone elven/dwarven slaves are shackled captives (see `an_elven_slave.lua` `event_trade` — quest revolves around freeing them with keys). Aggressive combat taunts and "my comrades" references are lore-inconsistent with a chained prisoner. Likely wrong-NPC pollution on the Alkabor server (possibly copy-pasted from an orc slaver template).
- a_dwarven_slave (58050, 58056) [Alkabor]: same lines as above — same reason.

## Duplicate/orphan quest files noticed
- `58007.pl` (male high elf slave) — duplicates behavior of `an_elven_slave.lua` (name-based handles all elven-slave races/genders via `GetRace`/`GetGender` branches). Numeric .pl is a legacy stub kept for the specific NPCID.
- `58014.pl` (female high elf slave) — duplicates `an_elven_slave.lua`.
- `58020.pl` / `58021.pl` (male wood elf slave) — duplicates `an_elven_slave.lua`.
- `58022.pl` (female wood elf slave, same as 58049.pl) — duplicates `an_elven_slave.lua`; also a same-race duplicate of 58049.pl.
- `58023.pl` (female dwarven slave) — duplicates `a_dwarven_slave.lua`.
- `58044.pl` (male dwarven slave) — duplicates `a_dwarven_slave.lua`.
- `58048.pl` (male wood elf slave) — duplicates `an_elven_slave.lua`.
- `58049.pl` (female wood elf slave) — duplicates `an_elven_slave.lua`.
- `58050.pl` (male dwarven slave) — duplicates `a_dwarven_slave.lua`.
- `58051.pl` (male dwarven slave, same as 58050.pl) — duplicates `a_dwarven_slave.lua`.
- `58060` (`#Orc_Messenger` in peq ref) — leading `#` indicates a spawner/controller entity, not a real dialogue NPC. Skipped.

## Notes
- All p2002 refs (highest priority) contain only two sentences per NPC ("Centurions!! Legionnaires!! Come join the fight!" on Enter Combat and "You shall have all the Crushbone orc legions on your tail for my death!" on After Death / On Death). Every existing quest file for these NPCs already fires equivalent lines (some via `event_combat` join branch, some via `EVENT_ATTACK`, all via `event_death_complete` / `EVENT_DEATH`). No additions were required.
- peq unique NPCs (58000, 58003-58006, 58008, 58011-58016, 58024-58027, 58033-58039, 58045, 58055, 58057) all share the same two generic orc-cohort lines. Their in-zone handlers are the name-based `.lua` files (`orc_centurion.lua`, `orc_slaver.lua`, `orc_legionnaire.pl`, `orc_oracle.pl`, `orc_emissary.lua`, `orc_trainer.lua`) which already emit those lines. No additions were required.
- `Rondo_Dunfire.pl` already carries both peq lines ("Pardon me. Is that my dagger in your back!!" attack, "You shall soon feel the daggers of the Butcherblock Bandits upon your back!!" death) verbatim.
