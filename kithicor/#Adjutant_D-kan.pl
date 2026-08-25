# Rogue Epic NPC -- #Adjutant_D'kan

sub EVENT_SAY {
  quest::emote("ignores you.");
}

sub EVENT_ITEM {

  if(plugin::check_handin(\%itemcount, 28057 => 1)) {

    quest::say("The General will take care of you!");

    quest::ding();

    quest::exp(500);

    quest::spawn2(20252,0,0,2316,797,275,387);
 }

  plugin::return_items(\%itemcount);

}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Prepare to be gutted like a fish.");
  }
}

#END of FILE  Quest by: Solid11  Zone:kithicor  ID:20065 -- #Adjutant_D'kan



