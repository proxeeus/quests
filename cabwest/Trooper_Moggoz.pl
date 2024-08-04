sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I have heard stories that there is a lost valley of great treasures within the Dreadlands.  Some say it was there the Green Death first arose."); }
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
#END of FILE Zone:cabwest  ID:5126 -- Trooper_Moggoz 

