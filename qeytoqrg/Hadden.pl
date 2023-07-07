# Hadden
# by Proxeeus

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Ah.. Though you appear so puny, I'm sure your flesh will make good bait!");
  }
}

sub EVENT_DEATH_COMPLETE{
	quest::say("Arrrhhh.. The Merchants of Qeynos.. are many.. and powerful.. .. you won't get away.. with.. this.. hor.. orr.. rible.. .. ..");
}