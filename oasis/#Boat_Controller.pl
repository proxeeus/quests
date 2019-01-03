# Oasis Boat Watcher
# Will spawn the Barrel Barge coming from Timorous Deep.

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("WATCHER TD SPAWN");
} 

sub EVENT_SIGNAL
{
	if($signal == 1) # Signal coming from TD, we must spawn the Barge in Oasis
	{
		#quest::spawn2(68228, 224, 0, 3680, 2010, -25, 254);
		quest::spawn2(37070, 0, 0, -1181, 1557, -6.99, 227);
		quest::shout("PUTAIN j'AI RECU UN SIGNAL MDR");
	}
	elsif($signal == 2) # Signal coming from TD, it's safe to start the Barge's grid
	{
		quest::signalwith(37070, 1); # Start grid 107
	}
}
