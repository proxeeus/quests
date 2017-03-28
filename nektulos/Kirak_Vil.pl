# Kirak Vil dialogue
# by Proxeeus

sub EVENT_SAY
{
	if($text=~/Hail/i)
	{
		quest::say("Begone from my sight, whelp! Do not try my patience or I may forget my quest and slay you where you stand. I seek the challenge of a [hypocrite] today.");
	}
	if($text=~/hypocrite/i)
	{
		quest::say("Need you ask? This day I will slay one of those self-righteous Paladins and earn the rank of Dragoon!");
	}
}