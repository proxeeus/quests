sub EVENT_WAYPOINT_ARRIVE
{
	if( $npc->GetGrid() == 64 ) # erudin to qeynos
	{
		if($wp == 4)
		{
			quest::crosszonesignalnpcbynpctypeid(1310, 1);
		}
		elsif($wp == 5)
		{
			quest::depop(98053);
		}
	}
	elsif( $npc->GetGrid() == 65 )
	{
		if($wp == 8)
		{
			quest::crosszonesignalnpcbynpctypeid(24305, 1);
		}
		elsif($wp == 10)
		{
			quest::depop(98053);
		}
	}
}
