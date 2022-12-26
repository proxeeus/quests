#Friend of the Kin

sub EVENT_SAY { 

if($text=~/Hail/i){
  quest::say("Ah outsiders, I have heard word of your travel here. Perhaps you #wish to become a friend of the kin?");
}

if($text=~/i wish to become a friend of the kin/i){

quest::say("Good. then you would not mind assisting us with a matter of grave importance. We have received news of an alarming sort. There walks amongst us a spy of the storm giants, who feeds our every move to them and their accursed strategist. For the life of us, we cannot deduce whom the traitor is, however we have received word from Wenglawks of Kael, an associate of ours, that he has information concerning this. For a measly sum of 100 platinum, he has offered to give us the information to rid ourselves of this traitor. If you are indeed friend to the kin, take this note to Wenglawks and rid us of this traitor.");

quest::summonitem("29068"); }

}




sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 29064 => 1)) {

    quest::say("You've returned, and with the shipment of ore intact! It was wise to send you out on that mission, $name, and I'm glad you did not fail. If you're looking for more assignments to do, I may have something that is just right for you. If you're interested in it, just let me know and we'll talk.");

    quest::summonitem(1727);

     quest::ding(); quest::exp(12500);

    quest::givecash(0,0,10,10);

    quest::faction(436,10); #Yelinak

    quest::faction(430,10); #CoV

    quest::faction(448,-30); #Kromzek

    quest::setglobal("friendofthekin",1,0,"D30");

  }

  elsif (plugin::check_handin(\%itemcount, 29065 => 1) && ($friendofthekin == 1)) {

    quest::say("You have shown us yet again your loyalty to our people. Please accept this token of our gratitude.");

    quest::summonitem(29050);

     quest::ding(); quest::exp(32500);

    quest::givecash(0,0,10,10);

    quest::faction(436,10); #Yelinak

    quest::faction(430,10); #CoV

    quest::faction(448,-30); #Kromzek

    quest::delglobal("friendofthekin");

  }

  else {

    plugin::return_items(\%itemcount);

  }

}



# EOF zone: skyshrine ID: 114061 NPC: Sentry_Kale



