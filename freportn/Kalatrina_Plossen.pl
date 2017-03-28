sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail!  Welcome to the Hall of Truth.  We. the Knights of Truth. are all the hope this city has of loosening the grip of Lucan D'lere and his militia.  I seek a young knight to [serve the will of the Truthbringer].");
}
if($text=~/what serve the will of the truthbringer/i){
quest::say("Shame on you.  To set foot into the Hall of Truth and not know for whom it was built.  Still. it is never too late to see the light.  Mithaniel Marr is our deity.  He is the Truthbringer.  By living our lives in valor and crushing all those who suppress His beliefs. we serve Him."); }
}

sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 18818 => 1)){
	quest::faction("322","1");
	quest::faction("304","-1");
	quest::faction("10103","1");
 }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8074 -- Kalatrina_Plossen 

