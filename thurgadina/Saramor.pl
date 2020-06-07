my $pursuit = undef;
my $endPursuit = undef;

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("Blasphemer!");
	}
	if($signal==2) {
		quest::say("Get him boys!");
	}
	if($signal==3) {
		quest::SetRunning(1);
		#quest::start(6);
		quest::moveto(277, -321, 1, -1, false);
		$pursuit = "true";
	}
	if($signal==4) {
		quest::say("Well, don't ya just keep us in suspense now. What in the world was it?");
		quest::signalwith(115011,4,8000);
		quest::signalwith(115187,4,8000);
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($pursuit eq "true") {
		quest::SetRunning(0);
		$pursuit = undef;
		$endPursuit = "true";
		quest::moveto(443, -372, -24, 60, true);
	}
	if($endPursuit eq "true") {
		$endPursuit = undef;
	}
	if($wp==9) {
		quest::stop();
		quest::say("So good to see you, Rumagur. I hope you're feelin better today.");
		quest::signalwith(115011,3,8000);
		quest::signalwith(115187,3,8000);
	}
}

