sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18901 => 1))
	{
	quest::say("'I.. but.. she.. You can take this. I guess I don't need it any more.");
	quest::summonitem(14640); #silver amber ring
	quest::exp(500);
	quest::faction("43", "15");
	quest::faction("243", "15");
	quest::faction("290", "15");
	quest::faction("304", "15");
	quest::faction("344", "15");

	}
}

#end quest -- Guard Settine.