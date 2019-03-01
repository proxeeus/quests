

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hmm, I have been watching you. You made it further than I thought you would. I will have to work on my defenses in the future. So, what do you seek of me?");
  }
  if ($text=~/jaled dar/i) {
    quest::say("Jaled Dar is quite dead, you know. But he was tasty, I feasted on his remains long ago. I do wish his spirit would go away, his incessant wailing disturbs me, and worse, it makes other dragons wary of this place. I have not eaten as well as I would have liked since his shade came to stay. If you wish to speak with him yourself, I can arrange that, for I hold a key that will unlock his tomb.");
  }
  if ($text=~/key/i) {
	quest::say("'This IS my realm, after all. Nothing is barred to me. But I did not become who I am by doing something for nothing. If you wish to talk to Jaled Dar, you will have to do something for me first. Are you willing to do this task?");
  }
  if ($text=~/i am willing/i) {
	quest::say("There is an annoying uprising taking place among the Chetari and Paebala. This is affecting my diet. I get cranky when I don't eat right. I am VERY cranky right now. The rebellion is led by a Paebala named Neb. He has taken his followers into a part of the Necropolis that I have difficulty reaching, and he has somehow tamed the goo there as well, preventing my Chetari followers from assaulting them directly. If Neb were to fall, I am certain the rebellion would quickly falter. Bring me Neb's head, and I will give you the key to Jaled Dar's tomb.");
  }
}

sub EVENT_ITEM {
  if($faction==1 && plugin::check_handin(\%itemcount,26010=>1)) {
    quest::say("Excellent work! Here is your key, go bother that prattling fool Jaled Dar, and leave me be.");
    quest::summonitem(28060);
    quest::faction(32, 50);
    quest::faction(365, 500);
    quest::faction(42, -50);
    quest::faction(273, -50);
    quest::exp(250000);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:necropolis  ID:123115 -- Zlandicar
