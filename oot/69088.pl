# Zoner OOT -> Butcherblock

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("WATCHER TO BUTCHER SPAWN");
} 

# Sends PCs to Butcher
sub EVENT_ENTER
{
	quest::emote("'s spirit moves you to another land ...");
	#quest::movepc(68,3680,2010,20,0); #was Z 20
	quest::movepc(68,3600.02, 2253.84,-1,249);
}