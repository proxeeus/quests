# Custom-made enchanter-ish NPC in EC tunnel that will offer various services to players
# in order to make up for the lack of real player interaction on solo servers
# (trading/resizing armor pieces, enchanting and maybe more in the future...)

#################
# Configuration #
#################

# Variables
# Holds the type of jewelry set to give
$jewelry_set_tier;
$jewelry_set_class;

# These are expressed in Platinum


####################
# General dialogue #
####################
sub EVENT_SAY
{
	if($text=~/hail/i)
	{
		quest::say("Hullo there my friend! I am Durtwick Fizzlebong, craftsman extraordinaire. May I interest you in some of my [services]?");
	}
	if($text=~/services/i)
	{
		quest::say("Would you like to know about [enchanting], [jewelcrafting], [blacksmithing] or [armor resizing] ? I also offer a variety of pre-made [jewelry sets], for a price.");
	}
	if($text=~/armor resizing/i)
	{
		quest::say("Aha! Armor resizing is one of the most basic things I can do. Basically, you hand me a piece of armor that is too small or large for you, and lo and behold! I will change its size! Cloth, leather, bronze, steel, I can do them all!");
	}
	if($text=~/enchanting/i)
	{
		quest::say("Enchanting is a pretty complex affair. Nonetheless, if you bring me bars of Silver, Gold, Electrum or Platinum, I will enchant them for you! These bars are a prerequisite for crafting most jewelry pieces.");
	}
	if($text=~/jewelcrafting/i)
	{
		quest::say("I am able to craft exquisite pieces of jewelry. The only thing that I ask of you is that you need to provide all the required materials such as enchanted [bars] of metal and the corresponding [gems].");
	}		
	if($text=~/bars/i)
	{
		quest::say("Bars of metal such as: Silver, Electrum, Gold, Platinum. They are found in every good jewelcrafting shop accross Norrath.");
	}
	if($text=~/gems/i)
	{
		quest::say("Gems such as Rubies, Opals, Topazes etcetaera etcetaera. Some of them can sometimes be found in jewelcrafting shops but most will be found deep inside the darkest depths of the world...");
	}
	if($text=~/jewelry set/i)
	{
		quest::say("For a fee, I can provide you or your fellow adventurers sets of exquisite jewelry. Lower quality sets are of course cheaper than their more advanced counterparts. Please tell me if you need a [low], [medium], [high] quality set for [melees], [spellcasters] or [healers].");
	}
	if($text=~/low/i)
	{
		$jewelry_set_tier = "low";
	}
	if($text=~/medium/i)
	{
		$jewelry_set_tier = "medium";
	}
	if($text=~/high/i)
	{
		$jewelry_set_tier = "high";
	}
	if($text=~/melee/i)
	{
		$jewelry_set_class = "melee";
	}
	if($text=~/spellcaster/i)
	{
		$jewelry_set_class = "spellcaster";
	}
	if($text=~/healer/i)
	{
		$jewelry_set_class = "healer";
	}

	# Lastly, check if some tier+class keywords have been spoken, for jewelry
	if( $jewelry_set_tier ne "" && $jewelry_set_class ne "")
	{
		process_jewelry_set();
	}
}

sub process_jewelry_set()
{
	if($jewelry_set_tier eq "low")
	{
		if($jewelry_set_class eq "melee")
		{
		quest::shout("KIKOO LOW MELEE LOL");
			low_melee_jewelry_set();
		}
		if($jewelry_set_class eq "healer")
		{
			low_healer_jewelry_set();
		}
		if($jewelry_set_class eq "spellcaster")
		{
			low_spellcaster_jewelry_set();
		}
	}
	if($jewelry_set_tier eq "medium")
	{
		if($jewelry_set_class eq "melee")
		{
			medium_melee_jewelry_set();
		}
		if($jewelry_set_class eq "healer")
		{
			medium_healer_jewelry_set();
		}
		if($jewelry_set_class eq "spellcaster")
		{
			medium_spellcaster_jewelry_set();
		}
	}
	if($jewelry_set_tier eq "high")
	{
		if($jewelry_set_class eq "melee")
		{
			high_melee_jewelry_set();
		}
		if($jewelry_set_class eq "healer")
		{
			high_healer_jewelry_set();
		}
		if($jewelry_set_class eq "spellcaster")
		{
			high_spellcaster_jewelry_set();
		}
	}

	$jewelry_set_tier="";
	$jewelry_set_class="";

}

sub EVENT_ITEM
{
	##################
	# Enchanting	 #
	##################
	if(plugin::check_handin(\%itemcount, 16500 =>1))
	{
		quest::summonitem(16504);
		quest::say("Here is your enchanted Silver bar!");
	}
	if(plugin::check_handin(\%itemcount, 16501 =>1))
	{
		quest::summonitem(16505);
		quest::say("Here is your enchanted Electrum bar!");
	}
	if(plugin::check_handin(\%itemcount, 16502 =>1))
	{
		quest::summonitem(16506);
		quest::say("Here is your enchanted Gold bar!");
	}
	if(plugin::check_handin(\%itemcount, 16503 =>1))
	{
		quest::summonitem(16507);
		quest::say("Here is your enchanted Platinum bar!");
	}
	##################
	# Jewelcrafting	 #
	##################
	# Silver Bar	 #
	##################
	if(plugin::check_handin(\%itemcount, 16504=>1, 10015=>1))
	{
		quest::summonitem(14600);
		quest::say("Here is your Silver Malachite Ring.");
	}
	if(plugin::check_handin(\%itemcount, 16504=>1, 10016=>1))
	{
		quest::summonitem(14604);
		quest::say("Here is your Silver Lapis Lazuli Necklace.");
	}
	##################
	# Gold Bar	 #
	##################
	if(plugin::check_handin(%itemcount, 16506 =>1, 10025 =>1))
	{
		quest::summonitem(14658);
		quest::say("Here is your Golden Topaz Earring.");
	}

	##################
	# Armor resizing #
	##################

	################################
	# Small Bronze armor to Normal #
	################################
    	if (plugin::check_handin(\%itemcount, 4213 => 1)) 
	{
      		quest::summonitem(4201);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4214 => 1)) 
	{
      		quest::summonitem(4202);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4215 => 1)) 
	{
      		quest::summonitem(4203);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4216 => 1)) 
	{
      		quest::summonitem(4204);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4217 => 1)) 
	{
      		quest::summonitem(4205);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4218 => 1)) 
	{
      		quest::summonitem(4206);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4219 => 1)) 
	{
      		quest::summonitem(4207);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4220 => 1)) 
	{
      		quest::summonitem(4208);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4221 => 1)) 
	{
      		quest::summonitem(4209);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4222 => 1)) 
	{
      		quest::summonitem(4210);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4223 => 1)) 
	{
      		quest::summonitem(4211);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4224 => 1)) 
	{
      		quest::summonitem(4212);
		quest::say("Here you go!");
    	}

	######################################
	# Bronze armor to Large bronze armor #
	######################################
    	if (plugin::check_handin(\%itemcount, 4201 => 1)) 
	{
      		quest::summonitem(4225);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4202 => 1)) 
	{
      		quest::summonitem(4226);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4203 => 1)) 
	{
      		quest::summonitem(4227);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4204 => 1)) 
	{
      		quest::summonitem(4228);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4205 => 1)) 
	{
      		quest::summonitem(4229);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4206 => 1)) 
	{
      		quest::summonitem(4230);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4207 => 1)) 
	{
      		quest::summonitem(4231);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4208 => 1)) 
	{
      		quest::summonitem(4232);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4209 => 1)) 
	{
      		quest::summonitem(4233);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4210 => 1)) 
	{
      		quest::summonitem(4234);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4211 => 1)) 
	{
      		quest::summonitem(4235);
		quest::say("Here you go!");
    	}
    	if (plugin::check_handin(\%itemcount, 4212 => 1)) 
	{
      		quest::summonitem(4236);
		quest::say("Here you go!");
    	}

	###############################
	# Large bronze armor to small #
	###############################
	if (plugin::check_handin(\%itemcount, 4225 => 1)) 
	{
      		quest::summonitem(4213);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4226 => 1)) 
	{
      		quest::summonitem(4214);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4227 => 1)) 
	{
      		quest::summonitem(4215);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4228 => 1)) 
	{
      		quest::summonitem(4216);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4229 => 1)) 
	{
      		quest::summonitem(4217);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4230 => 1)) 
	{
      		quest::summonitem(4218);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4231 => 1)) 
	{
      		quest::summonitem(4219);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4232 => 1)) 
	{
      		quest::summonitem(4220);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4233 => 1)) 
	{
      		quest::summonitem(4221);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4234 => 1)) 
	{
      		quest::summonitem(4222);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4235 => 1)) 
	{
      		quest::summonitem(4223);
		quest::say("Here you go!");
    	}
	if (plugin::check_handin(\%itemcount, 4236 => 1)) 
	{
      		quest::summonitem(4224);
		quest::say("Here you go!");
    	}
}