# Glorin Binfurr
# Restored to classic by Proxeeus.

sub EVENT_SAY 
{ 
	if($text=~/Hail/i)
	{
		quest::say("Pleasure to meet you.  Keep your eye out for the ship.  You don't want to miss it.");
	}

	if($text=~/mudtoes/i)
	{
		quest::say("Mudtoes!! I have heard tales of that foul clan of ogres. A few of the passengers aboard the ships have claimed to have seen one of them, off and on, amongst pirates in the Ocean of Tears!!");
	}

}

sub EVENT_SPAWN
{
			#quest::spawn2(68228, 224, 0, 3508.02, 2253.84, -25, 249); #somewhat okish
			#quest::spawn2(68228, 224, 0, 3600.02, 2253.84, -25, 249); #somewhat okish boat
			# player a 3597.34 2212.06 -1 heading 249
		#quest::spawn2(68228, 224, 0, 3337.28, 1361.63, -25, 254);
}
