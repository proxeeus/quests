#npc - Gfaydark Guard Protectors
#zone - Gfaydark
#by Angelox

sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("For the defense of Kelethin!!");
   }
}
sub EVENT_DEATH_COMPLETE 
{
	quest::say("My comrades will avenge my death.");
}