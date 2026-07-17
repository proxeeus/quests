# Zoner to East Freeport

sub EVENT_SPAWN
{
	$x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::debugshout("ZONER TO FP SPAWNED");
}

sub EVENT_ENTER
{
	# was z -60, too low when spawning in EFP
	quest::movepc(10,-1654,-655,-69, 0); 
}