sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Can't you see I'm on duty?!!  If you wish to converse, might I suggest the Tink N' Babble tavern near the Temple of Terror?"); }
}

sub EVENT_DEATH_COMPLETE 
{
	quest::say("You have not won.  Consider yourself wanted by the Legion of Cabilis.");
}

sub EVENT_SLAY
{
	quest::say("Another victory for the Legion of Cabilis.");
}

sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("Cease and desist!!");
   }
}
#END of FILE Zone:cabwest  ID:5144 -- Trooper_Tygar 

