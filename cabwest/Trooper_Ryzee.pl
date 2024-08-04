sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("If you are searching for rare items, I would suggest the merchants of the Brood of Kotiz.  They often carry rare trinkets from beyond the walls of Cabilis."); }
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
#END of FILE Zone:cabwest  ID:5138 -- Trooper_Ryzee 

