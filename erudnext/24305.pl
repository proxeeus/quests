sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
} 

sub EVENT_ENTER
{
	quest::emote("'s spirit moves you to another land ...");
	quest::movepc(98,3604,1884,-3,191);
}

sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::spawn2(24301, 0, 0, -1645, 64, -20, 0);
	}
}