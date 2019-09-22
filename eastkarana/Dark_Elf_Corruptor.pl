# dark elf corruptor shouts before attacking
#

sub EVENT_SPAWN {
  quest::settimer("despawn",300);
  quest::shout("We come for you, fools. Your reign of weakness over the powers of the land comes to an end now!");
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer("despawn");
}

# EOF zone: eastkarana ID: 15153 NPC: Dark_Elf_Corruptor

