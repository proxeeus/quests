#BeginFile trakanon\Kaiaren.pl
#Quest for Trakanon's Teeth - Kaiaren (Mad): Monk Epic 1.0

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("AHHH get it away from me go away .. leave me alone.");
  }
  if($text=~/celestial fists/i) {
    quest::say("Eh? What's that? Bah! That was destroyed long ago. Don't waste my time with fairy taAAAAAGGHHH GET IT AWAY!!!! HELP!!! They're all over MEHEHEHEHEEEEEEee!!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1683 => 1))
  { #Celestial Fists
    quest::emote("eyes open wide and he attacks you!");
    quest::summonitem(1683); #Celestial Fists
    quest::attack($name);
    quest::spawn(95209,0,0,2470,306,-339); #Kaiaren (True)
  }
  elsif(plugin::check_handin(\%itemcount, 1684 => 1)) 
  { #Charred Scale
    quest::say("Ahhh, impressive indeed! Now that you have broken the chain of the Fists, the others may come toppling down if you persevere. The Fist of Air is now the weakest, then Earth, and finally Water before the master of them all, Vorash. You must defeat them in order, proving the demise of the last to draw out the one you are after. The task before you now is to take this scale and show it to the Fist of Air wherever he may be. Good luck.");
    quest::summonitem(1684); #Charred Scale
	quest::exp(15000);
	quest::ding();
  }
  elsif(plugin::check_handin(\%itemcount, 1688 => 1, 1689 => 1))
  { #Demon Fangs and Book of Celestial Fists
    quest::emote("bows his head and breathes a long sigh as if relived of a great weight. He then looks up at you and says, 'I honestly did not believe you could have defeated Vorash. Even though he sought nothing but war and bloodshed, it is a life nonetheless and we must mourn him. I will sew these fangs into magical fist wraps and they shall be yours. Remember Xenevorash. A purpose can be found for every situation and individual. To achieve perfection is to perceive this truth.'");
    quest::summonitem(10652); #Celestial Fists (Epic)
	quest::exp(150000);
	quest::ding();
	quest::settimer(2, 1);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER{
	if($timer == 1){
			quest::stoptimer(1);
			plugin::DoAnim("bowto");
		}
}


sub EVENT_DEATH_COMPLETE {
  quest::say("Not bad.. Now lets see if you can find my trueform if you do we discuss this further.");
}
#EndFile trakanon\Kaiaren.pl (95105)