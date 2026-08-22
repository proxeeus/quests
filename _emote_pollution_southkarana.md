# southkarana - emote review

## Skipped as suspected ref pollution
- none

## Notes / judgment calls
- `a_putrid_skeleton.lua`: shared handler for multiple putrid-skeleton NPCIDs. Ref 14007 has an NPC-specific "Cromil shall cut you in two." combat bark; skipped to avoid mis-attributing Cromil's name to other skeletons that share this script. Added ref 14093's generic "Die, like the fool you are!" to the existing ChooseRandom combat pool, and added the shared slay bark "The Lord of Disease welcomes you!". Death line "Bertoxxuloussss..." already matched.
- `Brother_Qwinn` (id 436): patched active `436.pl` (Perl) per the critical rule — never create a new `.lua` when an active `.pl` exists. The `#Brother_Qwinn.lua` sibling stays hash-disabled and untouched.
- `Vhalen_Nostrolo.lua`: added ref combat line; existing script had only say/trade handlers. No death line in ref.
- `a_hermit.lua`: existing had death_complete matching ref; added combat + slay from ref.
- `Ghanex_Drah.lua`: existing had death_complete matching ref; added combat + slay from ref.
- `Lord_Grimrot.lua`: existing tagged `ID:3312` (legacy) but is the same NPC as Alkabor ref 14143 by name. Existing combat + death already matched ref exactly; only added the slay line. Left the file's unrelated pre-existing Perl-syntax bugs in `event_trade` (missing `then`, orphan `elseif`) untouched — not in scope.
- `Ryleen_Bladespur.lua`: created new (no prior file). Emote-style combat + death barks from ref.
- `Narra_Tanith.lua`: created new (no prior file). Ref uses `$name` token in combat bark; converted to `e.other:GetCleanName()` via `string.format`.
- `a_Tesch_Mas_Gnoll.lua`: existing already carries the full ref set (combat emote, comrades death, TomEar slay) — no change needed.
- `an_escaped_Splitpaw_gnoll.lua` / `#Sentry_Alechin.lua`: already matched ref (combat only) — no change needed. Sentry is hash-disabled (see below).
- `Brother_Drash.pl` (id 14048): active Perl already carries the full ref set (hail say, combat, death). No change.

## Duplicate/orphan quest files noticed
- `#Sentry_Alechin.lua` - leading `#` disables the file (not loaded). No active peer exists, so this NPC currently has no live emote handler on either Alkabor or PEQ. Not touched per established convention (see `_emote_pollution_eastkarana.md`); ref-derived combat bark ("You have trespassed long enough on Sabertooth land!") is present in the disabled file but will not fire until an operator un-hashes it.
- `#Shaman_Ren-Rex.lua` - leading `#` disables the file. No active peer. Disabled content already matches ref (combat + death). Not touched. Ref also includes a `Shout -- : BAHAHA! ...` line (post-kill boast); would go in `event_slay` if the file is ever re-enabled.
- `#Shaman_Lenrel.lua` - leading `#` disables the file. Same disposition as Ren-Rex (identical ref content, same shout line unmounted).
- `#Brother_Qwinn.lua` - leading `#` disables the file. Active handler is `436.pl` (patched above); disabled Lua is a stale conversion draft and stays untouched.
- `#Brother_Hayle.lua`, `#Theodore_Exanthem.lua`, `#Triathalon_Running_Shoes.lua`, `#Quillmane.pl`, `#a_lioness.lua`, `#an_elephant_calf.lua` - hash-disabled with no matching ref file in Alkabor's southkarana dump; unchanged.
- `Lord_Grimrot.lua` `event_trade`: pre-existing Perl-legacy syntax bugs (missing `then`, orphan `elseif` after `end`) noted but not fixed — out of scope for emote work.
