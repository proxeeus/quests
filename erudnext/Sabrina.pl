# Sabrina skiff
my $myVar = "";

sub EVENT_SIGNAL
{
	if($signal == 1) # Sea King pop
	{
		$myVar = "skiffStart";
		quest::start(22); #grid 22 = Port to Sea King route
	}
	elsif($signal == 2)
	{
		$myVar = "skiffReturn";
	}
}

sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 11 && $myVar eq "skiffStart")
	{
		quest::signalwith(24301 , 1); # Signals the Sea King we're almost there, commence depart timer
	}
	
	if($wp == 1 && $myVar eq "skiffReturn")
	{
		$myVar = "skiffStart";
		quest::stop();
	}
}
