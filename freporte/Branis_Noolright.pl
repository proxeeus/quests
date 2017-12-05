sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hello traveler, come and hear my tales!");
  }
}

# TODO: implement signal chain
sub EVENT_SIGNAL {
  # Signal sent from Henna Treghost saying "Sing us a melody."
  quest::say("Here's one for Sir Lucan... He's just a ruler. In a long line of rulers. Looking for a few more orcs to slay. They say that he fights them with one hand tied to his back. And he won't leave Freeport till you remember his name. Thank you.");

  # animationname ID- 58 (Dance)
  quest::doanim(58);
}

#END of FILE Zone:shortzonename  ID:10158 -- Branis_Noolright
