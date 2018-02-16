# BB Boat Watcher
# Will spawn the Siren's Bane in BB, going to OOT.

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("WATCHER TO OOT SPAWN");
} 

sub EVENT_SIGNAL
{
	if($signal == 1) 
	{
		quest::spawn2(68228, 224, 0, 3680, 2010, -26, 254);
		quest::shout("PUTAIN j'AI RECU UN SIGNAL MDR");
	}
}
