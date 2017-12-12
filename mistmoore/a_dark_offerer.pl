sub EVENT_TIMER{
	if($timer=="appearance"){
		plugin::RandomFace($npc);
		quest::stoptimer("appearance");
	}
	
}

sub EVENT_SPAWN{
	quest::settimer("appearance", 1);
}