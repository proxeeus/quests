sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to the new order of life, the life of service to our diseased Lord, Bertoxxulous. Did you encounter any of my [pets] on the way here? I hope not.");
  }
  if($text=~/pets/i) {
    quest::say("My pets are the skeleton guardians of these catacombs. Some have been behaving erratically since the arrival of [Drosco].");
  }
  if($text=~/drosco/i) {
    quest::say("Drosco used to be a loyal member of our shrine, until we learned the truth. The truth was that he was a mole from the Knights of Thunder. It appears they are assisting the Temple of Life in their pursuit of our eradication. Drosco was apprehended and boiled alive. I turned his boiled body into a zombie to march these halls. Now he must be stopped. He has begun to [compromise the shrine's location].");
  }
  if($text=~/compromise/i) {
quest::say("The problem is, he was strong in Karana's faith. And as sometimes is the case, there is a resonance from his deity. This causes him to wander in and out of our hidden shrine and I believe it also interferes with my control of the other pets. Please find him and destroy him. Bring me back the note I placed upon his body. Go!!");
  }
  if($text=~/new task/i) {
  quest::say("I have been working with a man named Lord Grimrot. We are attempting to raise an army of undead in the Plains of Karana. When the time is right, we shall attack from within as well as from beyond the walls of Qeynos. This army needs one more commander. I must find a Bloodsaber to [retrieve the commander].");
  }
  if($text=~/retrieve the commander/i) {
  quest::say("I have searched for the appropriate man... Sir Lucan of Freeport, Field Marshal Ralem, Marshal Anrey of Rivervale, even Commander Kane Bayle. Any of them would do, but they are either inaccessible or share a common goal with us. So I have decided Trumpy Irontoe is the one. Any former member of the [Irontoe Brigade] has a wealth of military strategies. Kill him and bring me his head. Kane will not be pleased, but, it must be done.");
  }
  if($text=~/irontoe brigade/i) {
  quest::say("The Irontoe Brigade was a legendary military unit hailing from the dwarven city of Kaladim. After a dangerous assault, where more than three quarters of the unit met their bloody fate, the brigade disbanded and left for parts unknown. In Fish's Bar, in Qeynos, you can find one of them, Trumpy Irontoe.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18805 => 1)) {
    quest::say("Good work! You shall rise quickly in our ranks of evil. Let no man stand in your way and never betray the shrine or you to will join our collection of undead. You can also assist me with a [new task].");
    quest::summonitem(17002);
    quest::ding();
    quest::exp(1000);
    quest::faction(21,1);
    quest::faction(135,-1);
    quest::faction(235,-1);
    quest::faction(257,-1);
    quest::faction(53,1);
    quest::givecash(0,3,0,0);
  }
  if (plugin::check_handin(\%itemcount, 12136 => 1)) {	#Trumpy's head
		quest::say("Incredible!! You have slain one of the greatest warriors in Qeynos!! He must have been full of grog. No doubt he drank most of his skill away. Now I shall cast a spell and strip the flesh from his skull and.. Presto!! Take this skull to Lord Grimrot somewhere in the Plains of Karana. He will be in the center of a field of skeletons. If he is not there, wait for his return. He must return eventually.");
		quest::summonitem(12137);
		quest::ding();
		quest::exp(10000);
		quest::faction(21,15);
		quest::faction(135,-10);
		quest::faction(235,-10);
		quest::faction(257,-10);
		quest::faction(53,10);
		quest::givecash(5,3,0,0);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qcat  ID:45067 -- Kurne_Rextula