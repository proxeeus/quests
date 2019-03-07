sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18901 => 1))
	{
	quest::say("'I.. but.. she.. You can take this. I guess I don't need it any more.");
	quest::summonitem(14640); #silver amber ring
	quest::exp(500);
	quest::faction("226", "15");
	quest::faction("283", "15");
	quest::faction("438", "15");
	quest::faction("310", "15");
	quest::faction("449", "15");

	}
}

#end quest -- Guard Settine.
