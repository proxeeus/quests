# Kithicor Emote Pollution Log

Zone: `kithicor` (Kithicor Forest)
Sources (priority): p2002 > Alkabor > peq (none) > neq

## Summary
7 NPCs from p2002 ref (all identical across neq/Alkabor). 1 additional NPC from Alkabor only.
All 8 NPCs are Teir`Dal (dark-elf brigade in Kithicor) — lore-consistent with the zone's night-time evil faction.

## Per-NPC Decisions

### 20054 #Coercer Q`ioul
- Source: p2002. Line: `Say -- Enter Combat: Kill! Kill! Kill! For Queen Cristanos!`
- Included. Lua only handles event_combat; existing .pl retained for EVENT_ITEM (epic handin).

### 20055 #Advisor C`zatl
- Source: p2002. Line: `Say -- Enter Combat: Heretic! The power of Innoruuk shall smite thee!`
- Included. Duplicate line of 20064 T`zan (both same faction). Kept per-NPC — file-level duplication only.

### 20056 a_teir`dal_assassin
- Source: Alkabor (p2002 lacks). Lines:
  - `Say -- Enter Combat: If it is death you desire, then I will be obliged to deliver it!`
  - `Say -- After Death: My brothers will avenge my death!`
  - `Say -- : Fool! You had no chance to destroy me!` (unlabeled)
- Unlabeled classification: taunting past-tense monologue about a defeated PC → **event_slay** (kill-message).
- Included. New .lua created (no prior quest file for this NPC in zone).

### 20061 #Brigadier G`tav
- Source: p2002. Line: `Say -- Enter Combat: Your head will make a fine trophy in the halls of the Indigo Brotherhood.`
- Included.

### 20062 #Ioltos V`ghera
- Source: p2002. Line: `Say -- Enter Combat: Come! Let me flay your skin!`
- Included.

### 20063 #Tasi V`ghera
- Source: p2002. Line: `Say -- Enter Combat: Come feel the unholy power of Innoruuk!`
- Included.

### 20064 #War Priestess T`zan
- Source: p2002. Line: `Say -- Enter Combat: Heretic! The power of Innoruuk shall smite thee!`
- Included. (Same line as 20055; kept — she's a priestess of Innoruuk, in-flavor.)

### 20065 #Adjutant D`kan
- Source: p2002. Line: `Say -- Enter Combat: Prepare to be gutted like a fish.`
- Alkabor variant adds `Say -- : How foolish! You were no threat to me!` (unlabeled slay-flavor).
- Priority rule strict — p2002 wins; Alkabor's extra line **skipped** per priority.
- Included (Enter Combat only).
- Note: existing `#Adjuntant_D-kan.pl` (typo filename) contains legacy random-emote combat block spanning multiple lines pulled from all 6 NPCs. Filename does not match spawn (DB uses `#Adjutant_D`kan`), so it is dead code — left untouched.

## Pollution / Skips
- None skipped for lore reasons — all 8 are the Teir`Dal invaders (undead/dark-elf night faction of Kithicor), consistent with the zone's nocturnal evil-side mobs.
- Alkabor 20065's extra unlabeled line skipped per strict priority rule (p2002 authoritative).
- All p2002 lines are identical to Alkabor/neq (verified) — no source-conflict merges required.

## Implementation Pattern
- EQEmu quest_parser_collection resolves ONE parser per NPC. Lua is registered before Perl in
  Server/zone/main.cpp:442-447, so any .lua file for a given NPC name shadows the sibling .pl
  entirely. To preserve rogue epic handin behavior, EVENT_ITEM logic was migrated into
  `event_trade` inside the new .lua file for each of the 7 epic NPCs.
- Handin translation: `plugin::check_handin(\%itemcount, 28057 => 1)` → `items.check_turn_in(e.trade, {item1 = 28057})`; `quest::spawn2` → `eq.spawn2`; `quest::unique_spawn` → `eq.unique_spawn`; `quest::signalwith` → `eq.signal`; `quest::exp` → `e.other:AddEXP`; `quest::ding` → `e.other:Ding`; `plugin::return_items` → `items.return_items(e.self, e.other, e.trade)`.
- .pl files left in place as harmless dead code (never loaded once .lua exists for same NPC).
- 20065 special case: existing `#Adjutant_D-kan.pl` had level-agnostic 500xp handin. The `#Adjuntant_D-kan.pl` typo file (unreachable — DB spawn name has no typo) had a level>=50 gated handin using unique_spawn+signal. Merged behavior into the new .lua so level>=50 gets the unique_spawn+signal path; below 50 keeps the legacy generic path.
- 20056 assassin: standalone new .lua (no prior quest file for this NPC in zone) with event_combat + event_death_complete (After Death) + event_slay.
