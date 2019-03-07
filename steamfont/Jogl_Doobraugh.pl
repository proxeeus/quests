sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13209 =>1 )) {
    quest::say("Hmmm. Here you go. Take this log to Drekon Vebnebber. He is the in-house merchant at Gemchoppers Hall. It is his duty to file away all these logs.");
    quest::summonitem(quest::ChooseRandom(18837,18838));  #see not below
    quest::faction( 245,1 );
    quest::faction( 333,1 );
    quest::faction(255 ,1 );
    quest::faction( 287,-1 );
    quest::faction( 239,-1 );
     quest::ding(); quest::exp(1000);
    
    
  }
}

sub EVENT_SPAWN {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(56108,0,0,$x - 5,$y,$z,$h);
}

#random 18837 and 18838 for two sepearte quests beginnings Red V and duster
#18837 used for Red V
