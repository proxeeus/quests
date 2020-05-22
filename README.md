This is the global readme file for the project: server code, quest scripts, database work.
==========================================================================================

Note: the server codebase is a direct fork from EQEmu, but, although there are slight customizations here and there, it is 100% compatible with the main branch and is regularly merged-in.

This quest repository is focused on classic - Kunark - Velious.

Right now (May 2020), the bulk of the quest & content work is being done on Kunark. Classic zones & quests are still updated whenever needed. Velious development is in its infancy.

Prefered language
=================
Even though the bulk of the quest repository majorly uses PERL, the long-term goal of the project is to progressively phase it out in favor of LUA.
The general rule of thumb is:

- For any newly created script: use LUA
- Any existing script being edited: depending on complexity (for example, if it's a simple Hail / response), port it to LUA immediately, and further develop it with LUA.
- There are special cases of "if it ain't broken, don't fix it", namely the Boats system which relies heavily on PERL and the *quest::crosszonesignalnpcbynpctypeid(npctype_id, data)* method. Since I don't know if any LUA equivalent exists, and given the very fragile nature of the whole boat system....yeah, just leave that be.

Disclaimer
==========
This project is in no way, shape or form, a direct, 1:1 reproduction of Classic EverQuest, and probably never will be.

List of repositories for this project
=====================================

* https://github.com/proxeeus/quests/
* https://github.com/proxeeus/server/
* https://github.com/proxeeus/plugins
* https://github.com/proxeeus/lua_modules
* add a github for a database archive? what's the best way to distribute it?

Current highlights include, but are not limited to
===================================================

- A major feature of this project is the development of "Player Bots". See below for a full explanation.

- Obviously (this being the quest repo), a ton of quest work/fixes: rewards, drops, dialogues etc.

- Every single class/race/deity newbie quests (and their associated recipes) have been fixed/implemented wherever needed.

- Every single class/race/deity newbie Guild Note turn-in (and the associated dialogues / tunics) have been fixed/implemented wherever needed.

- Restored a ton of fluff/classically accurate dialogues wherever applicable. This is an ongoing process.

- Fully working boat system (mix of perl & a bit of C++ backend regarding static & empty zones). Firiona Vie's Maiden Voyage is useable and *working* (due to a small C++ 'hack')

Vanilla boat routes: Freeport -> OOT -> Butcherblock -> Freeport, Erudin (complete with the Erudin shuttles) -> Erud's Crossing -> Qeynos -> Erud's Crossing -> Erudin.

Kunark boat routes: Butcherblock -> Timorous Deep -> Firiona Vie (complete with Shuttle synchronization), Firiona Vie -> Timorous Deep (Elven Outpost with Shuttle synchronization), Overthere -> Timorous Deep (and back again), and the Barrel Barges: Oasis <> Timorous Deep island.

Velious boat routes: North Ro -> Iceclad desert island (pirate's skiff) and back again, Iceclad desert island -> Velious (Icebreaker)

- A ton of faction work, which, while not 110% classically accurate, will be better than stock database values. This is an ongoing process.

- A lot of items with newer graphics have been reverted to their classic counterparts. This is an ongoing process.

- A lot of various NPCs features (faces, textures...) that were lost due to Luclin+ models are restored to their classic counterparts, which drastically reduces the "samey" look of NPCs across the world. A small C++ backend fix has been put in place to make plugin-driven NPC feature randomization persist for clients zoning. This in turn allows generic mobs like karana bandits, dervish cutthroats, mistmoore dark elves etc to have their faces completely randomized each time one of them is spawning. This is an ongoing process.

- Classic Cazic-Thule (not the high level version)

- Classic Paw (the gnoll version)

- Pre-revamp Veeshan's Peak

- Pre-revamp Skyshrine

- Day/night cycle in Kithicor Forest. Watch out for those pesky undeads!
- Day/night cycle in East Karana - boy, those undead gnolls DO smell bad!
- Day/night cycle in Lake Rathetear - undead gnolls spawn in the camp @ South Karana's zone line. Beware!
- Generally speaking: day/night cycles enabled wherever needed. A basic spawn_events framework (7 AM - 8 PM) is in place in every zone from classic to Velious. It's then completely trivial to add NPCs to this basic cycle (only a matter of setting the Condition at 1 or 2 on their spawn point and bam, takes 5 secs at most). This is an ongoing process!

- Fixed tons of bad spawns/bad path grids/statically immobile NPCs/missing spawns etc etc. This is an ongoing process.

- Classic skeletons (brown/white), classic vendors, gypsy models/textures.

- Most classic vendors have had their stocks reflect the classic ones (armor sellers etc), instead of being empty. One or three may have slipped under the radar but for the most part this should be accurate.

- Plane of Sky class hall quests are all in and functional (including the old way of spawning quest givers, with the various tomes etc), mechanically-speaking, the zone itself has been fixed (DT-ing mobs, mobs spawning others upon death, the whole Key system, Sirran the Lunatic, all the good stuff).

- Visual Day/Night transition cycle has been restored for all the zones where it was broken due to Titanium issues (client-side + server-side fix)

Epic Quests
============

A massive effort has been made to make all epic quests completable. Some parts were tweaked, some were completely rewritten, some were expanded upon, missing dialogues have been added, missing drops as well, etc etc.

All class Epic Quests are 100% fully scripted & working:
- Paladin
- Bard
- Cleric
- Druid
- Monk
- Enchanter
- Mage
- Necromancer
- Ranger
- Rogue
- Shadowknight
- Shaman
- Warrior
- Wizard

Iksar Questlines
=================

A massive effort has been made to make all Iksar questlines (Necromancer's Skullcap, Greenmist etc) completable. Some parts were tweaked, some were completely rewritten, some were expanded upon, missing dialogues have been added, missing drops as well, etc etc.

- Necromancer's Skullcap
- Crusader's Tests
- Warrior's Pike
- Shaman's Cudgel
- Monk's Shackle

Velious major questlines
========================

- Coldain Ring quests, from #1 up to, and including the entire Ring #10 War event.

Player Bots
============

- What are those?
They're basically a set of faux-players/NPCs spawning all around Norrath in order to simulate players. They've got the blue nameplates, have their own randomized set of race/class/names/equipment etc. They're "^invitable" by real players in order to help building a bot group/raid force easily.

- How?
Player Bots are, at first, technically separate from the embedded EQEmu Bots. Behind the scenes, they're actually invisible NPCs with some customizations here and there, dynamically generated at spawn-time. These broadly include, but are not limited to:

* Blue nameplate, like players.
* They can leave corpses (non-lootable) upon death.
* They'll roam most zones freely and engage other mobs, simulating players Exp'ing.
* They can have guild tags for extra authenticity
* They'll "buy" all sorts of items that were in demand back in the day (Deathfist belts, bone chips, animal pelts etc)
* Some classes (ie: enchanters) will be able to assist players with specific tasks like item enchantment (platinum bars etc)

Upon meeting a Player Bot, a real player might want to recruit him in his personal bot army. A new ^invite command has been implemented. This command will clone all the NPC's features (appearance, class, race and equipment) and auto-generate a true Bot (in the EQEmu sense of the word) with all said features. The real Bot will be spawned at the player's location, and the Player Bot NPC will depop.

Besides some C++ backend implementation (all tagged with [player bot] in their respective commit messages), a rather huge and messy LUA script ties the system together.
This is the engine that generates a Player Bot upon spawning: name, race, class, spellsets if applicable, and equipment based on level.

Gallery
=======

Here are various screenshots showcasing the Player Bot system in action. None of those are real players ! They're computer-controlled. Guild names are based on true guilds I've encountered on EQLive and on EQEmu servers.

*A couple of brave adventurers patiently looking for a group at the entrance of City of Mist*

![A couple of Player Bot adventurers looking for a group in City of Mist](/docs/img/playerbot2.png)

*Buffing session in East Commonlands tunnel. Price-check on Deathfist Slashed belts?*

![Buffing session in East Commonlands tunnel. Price-check on Deathfist Slashed belts?](/docs/img/playerbot1.png)

Todo list
=========

- Velious
- Tradeskills
- Further customizations to the Bots (PlayerBot system still in the design stages)
