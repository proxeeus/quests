sub EVENT_SIGNAL
{
	if($signal == 1)
	{
		quest::spawn2(98053, 64, 0, 3604, 1884, -40, 192); # Spawnn Sea king
	}
	elsif($signal == 2)
	{
		quest::spawn2(98053, 65, 0, -1838, -188, -40, 63); # Spawnn Sea king
	}
}