#Exterminator_Sahizz  ID  106009

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name.  Help rid this area of vermin!  Bring me four loose scales for a few coin and good favor in town.");
  }
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12466 =>4 )) {
    quest::say("Thank you, $name.  Here is your reward.");
    quest::exp(50);
    quest::givecash(0,5,0,0);
    quest::faction( 440,3 );
    quest::faction( 441,3 );
    quest::faction( 442,3 );
    quest::faction( 444,3 );
    quest::faction( 445,3 );
   
  }
}
