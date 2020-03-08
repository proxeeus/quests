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
  elsif ($text=~/trooper reporting for duty/i) 
  {
	quest::say("It is about time they sent new troopers for my garrison!! This is the toughest garrison in Kunark!! And you're going to help prove it. The legion needs to get a hold of some new frog shields called Krup warrior guards. You're going to take this pack and fill it with not one, but four!! When you can return a full, combined pack to me, maybe you will show me that you're not as weak as you look!!");
	quest::summonitem(17043);	# Swamp Garrison Pack
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
		quest::faction( 441,10);
		quest::faction( 440,2);
		quest::faction( 445,2);
		quest::faction( 444,2);
		quest::faction( 442,2);
		quest::givecash(10,0,1,0);
		quest::ding();
		quest::summonitem(12657);	# Geozite Tool
		quest::exp(2000);
	}
	elsif (plugin::check_handin(\%itemcount, 12435 =>1, 12436 =>1, 12437 =>1, 5133 =>1 )) 
	{
		quest::emote("hands you plans for a trooper's pike head. 'Congratulations. You are now a trooper of the Legion of Cabilis. Now you may fight with honor and a mighty weapon.'");
		quest::faction( 441,10);
		quest::faction( 440,2);
		quest::faction( 445,2);
		quest::faction( 444,2);
		quest::faction( 442,2);
		quest::ding();
		quest::summonitem(12477);
		quest::exp(2000);
	}
	elsif (plugin::check_handin(\%itemcount, 12913 => 1))	# Four Crushed Shields
	{ 
		quest::say("What?!! You crushed all the shields!! You croak-faced skulking brute!! You don't deserve to be in my garrison!! I am going to recommend you for a promotion in hopes that you will be sent to hunt dragons and meet your end!");
		quest::faction( 441,10);
		quest::faction( 440,2);
		quest::faction( 445,2);
		quest::faction( 444,2);
		quest::faction( 442,2);
		quest::ding();
		quest::summonitem(18073);
		quest::exp(2000);
	}
}