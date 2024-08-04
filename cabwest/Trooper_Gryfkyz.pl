sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Looking for a challenging fray?  Perhaps there is a combatant waiting for a duel within the Gauntlet."); }
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
#END of FILE Zone:cabwest  ID:5109 -- Trooper_Gryfkyz 

