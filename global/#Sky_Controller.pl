# Controls dynamic Sky settings in zones not affected by day/night visual cycles
# like gfay, lfay, emeraldjungle etc.
# This ensures that the day/night cycle is correctly visible. This is purely cosmetic
# and has no bearing on conditional spawns etc!

#burningwood mintime = 6 maxtime = 19
#gfay 9 15

my		$morningSetup = "false";
my		$nightSetup = "false";

$mainTimer = 5;
$subTimer = 5;

sub GetMinTime()
{
	if($zonesn eq "burningwood" || $zonesn eq "everfrost")
	{
		return 6;
	}
	elsif($zonesn eq "gfaydark" || $zonesn eq "lfaydark")
	{
		return 9;
	}
}

sub GetMaxTime()
{
	if($zonesn eq "burningwood" || $zonesn eq "everfrost" )
	{
		return 20;
	}
	elsif($zonesn eq "gfaydark" || $zonesn eq "lfaydark")
	{
		return 15;
	}
}

sub UseMaxTime()
{
	if($zonesn eq "everfrost")
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