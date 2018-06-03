# Zone to soldunga event
# Zone: soldungb, Position B (Muse's Maps)
# AngeloX

sub EVENT_SPAWN
{
	#Was30
	#$x = $npc->GetX();
	#$y = $npc->GetY();
	quest::set_proximity($x - 15, $x +15, $y - 15, $y + 15);
}

sub EVENT_ENTER
{
	quest::movepc(31,-506,-295,27.1,282);
}
