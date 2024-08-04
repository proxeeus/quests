sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Look to the center of Cabilis and you shall find the Kloks.  They will have all the provisions you will need for any adventuring you may do."); }
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
#END of FILE Zone:cabeast  ID:5092 -- Trooper_Azalin 

