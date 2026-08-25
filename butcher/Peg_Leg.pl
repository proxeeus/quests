# Shaman Epic 1.0
# Peg Leg
# Butcher Block Mountains
# Aramid September 2006

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say(quest::ChooseRandom(
      "Pardon me.  Is that my dagger in your back!",
      "How could you ever expect to defeat the swift blades of the Butcherblock Bandits?!"
    ));
  }
}

sub EVENT_DEATH {
  quest::say("You have run me through! Beware the Pirates of Gunthak.. They will avenge me.. Unngh!!");
  quest::spawn2(69149,0,0,-5386.8,783.0,12.9,331.6);
}

sub EVENT_DEATH_COMPLETE {
  quest::say("You shall soon feel the daggers of the Butcherblock Bandits upon your back!");
}


# End of File - NPCID 68201 - Peg_Leg


