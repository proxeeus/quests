sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("The purchase of a water extractor would be wise for any lizard who expects to venture deep into the wilds of Kunark."); }
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
#END of FILE Zone:cabwest  ID:5146 -- Trooper_Xaxxot 

