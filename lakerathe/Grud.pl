sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Gimme duffynitey rocks! Me crushem GUUD!!!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10073 => 1)) { #Dufrenite
    quest::emote("takes the dufrenite and crushes it with his bare hands.");
    quest::say("CRUSH! CRUSH! CRUSH!");
    quest::summonitem(19050); #Crushed Dufrenite
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_COMBAT {
  if($combat_state == 1) {
    quest::say("Guards!  Come smash!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}
#END of FILE Zone:lakerathe  ID:51073 -- Grud