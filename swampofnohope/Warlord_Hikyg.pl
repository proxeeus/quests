sub EVENT_SAY 
{
  if($text=~/hail/i)
  {
	quest::say("What business do you have speaking to an Iksar Warlord? Be gone before you find yourself served as my evening meal. Go to Captain Nedar if you wish to assist my garrison. Fool.");
  }
  elsif($text=~/prepared to hunt escaped froglok slaves/i)
  {
	quest::say("Of course you are. They are to be found running in packs within the edges of the city gates. Find the Escaped Frogloks and slay them. Take their Slave Shackles and throw them in the bag I have given you. When it is filled and combined, return it to me. My concern is only for those who have escaped into the swamp. This is my land and I have been ordered to keep it's denizens under control.");
	quest::summonitem(17994);	# Slave Shackle Bag
  }
}

sub EVENT_ITEM
{
	if (plugin::check_handin(\%itemcount, 18211 => 1))	# Note to Iksar Lord
	{ 
		quest::say("It is about time they have sent some lackey to perform tasks too paltry for my Troopers to deal with. We need to punish those who dare to run from their servitude. You will need this bag. Are you [prepared to hunt escaped froglok slaves] and serve your Lord?");
	}
	elsif (plugin::check_handin(\%itemcount, 12661 => 1))	# Filled Slave Shackle Bag
	{
		quest::say("Good work, $name. You would make a fine trooper in my garrison. As instructed by the War Baron, I reward you with the geozite tool. May you find your place among the Legion of Cabilis and win many battles.");
		quest::exp(2000);
		quest::faction( 441,10);
		quest::faction( 440,2);
		quest::faction( 445,2);
		quest::faction( 444,2);
		quest::faction( 442,2);
		quest::givecash(10,0,1,0);
		quest::ding();
		quest::summonitem(12657);	# Geozite Tool
	}
}