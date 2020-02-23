sub EVENT_SAY {   
  if($text=~/hail/i) {
    quest::say("Quite busy!! Quite busy!! Things must be done. [New components] to be collected!!");
  }
  if($text=~/hail/i && plugin::check_hasitem($client, 4246)) {
    quest::say("So you are expecting to earn your way to rank of revenant, eh? You shall when I have the base and stem of the candle your occultist skullcap.");
  }
  if($text=~/new components/i) {
    quest::say("Yes, yes!! I will need components from beyond the gates. I must find an [apprentice of the third rank].");
  }
  if($text=~/apprentice of the third rank/i) {
    quest::say("If you truly be an apprentice of the third circle, then there is a Dark Binder skullcap to be earned. Take this sack and fill it with a creeper cabbage, a heartsting telson with venom, brutling choppers and a scalebone femur. When they are combined within the sack, you may return it to me with your third rank skullcap and and we shall bid farewell to the title, apprentice.");
    quest::summonitem(17024); # Item: Brood Sack
  }
  if($text=~/true mission/i) {
    quest::say("I have been waiting for a Nihilist to return. His name was Ryx and I fear his love of ale and the high seas has kept him from his mission. All I want you to do is find him. He should be disguised as a worker and he will give you a tome to bring to me. Return it with your Dark Binder Cap. I am sure that is simple enough for one as simple as you. Be sure to give him this.");
    quest::summonitem(12848); # Item: Spectacle
  }
  if($text=~/keepers grotto/i){
	quest::say("Keepers Grotto is where you shall find the Keepers. They study and scribe the spells of our dark circle. The grotto is not far from here, near the arena called the Gauntlet.");
  }
}
sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 12420 => 1, 4262 => 1)) { #full component sack, apprentice skullcap - 3rd rank
	quest::say("'I demand a full fish sack and your third circle apprentice skullcap.");
    quest::say("You have taken far too long!! Already another apprentice has performed this task. You will still be rewarded with the Dark Binder skullcap, but now you must aid in a [true mission].");
    quest::exp(200);
	quest::ding();
    quest::summonitem(4263); #dark binder skullcap
    quest::faction(441,20); # Faction: Legion of Cabilis
    quest::faction(443,20); # Faction: Brood of Kotiz
  }
  if(plugin::check_handin(\%itemcount, 55978 => 1, 4263 => 1)) { #a journal and dark binder skullcap
    quest::say("I did not expect you to return. You made me loose a bet with one of the other scholars. Seeing as you have delivered the tome, I shall not harm you, but rather welcome you into the rank of the dark circles. Now, go find Keeper Rott, and tell him you're the chosen occultist.");
    quest::exp(200);
	quest::ding();
    quest::summonitem(4264); #occultist skullcap
    quest::faction(441,20); # Faction: Legion of Cabilis
    quest::faction(443,20); # Faction: Brood of Kotiz
  }
  if (plugin::check_handin(\%itemcount, 12853 => 1, 12852 => 1, 4264 => 1 )) { 
#Stem of Candlestick, Foot of Candlestick, occultist skullcap
    quest::emote("grabs the candle parts and puts them in an odd pouch, then takes your cap which disintegrates in his palm. He hands you another cap.");
    quest::say("Welcome, Revenant $name. You have done well. The Harbinger awaits you. He seeks a [new revenant].");
    quest::exp(200);
	quest::ding();
    quest::summonitem(4265); #Revenant Skullcap
    quest::faction(441,20); # Faction: Legion of Cabilis
    quest::faction(443,20); # Faction: Brood of Kotiz
    quest::givecash(0,0,6,0);
  }
    plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabwest  ID:3430 -- Master_Kyvix
