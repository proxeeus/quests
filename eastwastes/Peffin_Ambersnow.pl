sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Oh, I uh... err, hello there. Umm, thank Brell you're here, those bloody Kromrif were going to torture me! Yes, yes, and you've saved me! How can I ever repay you?");
  }
  if($text=~/murdrick/i) {
    quest::emote("looks away and stammers, Ehh, ahh, Mur who?");
  }
  if($text=~/berradin/i) {
    quest::emote("goes even paler than usual, Hmm, Berradin you say? Sorry, but I've never even heard the name.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18171 => 1)) { #letter to peffin
    quest::spawn2(116182,0,0,3364,-1579,163.8,71.6);
    quest::spawn2(116182,0,0,3314,-1557,163.8,84.8);
    quest::spawn2(116182,0,0,3355,-1625,163.8,73.8);
    quest::settimer(1,10);
	$npc->SetInvisible(0);
	$npc->SetRunning(true);
	quest::emote("yells for assistance.");
	quest::shout("Take me if you can outlander! Your hunt ends here...I hope you enjoy the taste of Kromrif Steel!");
    quest::moveto(3303,-1623,163.3);
  }
}

sub EVENT_SPAWN{
	$npc->SetInvisible(1);
}

sub EVENT_TIMER {
  if($timer == 1) {
    quest::stoptimer(1);
    quest::spawn2(116607,0,0,3419.4,-1739.7,143.9,383);
    quest::depop_withtimer();
  }
}
