sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("WATCHER TO TD SPAWN");
} 

sub EVENT_SIGNAL
{
	if($signal == 1) 
	{
		quest::spawn2(93176, 0, 0, 3557, 3891, -183, 311);
		quest::shout("PUTAIN j'AI RECU UN SIGNAL MDR");
	}
	elsif($signal == 2)
	{
		quest::signalwith(93176, 1);	# Start the grid 272
	}
}