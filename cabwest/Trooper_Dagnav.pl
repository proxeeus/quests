sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I have heard the old elven outpost has been retaken and that sails once more frequent our shores.  We are doomed unless we can repel the invaders.  Blast!!  As if the goblins, giants, sarnak, wurms and frogloks were not enough!"); }
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
#END of FILE Zone:cabwest  ID:5097 -- Trooper_Dagnav 

