# Temple of Veeshan Emote Pollution / Implementation Log

Zone: **templeveeshan** (Temple of Veeshan, endgame Claws of Veeshan dragon shrine, Velious)
Source: `C:/eqemu/ref_emotes/Emotes_Alkabor/templeveeshan/` (Alkabor only)
Date: 2026-08-22

## Ref inventory (Alkabor)

60 ref files present. Every file contains a single unique emote line:

```
Emote -- Enter Combat: lets out a piercing roar as it charges!
```

All 60 NPCs are dragons, drakes, wyverns, wurms, racnars, or Claws of Veeshan lieutenants (Malteor Flamecaller, Ymmeln, Casalen, Telkorenar, Yendilor, Belijor, Arreken Skyward, Meldikor, Ajorek, Nelaarn). The roar-and-charge line is universally lore-appropriate for the entire Temple bestiary.

| NPC ID  | NPC Name                          | Combat Emote | Notes |
|---------|-----------------------------------|--------------|-------|
| 124009  | #Malteor_Flamecaller              | Yes          | Named CoV lieutenant; script CREATED this pass |
| 124019  | an_ancient_guardian_wurm          | Yes          | Already implemented |
| 124022  | an_elder_temple_defender          | Yes          | Already implemented (shared with 124276) |
| 124023  | a_fiery_temple_guardian           | Yes          | Already implemented |
| 124026  | an_ancient_tigerclaw_racnar       | Yes          | Already implemented |
| 124028  | an_elder_shard_wyvern             | Yes          | Already implemented (shared with 124112) |
| 124032  | a_burning_guardian                | Yes          | Already implemented |
| 124033  | a_shard_wyvern_hatchling          | Yes          | Already implemented |
| 124034  | #Ymmeln                           | Yes          | Already implemented |
| 124040  | #Casalen                          | Yes          | Already implemented |
| 124041  | a_crimson_claw_hatchling          | Yes          | Already implemented |
| 124044  | a_cerulean_sky_gazer              | Yes          | Already implemented (shared 124049, 124123) |
| 124045  | a_skyseeker_hatchling             | Yes          | Already implemented |
| 124046  | an_emerald_sky_defender           | Yes          | Already implemented (shared 124061, 124124) |
| 124047  | an_ancient_ice_wurm_defender      | Yes          | Already implemented |
| 124048  | a_glimmer_drake                   | Yes          | Already implemented (shared with 124062) |
| 124051  | A_Sky_Defender                    | Yes          | Already implemented |
| 124053  | an_elder_onyx_drake               | Yes          | Already implemented (shared with 124064) |
| 124054  | a_shimmering_green_drake          | Yes          | Already implemented (shared with 124065) |
| 124055  | an_ancient_sky_drake              | Yes          | Already implemented (shared with 124067) |
| 124056  | Yendilor_the_Cerulean_Wing        | Yes          | Already implemented |
| 124057  | Belijor_the_Emerald_Eye           | Yes          | Already implemented |
| 124059  | an_onyx_sky_drake                 | Yes          | Already implemented (shared 124068, 124126) |
| 124060  | a_wyvern_hatchling                | Yes          | Already implemented |
| 124063  | Arreken_Skyward                   | Yes          | Already implemented |
| 124066  | a_fiery_drake                     | Yes          | Already implemented |
| 124069  | a_greater_sky_drake               | Yes          | Already implemented |
| 124075  | a_glimmering_drake                | Yes          | Already implemented (shared 124083, 124122) |
| 124079  | A_Lava_Defender                   | Yes          | Already implemented |
| 124081  | an_ancient_guardian               | Yes          | Already implemented |
| 124082  | a_fiery_watcher                   | Yes          | Already implemented (shared 124127, 124278) |
| 124084  | a_lava_dancer                     | Yes          | Already implemented (shared with 124280) |
| 124086  | Meldikor_the_Windchaser           | Yes          | Already implemented |
| 124088  | Ajorek_the_Crimson_Fang           | Yes          | Already implemented |
| 124089  | Nelaarn_the_Ebon_Claw             | Yes          | Already implemented |
| 124095  | a_raging_wyvern                   | Yes          | Already implemented |
| 124097  | a_cerulean_guardian               | Yes          | Already implemented |
| 124098  | a_shimmer_drake                   | Yes          | Already implemented (shared with 124282) |
| 124101  | a_racnar                          | Yes          | Already implemented |
| 124104  | #Telkorenar                       | Yes          | Already implemented (.pl, EVENT_COMBAT line 62) |
| 124114  | an_elder_wyvern                   | Yes          | Already implemented |
| 124115  | an_ancient_wyvern                 | Yes          | Already implemented |

Duplicate NPC IDs (124049, 124061, 124062, 124064, 124065, 124067, 124068, 124083, 124112, 124122, 124123, 124124, 124126, 124127, 124276, 124278, 124280, 124282) all share their base name's script and are covered by the same entry above.

## Implementation status

**59 of 60 ref entries were already fully implemented** in existing quest scripts (the exact `event_combat` / `EVENT_COMBAT` "lets out a piercing roar as it charges!" line was already present).

**1 new script created** this pass:

| NPC ID  | Script file created            | Type | Reason |
|---------|--------------------------------|------|--------|
| 124009  | `#Malteor_Flamecaller.lua`     | Lua  | No prior script for this named CoV lieutenant |

No `.pl` file existed for #Malteor_Flamecaller, so creating a `.lua` file does not violate the no-shadow rule. `#Telkorenar.pl` was left untouched (the emote is already at EVENT_COMBAT / `$combat_state == 1`).

## Files touched this pass

- `#Malteor_Flamecaller.lua` (NEW)

## Pollution / lore concerns

- No pollution. The single ref line is thematically correct for every creature type in the Temple of Veeshan bestiary — ancient dragons, drakes, wyverns, wurms, racnars, and the CoV lieutenants all issue draconic combat roars.
- No lines were dropped or altered.
- No Al'Kabor-only conflicts detected (ref set was Alkabor-only by requirement).
