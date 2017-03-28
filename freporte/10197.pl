# ZonerToOot script for East Freeport
# This script is in charge of moving players when entering the proximity range of the NPC

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("WATCHER SPAWNED");
} 


sub EVENT_ENTER
{
	quest::emote("'s spirit moves you to another land ...");

	quest::movepc(69,-10583,-3169,-3,0);
}

