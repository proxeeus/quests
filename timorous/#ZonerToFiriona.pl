# ZonerToFiriona script for Timorous
# This script is in charge of moving players when entering the proximity range of the NPC

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 150, $x + 150, $y - 150, $y + 150);
	quest::shout("WATCHER SPAWNED");
} 


sub EVENT_ENTER
{
	quest::emote("'s spirit moves you to another land ...");
	# loc a bit different than Maidens spawn point to take into account the bigass geometry of the ship
	quest::movepc(84,2802, -5544, -68, 376);
}

