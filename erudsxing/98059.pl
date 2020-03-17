sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
} 

sub EVENT_ENTER
{
	quest::movepc(24,-1645,64,21,255);
}