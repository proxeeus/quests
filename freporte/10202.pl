#Orc hand-in NPC for Final Task Rogue

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19930 =>1 )) {
  quest::emote("snarls, 'Our deal is complete. Run back to Tovan and give him that gem. The Deathfist Orcs shall let you live for now.'");
    quest::signal(10128);
  quest::summonitem(19918);
  quest::depop();
    
  }
}