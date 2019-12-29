# Test of Illusion - enchanter epic - Snow Blossoms
# 


sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("heaves a great sigh.");
  }
  if ($text=~/wrong/i) {
    quest::say("Boz like to grow perty flowers in her garden. But garden no more.");
  }
  if ($text=~/garden/i) {
    quest::say("Boz not know what happen. Only see der biggins footprints in it. Me perty sure my puppy not smash garden. He has tiny feets. Right, puppy?");
    quest::emote("'s pet wags his tail."); 
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10628 => 1)) { #Large Muddy Sandals
    quest::emote("writes something down on a piece of parchment.");
    quest::say("You go tell dat Brokk dat he owe me big for smushing garden. Make him read dis.");
    quest::summonitem(10629); #Scribbled Parchment
  }
  elsif (plugin::check_handin(\%itemcount, 10630 => 1)) { # Gift to Bozlum
    quest::say("Oh, dat silly Brokk. He sent me too many of these perty flowers. Me not know where put them all. Here, you take some cause you help Bozlum. Me like you. Flowers make you smell perty, too.");
     quest::ding(); 
     quest::exp(5100);
    quest::summonitem(10609); # Snow Blossoms
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF Zone: oggok ID: 49023 NPC: Bozlum_Blossom

