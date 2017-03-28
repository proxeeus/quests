sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You $name.  We hear of you.  We need help.  You [help Crakneks] or you [help self]?");
}
if($text=~/i want to help crakneks/i){
quest::say("Ha!!  We hear of great adventurer.  You?!!  Me no think so.  You prove self to Crakneks before you help us.  Go to Innoth.. Innotu.. Innooth.. Arghh!!  You go to outside Oggok.  Find fat alligator bit Lork brother in two.  Bring brother. Nork. body back.  Then me know you strong.");
}
if($text=~/i want to help self/i) {
 quest::say("You help self to leave Oggok before me bash you.  We no need cowards.");
}
}

sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 13356 => 1)) { #Ogre Arm (From Fat Alligator in Innothule Swamp)
   quest::say("What the...? Just an arm? Ug, poor Nork make too big meal for fat alligator. Go away...oh and take dis junk to Uglan so he gets quiet and leaves Lork alone.  Lork wants to be alone with Nork.");
   quest::summonitem(13357); #Cracked Stein
  } 
  elsif(plugin::check_handin(\%itemcount, 1717 => 1)) {
   quest::say("Arg! Dem damned Orcs and Dark Elves! To da hells with dem! I be wantin revenge! Bring me da hearts of da dark elf ammbassador's K'ryn who can be locat'd in da shamen tun'ls, and D'vinn who can be located in da crushbone with da orc emperor.");
   quest::summonitem(13359); #Gatorsmash Maul
   quest::say("Oh yeah, me almost forgot. Take this, and if you see fat alligator, smash it every time.");
  } 
  elsif(plugin::check_handin(\%itemcount, 13227 => 1, 13358 => 1)) {
   quest::say("Ahahaha! Da basterds! Here be a reward for ye!");
   quest::summonitem(quest::ChooseRandom(4225,4226,4227,4228,4229,4232,4233,4234,4235,4236,13355));
  } 
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:oggok  ID:49040 -- Lork 

