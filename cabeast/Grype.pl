# Skullcap 6 : complete rewrite.

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("gulps down the rest of his ale. 'Looks like I'll need another.'");
  }
  if ($text=~/blue talon/i) {
	quest::settimer(1, 1);
    quest::emote("takes a swipe at you. 'We used to be the bruisers of the west side. We didn't take nothin' from no one!! Fist and mind was our motto. Now get lost before I introduce my fist to your face. Wait, it looks like one too many fists have already been there.'");
  }
  if ($text=~/candlestick/i) {
	quest::say("Listen... Listen here. I have been forced to cut back on my drinking because my favorite sloshing stein was stolen from me by some stubby little thief in black. I was jus' minding my own business and picking flowers in the fields of the drixies when he comes and snatches it from me. Return it to me, and I will give you this treasure I acquired from a sarnak revenant.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12862 => 1)) {
    quest::emote("nearly faints. His eyes begin to tear up. 'Oh my sweet stein of sloshing! This is the great treasure. A shiny piece of broken metal! Ha! You never win when you deal with a Blue Talon!'");
    quest::summonitem(12852);
	quest::exp(100);
	quest::ding();
  }
  if (plugin::check_handin(\%itemcount, 12609 => 4)) {
    quest::emote("is staggering from one too many pale ales. 'Listen... Listen here. I have been forced to cut back on my drinking because my favorite sloshing stein was stolen from me by some stubby little thief in black. I was jus' minding my own business and picking flowers in the fields of the drixies when he comes and snatches it from me. Return it to me, and I will give you this treasure I acquired from a sarnak revenant.'");
    quest::givecash(1,0,0,0);
	quest::ding();
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER{
	if($timer == 1){
		quest::stoptimer(1);
		plugin::DoAnim("mainhand");
	}
}

#End of File zone:cabeast ID:106004 -- Grype