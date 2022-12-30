sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail! Beware the giants of the woods. They have a dwelling somewhere out there. Should you stumble upon it, run! Leave the fighting to us.");
  }
  if ($text=~/sign the restraining order/i) {
    quest::say("I've been ratted out! Very well. I shall sign the order, but first I shall force you to fetch me a set of goblin scout beads. I hear they make fine counters. Bring me the beads and that despicable order and I shall do as instructed.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18247 => 1, 12672 => 1)) { #Legion Order (7 signed), Goblin Scout Beads
    quest::summonitem(18248); #Legion Order (8 signed)
    quest::exp(500);
  }
  elsif (plugin::check_handin(\%itemcount, 18247 => 1)) {
    quest::say("No, NO! I want the goblin scout beads and the legion order.");
    quest::summonitem(18247);
  }
  elsif (plugin::check_handin(\%itemcount, 12672 => 1)) {
    quest::say("No, NO! I want the goblin scout beads and the legion order.");
    quest::summonitem(12672);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE {
  quest::say("You have not won.  Consider yourself wanted by the Legion of Cabilis.");
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Fear the blades of the Iksar!!");
  }
}

sub EVENT_SLAY {
  quest::say("Another victory for the Legion of Cabilis.");
}
#END of FILE Zone:warslikswood  ID:79090 -- Trooper_Roklon