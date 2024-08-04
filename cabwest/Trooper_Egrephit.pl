sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Trooper Egrephit is my name.  Keeping you broodlings safe is my game.  Quite a rhyme I weave.  Now it's time for you to leave.  Ha!! Where do I come up with these?"); }
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
#END of FILE Zone:cabwest  ID:5100 -- Trooper_Egrephit 

