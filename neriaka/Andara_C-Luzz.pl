#Andara C'Luzz, Neriaka 41095 
#Need Ending Statement 
#Need Factions 
#Status: Not Complete 

sub EVENT_ITEM { 
	if (plugin::check_handin(\%itemcount, 16166 => 1, 19582 => 1, 19583 => 1)) 
	{
		quest::say("Fine work, $name. You do the Hall of the Ebon Mask proud on this day. Here, take this weapon. Do not hesitate to test it on more of those pesky halflings, HA ! All Hail Innoruuk, our Lord and Creator!"); 
		quest::ding();
		quest::exp(1500);		
		quest::summonitem(19611); 
	} 
} 