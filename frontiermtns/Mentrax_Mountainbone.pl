sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("What be it you want! Go away before I eat you for dinner!");
  }
  if ($text=~/wenden sent me/i) {
    quest::say("Oh, old Wenden? I guess you be wanting some ore. Well, you can't have none! Not unless you get me a new monocle. No. No. No. Don't even try to talk, you either bring me a new monocle that will fit or no ore for you!");
  }
}

sub EVENT_ITEM 
{
	if (plugin::check_handin(\%itemcount, 20678 => 1))
	{
		quest::say("Eh, you actually found one! Thank you, $name. Here is a block of ore for you. Just don't let the other giants know.");
		quest::summonitem(20666);
		quest::ding(); 
		quest::exp(25000);
	}
	plugin::return_items(\%itemcount);
}

# EOF zone: frontiermtns ID: 92148 NPC: Mentrax_Mountainbone

