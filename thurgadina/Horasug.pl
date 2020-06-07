my $firstBar = undef;
my $secondBar = undef;
my $escape = undef;

sub EVENT_SPAWN {
	quest::moveto(448, -369, -21, 256, true);	# Go to Holy Harbinger upon spawning.
	$firstBar = "true";
}

sub EVENT_WAYPOINT_ARRIVE {
	if($firstBar eq "true") {
		quest::say("My beloved brethren! Hear me now, I have seen a sacred vision...");
		quest::signalwith(115011,1);	# Rumagur
		quest::signalwith(115187,1);	# Rumagur
		$firstBar = undef;
	}
	if($escape eq "true") {		# We're at Doogle's Drinks
		quest::SetRunning(0);
		quest::say("Whew, that was a close one!");
		quest::settimer(2, 5);
		$escape = undef;
	}

}

sub EVENT_TIMER {
	if($timer == 1) {		# Flee to Doogle's Drinks
		quest::stoptimer(1);
		$escape = "true";
		quest::say("Uh oh.");
		quest::SetRunning(1);
		quest::moveto(-305, -69, 3, 478, true);
		quest::signalwith(115011,2);	# Rumagur
		quest::signalwith(115187,2);	# Rumagur
		quest::signalwith(115010,3);	# Saramor
		quest::signalwith(115012,2);	# Jorumin
		quest::signalwith(115188,2);	# Jorumin
	}
	if($timer == 2) {	# Doogle's dialogue
		quest::stoptimer(2);
		$npc->SetAppearance(1);
		quest::signalwith(115142,1);	# Doogle_McBanick
	}
	if($timer == 3) {	# Depop and restart the event
		quest::depop_withtimer();
	}
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("In my vision, Brell himself spoke to me! He indicated that the path to true enlightenment could only be found through sobriety. Substances such as alcohol only serve to cloud the mind and keep us from our true destiny!");
		quest::signalwith(115010,1);	# Saramor
		quest::signalwith(115014,1);	# Loremaster_Fronden
	}
	if($signal==2) {
		quest::say("Mock me if you will brothers, I am off to seek audience with the Dain where I will convince him of the evils of liquor. I am sure he will have our taverns serving only water and juice by day's end.");
		quest::signalwith(115010,2);	# Saramor
		quest::signalwith(115012,1);	# Jorumin
		quest::signalwith(115188,1);	# Jorumin
		quest::settimer(1,5);
	}
	if($signal==3) {
		quest::say("I had a sacred vision from Brell himself!");
		quest::signalwith(115142,2);	# Doogle_McBanick
	}
	if($signal==4) {
		quest::emote("thinks for a moment, looking at the roomful of rugged patrons...");
		quest::signalwith(115142,3);	# Doogle_McBanick
	}
	if($signal==5) {
		quest::say("Heh, I saw meself here at Doogie's Drinks partaking of the finest Coldain ale in the land, of course!");
		quest::signalwith(115142,4);	# Doogle_McBanick
		quest::settimer(3, 60);
	}
}