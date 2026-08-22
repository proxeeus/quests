# eastkarana — emote review

## Skipped as suspected ref pollution
- none

## Notes / judgment calls
- `a_farmer`: p2002 ref has only `After Death: "My comrades will avenge my death."`. Odd for a farmer (no obvious "comrades"), but East Karana farmers are on the guard/Karana-resident faction and share the generic guard-death barks in Verant's data, so included as-is.
- `a_druid`: p2002 ref adds `Enter Combat: "Natural selection at work."`. Existing script uses race-plural randomised barks; appended the new line into the same `ChooseRandom` list. `After Death` line already matched existing handler.
- `Sir_Morgan`: existing script only wired `[wish an escort]` / `[travel alone]` responses; added the missing top-level hail intro from the ref (which contains those two saylinks) so the conversation now bootstraps.
- `Tholris`: existing `.pl` handled `EVENT_SAY` with a `signalwith` but no visible response. Ref adds `Emote -- Hailed`; inserted alongside the existing signal.
- `Broon` / `Droon` / `Proon`: existing scripts only carried spawn plumbing (SetRunning / spawn2 gating). Combat + death barks added while preserving the enable_spawn2 chain in `Broon.event_death_complete`.
- Alkabor-only guards `Tallus_Holton`, `Guard_Philip`, `Guard_Angus`, `Guard_Gonlo` already had "Time to die %s!" enter-combat handlers matching (or effectively matching) the ref; only their `After Death` line was appended.

## Duplicate/orphan quest files noticed
- `#Guard_Elias.lua` — leading `#` disables the file (not loaded). Original file unmodified.
- `#Sir_Gregon_Sulltor.lua` — leading `#` disables the file (not loaded). Original file unmodified.
