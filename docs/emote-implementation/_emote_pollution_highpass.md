# Highpass Hold — emote data pollution log

Ref priority applied per NPC: **p2002 > Alkabor > peq > neq**.

## Ref-set winners per NPC

| NPC ID | NPC Name | Winning ref | Notes |
|-------:|----------|-------------|-------|
| 5000 | Guard_Ranlem | p2002 | After Death only |
| 5001 | an_orc_fanatic | p2002 | Enter Combat |
| 5002 | an_orc_warrior | Alkabor | Enter Combat (fell through to Alkabor; also present in peq) |
| 5003 | Volunteer_Renlor | Alkabor | Enter Combat + After Death |
| 5004 | Volunteer_Delharn | Alkabor | Enter Combat + After Death |
| 5005 | Cytodl_Krish | p2002 | Enter Combat + After Death |
| 5007 | a_guard | Alkabor | Time to die + After Death (shared skin, see NPCID note) |
| 5008 | a_guard | Alkabor | Same skin as 5007/5122 |
| 5009 | Dalishea | Alkabor | Enter Combat + After Death |
| 5010 | Greth_Truksorn | Alkabor | Enter Combat + After Death |
| 5011 | Brenon | Alkabor | Enter Combat + After Death |
| 5012 | an_orc_medic | Alkabor | Enter Combat |
| 5013 | Captain_Ashlan | Alkabor | Existing already matches ref exactly; skipped |
| 5014 | an_orc_soldier | Alkabor | Enter Combat (`Argg!!!`) |
| 5015 | Dyllin_Starsine | p2002 | Existing already matches ref exactly; skipped |
| 5017/5018/5041/5042/5098 | a_smuggler | peq | After-Death only variant; already covered by 5019 |
| 5019 | a_smuggler | p2002 | After Death only |
| 5026 | Mutt_Rootlit | Alkabor | Enter Combat + After Death |
| 5031 | Barn_Bloodstone | Alkabor | Enter Combat + After Death |
| 5036 | Captain_Orben | Alkabor | Existing already matches ref exactly; skipped |
| 5037 | Anson_McBale | Alkabor | Enter Combat + After Death |
| 5038 | a_smuggler | Alkabor | Same skin as 5019; single row folded in |
| 5043 | Malik_Zaren | Alkabor | Enter Combat + follow-up line |
| 5049 | Jovan | Alkabor | Enter Combat + After Death |
| 5050 | Kaden_Gron | Alkabor | Enter Combat + After Death |
| 5051 | Breck_Damison | Alkabor | Enter Combat + After Death |
| 5052 | Wres_Corber | Alkabor | Enter Combat + After Death |
| 5053 | Crenn_Salbet | Alkabor | Enter Combat + After Death |
| 5055 | Beef | p2002 | Existing .pl `EVENT_SAY` already matches; skipped |
| 5056 | Bryan_McGee | Alkabor | Enter Combat + After Death |
| 5062 | Gublink_Furnhorn | Alkabor | Enter Combat + After Death |
| 5075 | a_gnoll_soothsayer | p2002 | Existing already matches; skipped |
| 5076 | a_gnoll_brawler | p2002 | Existing already matches; skipped |
| 5077/5086/5090/5115 | a_gnoll_(brawler/soothsayer) | peq | Duplicate skins; already covered |
| 5078/5083 | an_orc_medic | peq | Same as 5012; covered by that entry |
| 5079/5080 | an_orc_scout | peq | Duplicate skin of 5082; extra "Argg" flavour picked up in an_orc_scout.pl merge |
| 5081 | a_gnoll | p2002 | Existing already matches; skipped |
| 5082 | an_orc_scout | p2002 | `For the glory of Zek!  Attack!!` |
| 5084 | an_orc_berserker | Alkabor | Enter Combat (`Argg!!!`) |
| 5085 | an_orc_mercenary | Alkabor | Enter Combat (`Argg!!!`) |
| 5089 | an_orc_conscript | Alkabor | Enter Combat + After Death |
| 5105/5138/5139/5140 | a_Highpass_citizen | Alkabor | Time to die + After Death (four IDs share `a_Highpass_Citizen.lua` — see NPCID note) |
| 5107 | Cyrla_Shadowstepper | Alkabor | Enter Combat + After Death |
| 5108/5109 | an_orc_soldier | peq | Duplicate skins of 5014 |
| 5110 | a_gnoll_shaman | p2002 | Existing already matches; skipped |
| 5111 | a_gnoll | peq | Duplicate of 5081 |
| 5112 | an_orc_warrior | peq | Duplicate of 5002/5003 |
| 5113 | a_gnoll_flamepaw | p2002 | Existing already matches; skipped |
| 5114 | an_orc_conscript | peq | Duplicate of 5089 |
| 5117 | a_gnoll_flamepaw | peq | Duplicate of 5113 |
| 5119 | Guard_Stald | peq | After Death + Shout On Spawn (unique to peq) |
| 5122 | a_guard | Alkabor | Duplicate skin of 5007 |
| 5124 | a_gnoll_champion | p2002 | Existing already matches; skipped |
| 5125 | Guard_Becker | peq | After Death (unique to peq) |
| 5127 | Vopuk_Shralok | Alkabor | Enter Combat (`Argg!!!`) |
| 5130 | an_orc_acolyte | Alkabor | Enter Combat (`For the glory of Zek!`) |
| 5132 | Commander_Thafer | Alkabor | Enter Combat (`Grraahh!`) |
| 5133 | Grenix_Mucktail | Alkabor | Enter Combat (`For the glory of Zek!`) |
| 5135 | Recfek_Shralok | Alkabor | Enter Combat (`Argg!!!`) |
| 5142 | Hagnis_Shralok | Alkabor | Enter Combat (`For the glory of Zek!`) |
| 5143 | Vexven_Mucktail | Alkabor | Enter Combat (`I shall sing of your demise!`) |
| 5145 | Cordelia_Minster | Alkabor | Enter Combat (`I shall sing of your demise!`) |
| 6014/6015/6016/6017 | a_guard | peq | Guard skin duplicates; folded into `a_guard.lua` |

## NPCID cross-references (multiple IDs → one lua file)

- `a_guard.lua` handles NPCIDs **5007, 5008, 5122, 6014, 6015, 6016, 6017**. Ref content is identical across those rows; the Alkabor 5007 variant (Time to die + After Death) was used.
- `a_Highpass_Citizen.lua` handles NPCIDs **5105, 5138, 5139, 5140**. All four Alkabor refs carry the same `Time to die $name.` / `My comrades will avenge my death.` skin.
- `a_smuggler.lua` handles NPCIDs **5019, 5038** (Alkabor) plus **5017/5018/5041/5042/5098** (peq, After-Death only — same string). Only the p2002 variant + Alkabor 5038 line was needed to cover the union.
- `an_orc_medic.lua` handles NPCIDs **5012, 5078, 5083** (identical `Grraahh!` line).
- `an_orc_scout.pl` handles NPCIDs **5082, 5079, 5080** (union of `For the glory of Zek!` + `Argg!!!`).
- `an_orc_soldier.pl` handles NPCIDs **5014, 5108, 5109** (identical `Argg!!!`).
- `an_orc_warrior.pl` handles NPCIDs **5002, 5003, 5112** (Alkabor 5002 `Argg!!!`; the peq 5003 line differs but is identical to Alkabor 5002 content).
- `an_orc_conscript.lua` handles NPCIDs **5089, 5114**.
- `a_gnoll_brawler.lua` handles NPCIDs **5076, 5077, 5090**.
- `a_gnoll_soothsayer.lua` handles NPCIDs **5075, 5086, 5115**.
- `a_gnoll_flamepaw.lua` handles NPCIDs **5113, 5117**.
- `a_gnoll.lua` handles NPCIDs **5081, 5111**.

## Refs skipped for lore / staff reasons

None. Highpass ref set is entirely gameplay-consistent flavour (bandit/orc/gnoll combat and guard responses).

## Refs skipped because existing quest text already covers them

- Guard_Ranlem (5000), Cytodl_Krish (5005), Dyllin_Starsine (5015), Captain_Ashlan (5013), Captain_Orben (5036), Beef (5055), a_gnoll (5081), a_gnoll_brawler (5076), a_gnoll_champion (5124), a_gnoll_flamepaw (5113), a_gnoll_shaman (5110), a_gnoll_soothsayer (5075).

## Files with both `.lua` and `.pl`

None observed in this zone.

## Files with both `<Name>.lua` and `<NPCID>.lua`

None observed in this zone.

## Perl targets patched instead of Lua (no Lua present)

- `an_orc_berserker.pl`, `an_orc_mercenary.pl`, `an_orc_scout.pl`, `an_orc_soldier.pl`, `an_orc_warrior.pl` — existing perl retained; new Enter-Combat / Death lines added as random branches or new subs.
- `Beef.pl` — untouched (existing content matches ref).
- `Shumpi_Wimahnn.pl` — untouched (no combat ref data for this NPC in highpass ref dumps).
