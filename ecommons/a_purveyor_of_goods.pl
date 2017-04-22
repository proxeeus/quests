sub EVENT_SAY
{
	if($text=~/bone chips/i)
	{
		$num = quest::collectitems(13073, 0);
		if($num => 1)
		{
			quest::say("Hmm, $num bone chips. Here's your payment.");
			quest::collectitems(13073, 1);
			quest::givecash(0, 0, 0, $num);
		}
		else
		{
			quest::say("Newp $num");
		}
	}
}
