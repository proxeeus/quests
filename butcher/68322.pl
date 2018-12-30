# Zoner to Timorous Deep from Butcher

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("ZONER TO TD");
} 

sub EVENT_ENTER
{
	quest::emote("'s spirit moves you to another land ...");
	quest::movepc(96,-7185, 3900, 15, 60); # MOVE TO TIMOROUS SHUTTLES
}