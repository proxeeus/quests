sub EVENT_SPAWN
{
    $x = $npc->GetX();
    $y = $npc->GetY();
	quest::set_proximity($x - 150, $x + 150, $y - 150, $y + 150);
} 

sub EVENT_ENTER
{
	quest::movepc(1,267,-308,6,502);
}