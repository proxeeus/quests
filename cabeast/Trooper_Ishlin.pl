sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I wish to earn heavy coin so I can meet with the Kloks in the Haggle Baron's house.  They are said to have the finest merchandise available in Cabilis."); }
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
#END of FILE Zone:cabeast  ID:5117 -- Trooper_Ishlin 

