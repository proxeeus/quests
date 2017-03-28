# Zoner to East Freeport

sub EVENT_SPAWN
{
	$x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("ZONER TO FP SPAWND");
}

sub EVENT_ENTER
{
	quest::emote("'s spirit moves you to another land ...");
	quest::movepc(10,-1654,-655,-60, 0); 
}