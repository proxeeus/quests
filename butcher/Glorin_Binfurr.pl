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
