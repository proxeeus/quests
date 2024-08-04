sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I am glad the crusaders assist with the patrols of Cabilis.  Their powers of healing are always welcomed by the troopers."); }
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
#END of FILE Zone:cabwest  ID:5141 -- Trooper_Shyzin 

