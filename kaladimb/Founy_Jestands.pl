# Rogue Epic NPC/Guildmaster -- Founy_Jestands

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello. I am the guildmaster.");
 }
  if($text=~/note/i) {
    quest::emote("fingers his belt pouch.");
    quest::say("I don't know what you're talking about, if you know what I mean. You should leave now, if you know what's good for you. Don't make me sic the crew on you.");
	}
	if($text=~/stanos/i){
		quest::say("Um, er.. (looks around nervously) Have you actually seen Stanos? How.. is he? Um, I have things I should be doing. I've got to figure out how this pottery wheel got stuck on my foot, for one thing. Er, I really don't have anything to tell you about Stanos, really, I swear it.");
	}
}

sub EVENT_ITEM {
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}


#END of FILE  Quest by: Solid11  Zone:kaladimb  ID:67000 -- Founy_Jestands