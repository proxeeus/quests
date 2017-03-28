sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
} 

sub EVENT_ENTER
{
	quest::emote("'s spirit moves you to another land ...");
	quest::movepc(1,322,-300,0,254);
}