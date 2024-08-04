sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("This is the city of Cabilis. New Sebilis. Someday, Emperor Vekin shall lead us into the halls of Sebilis and retake the old capital from the vile claws of the dragon which now resides within.  Until then, this is our capital."); }
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
#END of FILE Zone:cabeast  ID:5093 -- Trooper_Begzei 

