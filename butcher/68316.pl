# Zoner to Oot from Butcher

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("ZONER TO OOT");
} 

sub EVENT_ENTER
{
	quest::emote("'s spirit moves you to another land ...");
	quest::movepc(69,10784,1151,-1, 0); # MOVE TO OOT NUMBER 2
}