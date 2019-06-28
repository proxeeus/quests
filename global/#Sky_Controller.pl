# Controls dynamic Sky settings in zones not affected by day/night visual cycles
# like gfay, lfay, emeraldjungle etc.
# This ensures that the day/night cycle is correctly visible. This is purely cosmetic
# and has no bearing on conditional spawns etc!

# Dedicated Sky_Controller npc ID: 680

# Zones to consider for UseMaxTime and general skybox use:
# eastwastes, halas (no skybox is certain), misty, mistmoore, paineel, swampofnohope, tox, trakanon, wakening, warslikswood

#gfaydark bug:
# upon spawning and playing with times (9 am, 11 PM etc), the system behaves correctly
# if we set the time to 3AM/4AM, the system bugs out and the timer no longer works as intended
# if spawning at 23 PM everythings ok ?

my		$morningSetup = "false";
my		$nightSetup = "false";

$mainTimer = 5;
$subTimer = 1;

sub GetMinTime()
{
	if($zonesn eq "burningwood" || $zonesn eq "everfrost" || $zonesn eq "eastwastes" || $zonesn eq "emeraldjungle" || $zonesn eq "feerrott" || $zonesn eq "halas"
		|| $zonesn eq "innothule" || $zonesn eq "kithicor" || $zonesn eq "misty"|| $zonesn eq "nektulos"|| $zonesn eq "oggok"|| $zonesn eq "paineel"|| $zonesn eq "qrg"
		|| $zonesn eq "swampofnohope"|| $zonesn eq "tox"|| $zonesn eq "trakanon"|| $zonesn eq "wakening"|| $zonesn eq "cabeast"|| $zonesn eq "cabwest")
	{
		return 6;
	}
	elsif($zonesn eq "gfaydark" || $zonesn eq "lfaydark" || $zonesn eq "greatdivide"|| $zonesn eq "warslikswood"|| $zonesn eq "mistmoore")
	{
		return 9;
	}
}

sub GetMaxTime()
{
	if($zonesn eq "burningwood" || $zonesn eq "everfrost" || $zonesn eq "eastwastes" || $zonesn eq "emeraldjungle" || $zonesn eq "feerrott" || $zonesn eq "halas"
		|| $zonesn eq "innothule"|| $zonesn eq "kithicor"|| $zonesn eq "misty"|| $zonesn eq "nektulos"|| $zonesn eq "oggok"|| $zonesn eq "paineel" || $zonesn eq "qrg"
		|| $zonesn eq "swampofnohope"|| $zonesn eq "tox"|| $zonesn eq "trakanon"|| $zonesn eq "wakening"|| $zonesn eq "cabeast"|| $zonesn eq "cabwest")
	{
		return 20;
	}
	elsif($zonesn eq "gfaydark" || $zonesn eq "lfaydark" || $zonesn eq "greatdivide")
	{
		return 15;
	}
	elsif($zonesn eq "warslikswood"|| $zonesn eq "mistmoore")
	{
		return 18;
	}
}

# This helps the contoller determine if we should stick to a skyboxless night instead of a dark blueish one.
sub UseMaxTime()
{
	if($zonesn eq "everfrost" || $zonesn eq "burningwood" || $zonesn eq "emeraldjungle" || $zonesn eq "feerrott" || $zonesn eq "halas"
		|| $zonesn eq "innothule"|| $zonesn eq "kithicor"|| $zonesn eq "misty"|| $zonesn eq "nektulos"|| $zonesn eq "oggok"|| $zonesn eq "paineel" || $zonesn eq "qrg"
		|| $zonesn eq "swampofnohope"|| $zonesn eq "tox"|| $zonesn eq "trakanon"|| $zonesn eq "wakening"|| $zonesn eq "warslikswood"|| $zonesn eq "cabeast"
		|| $zonesn eq "cabwest"|| $zonesn eq "mistmoore")
	{
		return "false";
	}
	else
	{
		return "true";
	}
}

sub EVENT_SPAWN
{
	$morningSetup = "false";
	$nightSetup = "false";

	$mainTimer = 5;
	$subTimer = 1;
	quest::settimer("sky", $mainTimer);
}

sub EVENT_TIMER
{
	if($timer eq "sky")
	{
		if($zonehour >= GetMinTime() && $zonehour <= GetMaxTime())
		{
			if($morningSetup eq "false")
			{
				if(UseMaxTime() eq "false")
				{
					quest::setsky(1);
					quest::settimer("forceskyupdate", $subTimer);
					$morningSetup = "true";
					#quest::shout("On a mis setsky a 1 la");
				}
				elsif(UseMaxTime() eq "true")
				{
					quest::setsky(0);
					$morningSetup = "true";
					#quest::shout("On a mis setsky a 0 la");
				}
			}
			$nightSetup = "false";
		}
		elsif($zonehour > GetMaxTime() )
		{
			if($nightSetup eq "false")
			{
				if(UseMaxTime() eq "true")
				{
					quest::setsky(1);
					$nightSetup = "true";
					#quest::shout("On a mis setsky a 1 la");
				}
				elsif(UseMaxTime() eq "false")
				{	
					quest::setsky(1);
					quest::settimer("forceskyupdate", $subTimer);
					$nightSetup = "true";
					#quest::shout("On a mis setsky a 1 la");
					
				}
			}
			$morningSetup = "false";
		}
		#
		# Night-time edge cases as a last resort
		#
		elsif(($zonehour >= 1 && $zonehour <= GetMinTime())
		&& 
		($zonesn eq "gfaydark" || $zonesn eq "lfaydark" || $zonesn eq "greatdivide"|| $zonesn eq "warslikswood"))
		{
			if($nightSetup eq "true")
			{
				quest::setsky(1);
				quest::settimer("forceskyupdate", $subTimer);
				$morningSetup = "true";
				#quest::shout("On a mis setsky a 1 la");
				
				$nightSetup = "false";
			}
		}
		elsif(($zonehour >= 1 && $zonehour <= GetMinTime())
		&& 
		#($zonesn eq "halas"|| $zonesn eq "mistmoore"))
		(UseMaxTime() eq "false"))	# for all zones not needing to keep a "true" skybox
		{
			if($morningSetup eq "true")
			{
				quest::setsky(1);
				quest::settimer("forceskyupdate", $subTimer);
				$nightSetup = "true";
				#quest::shout("On a mis setsky a 1 la");
				
				$morningSetup = "false";
			}
		}
		#
		# End night-time edge cases
		#
	}
	elsif($timer eq "forceskyupdate")
	{
		quest::stoptimer("forceskyupdate");
		quest::setsky(0);
		#quest::shout("On a mis setsky a 0 la");
	}
}