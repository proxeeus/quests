# lfaydark — emote review

## Skipped as suspected ref pollution
- none

## Duplicate/orphan quest files noticed
- Ref data across all 4 dirs is heavily duplicated (same lines repeated 2-40 times per file, one file 41x). Deduped to unique lines per event per NPC.
- Many name-collision spawn IDs share content across DB snapshots: `orc_centurion` appears as 57001/57003/57004/57015/57020/57056 (peq+p2002+Alkabor+neq) — one canonical `orc_centurion.lua` covers all. Same pattern for `orc_legionnaire` (57049 p2002 + 57136 peq), `orc_oracle` (57040 peq + 57090 p2002), `orc_chief` (57041 peq + 57085 p2002), and the four `Nybright` sisters where peq IDs 57006/57007/57008/57009 duplicate p2002 57086/57087/57088/57089. Single name-based `.lua` handler per name covers every spawn ID.
- `Shayla_Nybright` is the unique "please run / I do not wish to hurt you" sister across both p2002 (57088) and peq (57007) — created her own lua with the pacifist flavor while her three sisters share the "Come, sisters!! A fool to test our blades upon!!" set.
- `Cognoggin.pl` previously had only `EVENT_AGGRO` with a race-substitution taunt (unused since Angelox-era); added `EVENT_DEATH_COMPLETE` "My comrades will avenge my death." from ref. AGGRO line preserved verbatim.
- `Dragoon_Szorn.pl` (Innoruuk Regent quest-giver, `EVENT_SAY`/`EVENT_ITEM` preserved verbatim) gained `EVENT_COMBAT` with the standard Teir`Dal Empire war cry from ref.
- `Trudo_Frugrin.pl` (telescope lens quest-giver, `EVENT_SAY` preserved verbatim) gained `EVENT_COMBAT` + `EVENT_DEATH_COMPLETE` from Alkabor's Eldritch Collective flavor.
- `tainted_brownie.pl` had only `EVENT_DEATH_COMPLETE` (spawns 57117 progression trigger — preserved verbatim); added `EVENT_COMBAT` "You not gonna escape from da taint, tall freak!" from Alkabor ref.
- `a_bandit.lua` already carried a generic 4-line racial-taunt bank + "My comrades will avenge my death." (shared bandit handler used across many zones). Merged the peq dervish-cutthroat lines into the existing ChooseRandom banks — combat line joins the racial taunts, death line joins the "avenge" line. Preserved all prior content and the `event_spawn` random-face hook.
- `Teir`Dal_Elite`, `Teir`Dal_Prophet`, `Priestess_Llandra`, `Galwyn_Geldin`, `Bryn_Fynndel`, `Faril_Elvebryn`, `Mywyn_Tinendel`, `Sarawyn_Amorfin`, `Equestrielle_the_Corrupted` had no existing handler; created new `.lua` files. The five Fier`Dal wanderers (Bryn/Faril/Mywyn/Sarawyn/Galwyn) all share the identical "How dare you!" / "My comrades will avenge my death." pair.
