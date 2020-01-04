# Tholris
#

sub EVENT_SIGNAL {
  if ($signal == 99) {
    quest::emote("breathes quickly and sweats as he channels his spirit into the sky.");
  }
}

sub EVENT_SAY
{
  if ($text=~/hail/i)
  {
    quest::signalwith(15044,20,1);
  }
}

# EOF zone: eastkarana ID: 15043 NPC: Tholris

