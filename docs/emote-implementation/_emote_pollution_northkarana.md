# northkarana — emote review

## Skipped as suspected ref pollution
- none — all lines fit generic Karana-plains "guard/druid/farmer/patrol" contexts

## Duplicate/orphan quest files noticed
- a_farmer.lua already ships full combat + death handlers driven by races_plural; the peq/p2002 farmer refs (13015/13017/13027/13028/13077/13080) only add duplicate "My comrades will avenge my death" already covered — no patch needed
- a_druid.lua created as shared handler for 6 NPC IDs (13048, 13050, 13051, 13087, 13103, 13269) all sharing identical p2002/peq refs
- Sir_Gerwin_Thunderblade filename in ref uses "#" prefix (peq); created plain-name lua to match EQEmu bot/entity conventions
- Guard_* files (Stanard, Bartley, Fredrick, Oystin, Westyn) only had combat handler; added event_death_complete
- Guard_Shilster.lua (quest NPC — Blackburrow Stout smuggler) lacked both combat and death; added both from p2002 ref
- Cordelia_Minster.lua (bard quest NPC) had no combat; added "I will sing of your demise." from p2002 ref
- Ezmirella and Watchman_Dexlin combat/death added inside existing quest scripts; Alkabor refs preserved verbatim
- Brother_Nallin.lua created with event_slay handler for unlabeled "A pity... Such a waste of a life." monologue (Rodcet Nife priest — thematic fit)
