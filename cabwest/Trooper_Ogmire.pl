sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, citizen.  Looking for healing or other such services?  If so, then I urge you to seek out the Temple of Terror.  The hierophants will see to it for you."); }
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
#END of FILE Zone:cabwest  ID:5133 -- Trooper_Ogmire 

