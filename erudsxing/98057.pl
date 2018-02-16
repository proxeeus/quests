sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::spawn2(98053, 64, 0, 3604, 1884, -40, 384); # Spawnn Sea king
	}
	elsif($signal == 2)
	{
		quest::spawn2(98053, 65, 0, -1838, -188, -40, 126); # Spawnn Sea king
	}
}
