# Boat Watcher script for East Freeport.

sub EVENT_SIGNAL
{
	if($signal == 1) # Signal from OOT that we must spawn Siren's Bane in EFP
	{
		quest::spawn2(10196, 24, 0, -1654, -655, -100, 0);
	}
}