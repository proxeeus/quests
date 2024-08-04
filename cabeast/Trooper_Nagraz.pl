sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to Cabilis. Capital of the new Iksar Empire. One day all shall fear us as they once did.  One day, we shall take this entire orb and enslave it. The wretched wurms shall not stop us this time."); }
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
#END of FILE Zone:cabeast  ID:5128 -- Trooper_Nagraz 

