sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("If sweets are your fancy, seek out the chefs of Cabilis. They have much to offer."); }
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
#END of FILE Zone:cabeast  ID:5102 -- Trooper_Feglesh 

