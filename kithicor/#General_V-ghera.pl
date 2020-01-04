# name: General V`Ghera
# level: 65
# class: Shadowknight
# race: Dark Elf
# gender: Male
#
#
#
#
# Turn in Stanos' head for the Guise of the Coercer


sub EVENT_SAY {
  if ($text=~/Stanos/i) {
    quest::say("Stanos? Stanos!! That dog, I WILL see him dead for what he cost me. Outcast I am, stripped of my position, my god has forsaken me, blaming ME for the loss of some tome. And you, $name, you have aided him. For that, you will die first. Please, struggle and beg, I do so enjoy watching my victims squirm, and I have little joy left in my life now. If you want my favor, perhaps if you came bearing Stanos' head I would be more forgiving. But I doubt it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28058 => 1)) {
    quest::say("Life is indeed sweet! Thank you, $name, you have done me a great service this day. Take this, Stanos was kind enough to return it to me, and I have no use for it now. Know that you have the blessing of Innoruuk for this deed! But of course, I leave it to you to leave here alive. A leader has to feed his minions, you know.");
    quest::summonitem(2475);
    quest::exp(500000);
    quest::ding();
    quest::faction(420,20);
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}


sub EVENT_DEATH {
  quest::shout("You think you have won, do you? INNORUUK, MY LORD AND MASTER, I INVOKE YOUR WRATH UPON THIS WRETCHED FOREST! Hahahahahahahahahahahahaha!");
}

#END of FILE Zone: kithicor  ID:20252 -- #General_V`ghera

