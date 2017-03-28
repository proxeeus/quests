######################################
## NPC: Runethar_Hamest ##
## Zone: Quenos Paladin handin GM ##
## Revised by Proxeeus				##
## EQWorld Server ##
######################################

sub EVENT_SAY 
{
	if ($text=~/Hail/i)
	{
		quest::say("Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you [need guidance] or are you [already a follower of Karana]?");
	}
	if($text=~/guidance/i)
	{
		quest::say("Excellent news $name. You need to seek out Miltiades Tal-Azroth. He is right here in the Paladin Guild.");
	}
	if($text=~/already a follower of Karana/i)
	{
		# Made that up.
		quest::say("I am pleased to see that you follow the ways of the Rainkeeper. Keep fighting the good fight and do not hesitate to return to me should you need some training.");
	}
}
sub EVENT_ITEM
{
	if ($item1=="18710")
	{
		quest::say("Thanks $name. Now you need to seek out Miltiades Tal-Azroth. He is right here in the Paladin Guild.");
		quest::summonitem("13505");
		quest::ding(); quest::exp("100");
	}
	else 
	{
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
		plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:qeynos ID:1136 -- Runethar_Hamest

