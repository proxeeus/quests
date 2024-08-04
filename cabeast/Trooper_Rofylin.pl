sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I was once part of an expeditionary force sent deep into the Emerald Jungle.  We searched for the ruins of Torsis. It is there that we hoped to find the armory of the Army of Ik.  We did not succeed and lost most of our number to the evil within."); }
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
#END of FILE Zone:cabeast  ID:5136 -- Trooper_Rofylin 

