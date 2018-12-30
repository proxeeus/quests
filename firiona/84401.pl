# Firiona Boat Watcher
# Will spawn the Maiden's Voyage coming from Timorous Deep

sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
	quest::shout("WATCHER FV SPAWN");
} 

sub EVENT_SIGNAL
{
	if($signal == 1) # Signal coming from Maiden in TD, we must spawn Maiden in FV
	{
		quest::spawn2(84250, 216, 0, 2873, -5609, -126, -139);
		quest::shout("PUTAIN j'AI RECU UN SIGNAL MDR");
	}
}
