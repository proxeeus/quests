# The purpose of this guy is to have an East Commonlands tunnel purveyor of base droppable items in exchange of platinum,
# mimicking player trade on live.

# Basically you can sell him bone chips, deathfist belts, crushbone belts, or buy him some tradeskilled armor / low/mid level
# quested armor ala Armor of Ro or Totemic.

# Prices are roughly based on their equivalent on Project 1999 but can be customized if needed.

# 1000c = 1 pp
# Small / Medium / Large Banded armor total: 91000
# Small / Medium / Large Fine Plate armor total: 136000
# Small / Medium / Large Bronze armor total: 110000

sub EVENT_SAY
{
	$currentCash=$client->GetCarriedMoney();
	
	if($text=~/hail/i)
	{
		quest::say("Yes yes, hail to thee as well. Here on business? I'm buyin' an' sellin' all sortso' goods, bone chips, pelts...I'm also sellin' some fine armor!");
	}
	###########################
	# FULL FINEPLATE ARMOR
	###########################
	elsif($text=~/buy full fineplate/i)
	{
		quest::say("Here's your full set of Fineplate armor, forged by the best smiths of Norrath. That'll be 136 platinum pieces.");
		quest::summonitem(21001);
		quest::summonitem(21002);
		quest::summonitem(21003);
		quest::summonitem(21004);
		quest::summonitem(21005);
		quest::summonitem(21007);
		quest::summonitem(21008);
		quest::summonitem(21009);
		quest::summonitem(21009);
		quest::summonitem(21010);
		quest::summonitem(21011);
		quest::summonitem(21012);
		$client->TakeMoneyFromPP(136000, true);
		
	}
	##############################
	# END FULL FINEPLATE ARMOR
	##############################
	
	##############################
	# FULL BANDED ARMOR
	##############################
	elsif($text=~/buy full banded/i)
	{
		quest::say("Here's your full set of Banded armor, forged by the best smiths of Norrath. That'll be 91 platinum pieces.");
		quest::summonitem(3053);
		quest::summonitem(3054);
		quest::summonitem(3055);
		quest::summonitem(3056);
		quest::summonitem(3057);
		quest::summonitem(3058);
		quest::summonitem(3059);
		quest::summonitem(3060);
		quest::summonitem(3061);
		quest::summonitem(3061);
		quest::summonitem(3062);
		quest::summonitem(3063);
		quest::summonitem(3064);
		$client->TakeMoneyFromPP(91000, true);
		
	}
	#############################
	# END FULL BANDED ARMOR
	#############################
	
	##################################################
	# Bone chips, 1 pp per chip, ideally 20p a stack.
	##################################################
	elsif($text=~/sell bone chips/i)
	{
		$num = quest::collectitems(13073, 0);
		if($num => 1)
		{
			quest::say("Hmm, $num bone chips. Here's your payment.");
			quest::collectitems(13073, 1);
			quest::givecash(0, 0, 0, $num);
		}
		else
		{
			quest::say("Well ! I don't see any bone chips there.");
		}
	}
	##################################
	# END BONE CHIPS
	##################################
	
	##############
	# ARMOR OF RO
	##############
	elsif($text=~/ro breastplate/i)
	{
		if($currentCash > 500000)
		{
			quest::summonitem(3151);
			$client->TakeMoneyFromPP(500000, true);
		}
	}
	elsif($text=~/ro greaves/i)
	{
		if($currentCash > 300000)
		{
			quest::summonitem(3155);
			$client->TakeMoneyFromPP(300000, true);
		}
	}
	elsif($text=~/ro boots/i)
	{
		if($currentCash > 150000)
		{
			quest::summonitem(3156);
			$client->TakeMoneyFromPP(150000, true);
		}
	}
	elsif($text=~/ro gauntlets/i)
	{
		if($currentCash > 250000)
		{
			quest::summonitem(3154);
			$client->TakeMoneyFromPP(250000, true);
		}
	}
	elsif($text=~/ro bracer/i)
	{
		if($currentCash > 250000)
		{
			quest::summonitem(3153);
			$client->TakeMoneyFromPP(250000, true);
		}
	}
	elsif($text=~/ro vambraces/i)
	{
		if($currentCash > 250000)
		{
			quest::summonitem(3152);
			$client->TakeMoneyFromPP(250000, true);
		}
	}
	elsif($text=~/ro helm/i)
	{
		if($currentCash > 300000)
		{
			quest::summonitem(3150);
			$client->TakeMoneyFromPP(300000, true);
		}
	}
	##################
	# END ARMOR OF RO
	##################
	
	#########################
	# ARMOR OF THE PRIEST
	########################
	elsif($text=~/chestplate of the constant/i)
	{
		if($currentCash > 400000)
		{
			quest::summonitem(4926);
			$client->TakeMoneyFromPP(400000, true);
		}
	}
	elsif($text=~/greaves of the penitent/i)
	{
		if($currentCash > 275000)
		{
			quest::summonitem(4924);
			$client->TakeMoneyFromPP(275000, true);
		}
	}
	elsif($text=~/vambraces of the fervent/i)
	{
		if($currentCash > 150000)
		{
			quest::summonitem(4923);
			$client->TakeMoneyFromPP(150000, true);
		}
	}
	elsif($text=~/gauntlets of the ardent/i)
	{
		if($currentCash > 75000)
		{
			quest::summonitem(4922);
			$client->TakeMoneyFromPP(75000, true);
		}
	}
	elsif($text=~/boots of the reliant/i)
	{
		if($currentCash > 50000)
		{
			quest::summonitem(4921);
			$client->TakeMoneyFromPP(50000, true);
		}
	}
	elsif($text=~/bracers of the reverent/i)
	{
		if($currentCash > 300000)
		{
			quest::summonitem(4925);
			$client->TakeMoneyFromPP(300000, true);
		}
	}
	############################
	# END ARMOR OF THE PRIEST
	############################
	
	############################
	# TOTEMIC ARMOR
	############################
	elsif($text=~/totemic breastplate/i)
	{
		if($currentCash > 450000)
		{
			quest::summonitem(4946);
			$client->TakeMoneyFromPP(450000, true);
		}
	}
	elsif($text=~/totemic cloak/i)
	{
		if($currentCash > 100000)
		{
			quest::summonitem(4948);
			$client->TakeMoneyFromPP(100000, true);
		}
	}
	elsif($text=~/totemic helm/i)
	{
		if($currentCash > 400000)
		{
			quest::summonitem(4947);
			$client->TakeMoneyFromPP(400000, true);
		}
	}
	elsif($text=~/totemic greaves/i)
	{
		if($currentCash > 190000)
		{
			quest::summonitem(4944);
			$client->TakeMoneyFromPP(190000, true);
		}
	}
	elsif($text=~/totemic vambraces/i)
	{
		if($currentCash > 150000)
		{
			quest::summonitem(4943);
			$client->TakeMoneyFromPP(150000, true);
		}
	}
	elsif($text=~/totemic boots/i)
	{
		if($currentCash > 100000)
		{
			quest::summonitem(4941);
			$client->TakeMoneyFromPP(100000, true);
		}
	}
	elsif($text=~/totemic gauntlets/i)
	{
		if($currentCash > 100000)
		{
			quest::summonitem(4942);
			$client->TakeMoneyFromPP(100000, true);
		}
	}
	elsif($text=~/totemic bracers/i)
	{
		if($currentCash > 80000)
		{
			quest::summonitem(4945);
			$client->TakeMoneyFromPP(80000, true);
		}
	}
	############################
	# END TOTEMIC ARMOR
	############################
	
}
