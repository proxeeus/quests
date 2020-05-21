# Controller NPC for the plate cycle in Kael.
# Say "the dain shall be slain for the peace we must obtain"
# Non-loot Doldigun spawns
# Giving him the letter to Doldigun returns a Ring of the Council
# Attacking him makes:
# ==>	Grondon_Zekkin (113443) pop
# ==>	Kromzog_Zekkin (113548) pop
#  With the first two, only the death of Kromzog will spawn the next giant. 

# When Kromzog dies, a level 54 Giant named Zlirron Windchill will spawn behind the left door, and walk out into the room.
# ==>	Vinric_Thunderclap (113492) pop
# ==>	Zlirron_Windchill (113471) pop

# Khalerogg Dorfenbane, and he is level 55. He will spawn behind the door on the Right side of the throne, and walk into the room
# ==>	Khalerogg_Dorfenbane (113534) pop

# Then:
# ==>	Valorankt_Zekkin (113528) pop

# Once Valorankt_Zekkin (113528) is dead:
# ==>	##Doldigun_Steinwielder (113508) pops

# If ##Doldigun_Steinwielder (113508) isnt' killed ASAP, he'll escape, and then the Controller NPC will depop and respawn 3h later.

my $killCount = 0;

sub EVENT_SPAWN {  
	$x = $npc->GetX();
	$y = $npc->GetY();
	$z = $npc->GetZ();
	quest::set_proximity($x - 30, $x + 30, $y - 30, $y +30, -999999, 999999, 1);
	quest::enable_proximity_say();
}



sub EVENT_PROXIMITY_SAY  {
	if($text=~/the dain shall be slain for the peace we must obtain/i) {
		quest::spawn2(113440,0,0,1126.4,-840.6,-118.3,125.2); #Doldigun, non-loot version
	}
}

sub EVENT_SIGNAL {
	if($signal == 5) {
		$killCount++;

		if($killCount == 2) {
			# Vinric & Zlirron are dead, time to spawn Khalerogg_Dorfenbane
			quest::spawn2(113534, 0, 0, 1130.3, -933.2, -125.6, 253.6);
			$killCount = 0;
		}
	}
	elsif($signal == 1) {
		quest::depop_withtimer();
	}
}
