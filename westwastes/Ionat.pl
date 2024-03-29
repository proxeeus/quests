sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::say("Hello $name. It is good to see that you have traveled so far to be in my presence. I do believe that you are the one chosen to aid us in our fight against the giants. If you are then I am sure that you will need my rune for your research.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1908 => 1)){ #Jualicn's Token
    quest::say("Take this Rune of Revenge, $name. You will need it to extract retribution in remembrance of our dear Hsagra. I thank you for your contributions to our cause. It is good to have you amongst our ranks.");
    quest::faction(430,10);   #Claws of Veeshan
    quest::faction(436,10);  #Yelinak
    quest::faction(448,-30); #Kromzek
    quest::exp(1000);
    quest::ding();
    quest::summonitem(1894); #Rune of Revenge
    if(!plugin::check_hasitem($client,1893) || !plugin::check_hasitem($client,1895) || !plugin::check_hasitem($client,1896)) {
      quest::summonitem(1908); #Jualicn's Token
    }
    quest::depop_withtimer();
  } 
  plugin::return_items(\%itemcount);
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("You should not have dared!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("You will pay, and pay dearly, for this.  The Claws will exterminate you.");
}

#NpcID: 120017 - NpcName: Ionat - Zone: westwastes
