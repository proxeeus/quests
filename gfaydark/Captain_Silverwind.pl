sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name.  I protect these lands in the name of the Royal Order of Koada'Vie. defenders of Felwithe."); }
}

sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("For the defense of Kelethin!!");
   }
}
sub EVENT_DEATH_COMPLETE 
{
	quest::say("My comrades will avenge my death.");
}
#END of FILE Zone:gfaydark  ID:54106 -- Captain_Silverwind 

