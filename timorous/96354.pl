# Timorous Island Shuttle A
my $myVar = "";

sub EVENT_SIGNAL
{
	if($signal == 1) # Signal from Maiden that it's waiting at its wp 4 (or 3?), start navigating
	{
		$myVar = "skiffStart";
		quest::shout("Bien recu!");
		quest::start(32); #grid 32 = Port to Maiden route
	}
	elsif($signal == 2)
	{
		$myVar = "skiffReturn";
	}
}

sub EVENT_WAYPOINT_ARRIVE
{
	if($wp == 4 && $myVar eq "skiffStart")
	{
		quest::signalwith(96301 , 1); # Signals Maiden's we're almost there, commence depart timer
	}
	
	if($wp == 1 && $myVar eq "skiffReturn")
	{
		$myVar = "skiffStart";
		quest::stop();
	}
}
