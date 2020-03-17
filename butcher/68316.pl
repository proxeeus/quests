# Zoner to Oot from Butcher

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::debugshout("ZONER TO OOT");
} 

sub EVENT_ENTER
{
	quest::movepc(69,10784,1151,-1, 0); # MOVE TO OOT NUMBER 2
}