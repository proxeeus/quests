#npc - Gfaydark Guard Protectors
#zone - Gfaydark
#by Angelox

sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("For the defense of Kelethin!!");
   quest::say("For the protection of all Fier'Dal, there shall be no mercy for your kind.");
   }
}
sub EVENT_DEATH_COMPLETE
{
	my @death_lines = (
		"My comrades will avenge my death.",
		"Your name shall be added to the Guards of Faydark's most wanted list.",
	);
	quest::say($death_lines[int(rand(scalar @death_lines))]);
}
