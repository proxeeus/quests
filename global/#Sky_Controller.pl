# Controls dynamic Sky settings in zones not affected by day/night visual cycles
# like gfay, lfay, emeraldjungle etc.
# This ensures that the day/night cycle is correctly visible. This is purely cosmetic
# and has no bearing on conditional spawns etc!

# Dedicated Sky_Controller npc ID: 680

# Zones to consider for UseMaxTime and general skybox use:
# eastwastes, halas (no skybox is certain), misty, mistmoore, paineel, swampofnohope, tox, trakanon, wakening, warslikswood

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
	elsif($zonesn eq "gfaydark" || $zonesn eq "lfaydark" || $zonesn eq "greatdivide"|| $zonesn eq "warslikswood")
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
	elsif($zonesn eq "warslikswood")
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
		|| $zonesn eq "cabwest")
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
	$subTimer = 5;
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
				}
				elsif(UseMaxTime() eq "true")
				{
					quest::setsky(0);
					$morningSetup = "true";
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
				}
				elsif(UseMaxTime() eq "false")
				{	
					quest::setsky(1);
					quest::settimer("forceskyupdate", $subTimer);
					$nightSetup = "true";
					
				}
			}
			$morningSetup = "false";
		}
	}
	elsif($timer eq "forceskyupdate")
	{
		quest::stoptimer("forceskyupdate");
		quest::setsky(0);
	}
}