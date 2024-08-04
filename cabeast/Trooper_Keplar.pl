sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You want to be like Trooper Keplar?  Who does not?  You must first be summoned to rebirth within Fortress Talishan.  If you have not, then you can not be like this grand one."); }
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
#END of FILE Zone:cabeast  ID:5119 -- Trooper_Keplar 

