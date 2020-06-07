my $pursuit = undef;
my $endPursuit = undef;

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("Over my dead body!");
	}
	if($signal==2) {
		quest::SetRunning(1);
		#quest::start(8);
		quest::moveto(274, -321, 1, -1, false);
		$pursuit = "true";
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($pursuit eq "true") {
		quest::SetRunning(0);
		$pursuit = undef;
		$endPursuit = "true";
		quest::moveto(453, -377, -24, 210, true);
	}
	if($endPursuit eq "true") {
		$endPursuit = undef;
	}
	if($wp==9) {
		quest::stop();
	}
}


	