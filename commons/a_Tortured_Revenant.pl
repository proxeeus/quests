# misc. quest dialogue for spell: divine might
#

sub EVENT_DEATH_COMPLETE 
{
	quest::say("At last I can rest..");
	quest::signalwith(21011,66,0);
}

# EOF zone: commons ID: 21031 NPC: a_Tortured_Revenant

