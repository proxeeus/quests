# The purpose of this guy is to have an East Commonlands tunnel purveyor of base items in exchange of platinum,
# mimicking player trade on live.

# Basically you can sell him bone chips, deathfist belts, crushbone belts, or buy him some tradeskilled armor.

# Small / Medium / Large Banded armor total: 91
# Small / Medium / Large Fine Plate armor total: 136
# Small / Medium / Large Bronze armor total: 110

sub EVENT_SAY
{
	# Bone chips, 1 pp per chip, ideally 20p a stack.
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
