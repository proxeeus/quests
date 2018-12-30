# TD Boat Watcher
# Will spawn the Maiden's Voyage coming from Firiona

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
		#quest::spawn2(68228, 224, 0, 3680, 2010, -25, 254); # Z était à -26
		quest::spawn2(96301, 31, 0, -1800, -2300, -20, -267); #somewhat fixed, grid in db used to be 3680 2010 -25
		quest::shout("PUTAIN j'AI RECU UN SIGNAL MDR");
	}
	elsif($signal == 2) # Make Butcherblock shuttles move, spawn the Skiffs on the TD side to be sure.
	{
		quest::shout2("Alright Maidens, I'm telling the BBM skiffs to start their routes!");
		quest::crosszonesignalnpcbynpctypeid(68150,1);
		quest::crosszonesignalnpcbynpctypeid(68319,1);
		quest::crosszonesignalnpcbynpctypeid(68320,1);
		quest::crosszonesignalnpcbynpctypeid(68321,1);
		
		# Fix heading??
		quest::spawn2(96355, 0, 0, -7185, 3863, -4, 108);
		quest::spawn2(96356, 0, 0, -7185, 3900, -4, 108);
		quest::spawn2(96357, 0, 0, -7185, 3927, -4, 108);
		quest::spawn2(96358, 0, 0, -7185, 3966, -4, 108);
	}
}
