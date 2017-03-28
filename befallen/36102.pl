#####
#
# Gynok Moltor spawns/PH fluff messages
#
#####

sub EVENT_SPAWN
{
	quest::shout("Grrrraaaaaaaaugggggh! You have disturbed my rest! Now suffer as I have!");
}

sub EVENT_AGGRO
{
	quest::say("You have disturbed my sleep, you will never find the paw!");
}