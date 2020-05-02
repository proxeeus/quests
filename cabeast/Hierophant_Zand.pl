#Heirophant Zand starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it. She is also for the 3rd and 5th shaman skullcap quests.

sub EVENT_SAY {
  if(($text=~/chosen savior/i) ){
    quest::settimer(1, 1);
    quest::emote("closes his eyes and bows before you. 'I am honored to meet the one who shall pledge his life to the return of the Skulls of the Ancients. However, I must see proof of our prowess as of yet. Go to the outlands and retrieve one Froglok Hexdoll, and no, they are not found on Frogloks. They are shaman dolls made by the goblin tribe.'");
  }
  elsif($text=~/hail/i){
   quest::settimer(2, 1);
    quest::emote("raises his hand and looks up. 'May the wisdom of the ancients lead your soul to suffering and everlasting pain. Such is the will of Cazic-Thule. I see something in your eyes, $name. Have you lost something... your cudgel perhaps?'"); 
  }
  elsif($text=~/no/i){
    quest::say("The Temple of Terror requires all young Scaled Mystics to wear the symbol of their station. Wear it with pride in these halls to display the rank you have attained. Go now, and serve The Faceless."); #Could not find original text
  }
  elsif($text=~/yes/i){ #The Penance quest
    quest::say("That is most unfortunate for you. Your suffering will be extended on this plane, until you find your way back to us. Take this and read it on your way to speak with the Toilmaster. He will guide you. Yesssss...' You feel as if something is peering at you from behind the speaker's soulless eyes as the last letter he speaks transforms into a sigh."); 
    quest::summonitem(18271); #A Ragged Book
  }
  elsif($text=~/skulls of di nozok/i){
	quest::say("What?!! I have read of them, but that is all I know of the legendary mystic, err, mystics... whatever!! Where their remains rest is a mystery but those filthy goblins always seem to get ahold of things that are lost, all that infernal digging you see.");
  }
}

sub EVENT_TIMER{
	if($timer == 1){
		quest::stoptimer(1);
		plugin::DoAnim("bowto");
	}
	elsif($timer == 2){
		quest::stoptimer(2);
		plugin::DoAnim("wave");
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18272 => 1, 24770 => 1)) { #The Penance quest
    quest::emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time.");
    quest::say("Lucky you. You have earned a second chance. Praise Cazic-Thule!");
    quest::summonitem(5140); #Iron Cudgel of the Petitioner
    quest::ding();
	quest::exp(100);
  }
  #Shaman Skull Quest No.3.1 turn in - Check for  A froglok hex doll
  elsif((plugin::check_handin(\%itemcount, 12734 => 1)) ) {
    quest::say("'Fine work! I hope for your sake, you did not purchase it from a brave adventurer. Take this note to the one for whom it is written. This lizard has knowledge of a large number of skulls.");
    quest::faction(445, 10); #Scaled Mystics
    quest::faction(441, 10); #Legion of Cabilis
    quest::summonitem(18054); #A note to take to crusader Quarg.
    quest::exp(80000); #give decent xp...
    quest::givecash (0,0,0,5);
	quest::ding();
  }
  #Shaman Skull Quest No.5 turn in - Iksar Skull Helm and Iksar Skull and Cudgel of the Prophet
  elsif((plugin::check_handin(\%itemcount, 12741 => 1, 5144 => 1, 12740 => 1)) ) {
    quest::say("You have done well in proving yourself to this council, but we have yet more tests for you before you will be a true clairvoyant. Speak with Hierophant Dexl for your next test. Tell him you have been sent by Di Nozok himself.");
    quest::faction(445, 10); #Scaled Mystics
    quest::faction(441, 10); #Legion of Cabilis
    quest::summonitem(5145); #Give the player The Cudgel of the Channeler
    quest::exp(120000); #give decent xp...
    quest::givecash (0,0,0,10);
	quest::ding();
  }
  plugin::return_items(\%itemcount);
}

