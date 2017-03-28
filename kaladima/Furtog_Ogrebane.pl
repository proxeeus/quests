# Furtog Ogrebane
# Rewrote by Proxeeus
# Includes the Mudtoes quest.

sub EVENT_SAY
{ 
	if($text=~/Hail/i)
	{
		quest::say("Hail, mighty $name! Welcome to Stormguard Hall. I am Captain Furtog Ogrebane, only surviving descendant of the legendary [Trondle Ogrebane], slayer of the [Mudtoes]. If you wish to serve the grand city of Kaladim, I urge you to speak with any of the trainers. Good day.");
	}
	if($text=~/mudtoes/i)
	{
		quest::say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?");
	}
	if($text=~/trondle/i)
	{
		quest::say("Trondle was my great father and slayer of the Mudtoes. He was killed by those vile Crushbone orcs. If you truly wish to help Kaladim remain safe, speak with trainer Canloe Nusback. Say that you are ready to serve Kaladim.");
	}
	if($text=~/searching for the mudtoes/i)
	{
		quest::say("I have heard persistent rumors of two Mudtoe ogres who survived the slaughter.  Go to the port of Butcherblock.  Those dock hands must have heard of the name [Mudtoe]. Bring me the remaining heads of the Mudtoes!!  I want all the Mudtoes dead!!  Do not return until you have them both!!");
	}
}

sub EVENT_ITEM 
{ 
	if(plugin::check_handin(\%itemcount,18766 => 1))
	{
		quest::summonitem("13515");
		quest::say("Welcome into our ranks! If you wish to serve the grand city of Kaladim, I urge you to speak with any of the trainers. Get going!");
		quest::exp("100");
		# Storm Guard faction
		quest::faction(314, 10);
		# Kazon Stormhammer faction
		quest::faction(169, 10);
		# Miners Guild 249 faction
		quest::faction(219, 10);
		# Merchants of Kaladim faction
		quest::faction(215, 10);
		quest::ding();
 	}
	# Check for the two Mudtoe heads from OOT
	elsif(plugin::check_handin(\%itemcount, 13316 => 1, 13317 =>1))
	{
		quest::say("Finally my great fathers work has been completed. All the Ogre Mudtoes have been exterminated. Thank you. Take this this weapon which my father pried from the cold dead hands of the Ogre Mudtoe Captain. It is called an Ogre War Maul. May you wield with honor in the name of Kaladim.");
		# Ogre War Maul
		quest::summonitem("6302");
		# Storm Guard faction
		quest::faction(314, 10);
		# Kazon Stormhammer faction
		quest::faction(169, 10);
		# Miners Guild 249 faction
		quest::faction(219, 10);
		# Merchants of Kaladim faction
		quest::faction(215, 10);
		# Craknek Warriors faction
		quest::faction(57, -30);
		quest::exp("3000");
		quest::ding();
	}
	else
	{
  		#do all other handins first with plugin, then let it do disciplines
  		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  		plugin::return_items(\%itemcount);
 	}
}
#END of FILE Zone:kaladima  ID:60008 -- Furtog_Ogrebane 

