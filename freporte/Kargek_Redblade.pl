sub EVENT_SAY
 {
    if($text=~/Hail/i)   {
      quest::emote("looks up from his forge and says, 'Hello there, Can I help you?' Your eyes are drawn to an extremely large [red sword Scabbard] strapped to his back with no sword in it.");
      quest::say("I said, can I help you or do you need help from [Wenden]?");
    }
    if($text=~/Wenden/i) {
      quest::emote("points to the other side of the forge and says, 'Wenden is my partner. He is standing right over there. If it is a question about a weapon, he will probably have the answers.'");
    }
    if($text=~/red sword Scabbard/i) {
      quest::emote("turns to look at you and says, 'It is a family Heirloom. I might tell you the story behind it if you do me a little [favor].'");
    }
    if($text=~/favor/i) {
      quest::say("An associate of mine is wandering somewhere in the Feerrott. His name is Oknoggin Stonesmacker. If you will Deliver this note to him, I would appreciate it.");
      quest::summonitem("20673"); # Wax Sealed Note ID-20673
    }

  if($text=~/Korbuk Brimblade sent me to help/i){
    quest::say("Really? I thought we'd have to deal with this problem on our own, and that has proven most distressful. If you really are here on word from Korbuk, you'll have no problem helping my family recover a [sword] we made and put on our father's grave.");
  }
  if($text=~/What sword/i){
    quest::say("The sword is a sign of our heritage and our continued patronage and service to the cause of the red scabbard. It combines the duty of our family with our proud and strong family name and was placed on our father's grave as it was on his father's grave. It's a tradition you see, and now it's gone! I know [who did it] too!");
  }
  if($text=~/who did it/i){
    quest::say("It's that wily gnome, that's who! Drevlon and his gang of miscreants have been plotting to get their hands on anything valuable around here and they chose that sword as their prize. I had a lookout watching the area for a while, but there weren't any problems. Wouldn't you know it, as soon as I let the lookout off for an evening, Drevlon and his thugs snuck up to the grave and stole the sword! I need you to [find Drevlon] and recover the sword from him.");
  }
  if($text=~/find Drevlon/i){
    quest::say("If you can catch him and return the sword he stole, we can once again place it on the grave of my father where it belongs. He'll be expecting me or someone in lieu of me to try to find him, so you'll have to wait for him during the evening, when he's most likely to come out of hiding. He hasn't had a lot of time to get out of the area, so you can probably find him near my father's grave, in the eastern plains of Karana.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20674 => 1)) { # Tiny Lute
    quest::say("Thank you for delivering the note to my Associate. Take this book - It will tell you A little of the history of the old scabbard. If you would like to own the scabbard, seek out my younger brother Tenal and give him the book.");
    
     quest::ding(); quest::exp(1000);
    quest::summonitem("18083"); # Redblade's Legacy
  }
  if (plugin::check_handin(\%itemcount, 20684 => 1, 20679 => 1)) { # Tenal's Note to Kargek & Spiroc Wingblade
    quest::say("What is this? A note from my brother? Thank you for the gift as well.");
    quest::emote("reads the note and hands you the red scabbard. Your mind is filled with the sound of battle and a voice. 'Place the ancient sword blade, ancient blade, finely crafted dragon head hilt, and the jeweled dragon head hilt into the scabbard to receive your rewards. If you think you are worthy, place your rewards into the scabbard and see what havoc you can unleash on the world.'");
    quest::emote("addresses you as you turn to leave. 'One more thing. Gartrog over there has told me of a great discovery. Seems there are all sorts of stones being found in the recently discovered lost dungeons scattered around Antonica.  The Wayfarer's Brotherhood has found a way to make items even more powerful by using the stones with existing items.'");
    
    quest::ding(); quest::exp("1000000");
    quest::summonitem("17859"); # Red Scabbard
  }
#  plugin::return_items(\%itemcount);
  elsif (plugin::check_handin(\%itemcount, 60287 => 1)){
    quest::say("You got it, I'm so relieved! I know the rest of my family will be just as relieved as I am to know that we can return the sword to its resting spot atop my father's grave. You have done such a service to my family that I must give you something as a token of my thanks. This hilt bears the markings of the Redblade family. Combine it with the proper blade and you will have an amazing weapon. Thanks once again!");
    quest::summonitem("60288");
  }
}

#END of FILE Zone:freporte  ID:10117 -- Kargek_Redblade
