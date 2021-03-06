# TD Boat Watcher
# Will spawn the Maiden's Voyage coming from Firiona, Bloated Belly for Overthere etc

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("WATCHER TD SPAWN");
} 

sub EVENT_SIGNAL
{
	if($signal == 1) # Signal coming from Maiden in FV, we must spawn Maiden in TD
	{
		#quest::spawn2(68228, 224, 0, 3680, 2010, -25, 254);
		quest::spawn2(96301, 31, 0, -1800, -2300, -20, -267);
		quest::shout("PUTAIN j'AI RECU UN SIGNAL MDR");
	}
	elsif($signal == 2) # Make Butcherblock shuttles move, spawn the Skiffs on the TD side to be sure.
	{
		quest::debugshout("Alright Maidens, I'm telling the BBM skiffs to start their routes!");
		quest::crosszonesignalnpcbynpctypeid(68150,1);
		quest::crosszonesignalnpcbynpctypeid(68319,1);
		quest::crosszonesignalnpcbynpctypeid(68320,1);
		quest::crosszonesignalnpcbynpctypeid(68321,1);
		
		# Fix heading??
		#quest::spawn2(96355, 0, 0, -7185, 3863, -8.10, 108);
		#quest::spawn2(96356, 0, 0, -7185, 3900, -8.10, 108);
		#quest::spawn2(96357, 0, 0, -7185, 3927, -8.10, 108);
		#quest::spawn2(96358, 0, 0, -7185, 3966, -8.10, 108);
		quest::spawn2(96355, 0, 0, -7185, 3863, -3.84, 108);
		quest::spawn2(96356, 0, 0, -7185, 3900, -3.84, 108);
		quest::spawn2(96357, 0, 0, -7185, 3927, -3.84, 108);
		quest::spawn2(96358, 0, 0, -7185, 3966, -3.84, 108);
	}
	elsif($signal == 3)	# The Belly's left the OT's docks, we should now spawn the Belly in TD, idling.
	{
		quest::debugshout("Time to spawn da Belly!");
		quest::spawn2(96317,0,0,1000, -1500, -4.51, 130);
	}
	elsif($signal == 4) # This is coming from OT's Bloated Belly, it's about to depop so it's safe to start the Belly's TD Grid
	{
		quest::debugshout("Hey Belly, move your ass !");
		quest::signalwith(96317, 1);
	}
	elsif($signal == 5)	# This is coming from Oasis's Barrel Barge, we need to spawn the Barge in TD, idle
	{
		quest::spawn2(96316, 0, 0, 4764, 7195, -5, 373);
	}
	elsif($signal == 6)	# This is coming from Oasis's Barrel Barge, it's about to depop so it's afe to start the Barge's TD Grid
	{
		quest::signalwith(96316, 1);
	}
}
