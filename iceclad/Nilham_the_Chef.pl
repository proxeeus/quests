sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Ahoy, $name. Welcome ta the brig. I didn't get ta the 'B' section of my piratisms manual so I'm not sure what a brig is but I'm guessin' it means 'really small place without enough food or water.' So, ya here ta stay or just visitin'?");
  }
  elsif($text=~/cat/i) {
    quest::say("That was a nasty cat. I dun think it was after us, though. I think it just smelled the fresh chunk of wooly rhino jerky I had. It didn't do anythin' but knock us over. I guess that's what it likes, walrus. After it knocked us over it slipped away towards the bridge island like a ghostly mist. I'm thinkin' I saw a glimmer in its maw while it was runnin' off.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18962 => 1)) {
    quest::emote("looks at you with a gleam in his eye.");
    quest::say("Wow. Ya actually got one. Thanks, mate! Here, you can have my cuffs. I'm tired of 'em and they're startin' ta chafe.");
    quest::say("B - Bilgewater. Barnacle brained blunderhead. Blast yer ballast...");
    quest::emote("happily reads through the book.");
    quest::summonitem(30041);
     quest::ding(); quest::exp(10000);
  }
  else {
    quest::say("Yar, what am I ta do with these, $name? Take 'em back and leave me be."); #made up text for incorrect hand in
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone: iceclad ID:110065 -- Nilham_the_Chef

