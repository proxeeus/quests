sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You have set foot upon the sacred grounds of the Shrine of Bertoxxulous. You had best have business here or this dirt shall become your grave.");
  }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("For Bertoxxulous, I shall spill your guts upon the floor!");
  }
}

sub EVENT_SLAY {
  quest::say("Your rotting corpse will warn others to fear the disease of the Bloodsabers.");
}
#END of FILE Zone:qcat  ID:45016 -- Argyn_Shieldstan
