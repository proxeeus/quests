sub EVENT_SPAWN{
	quest::start(237);
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1092 => 1)) {
    quest::say("Good work friend! The Dain will hear of this right away. We couldn't have defeated the Ry'gorr without your help. Take this ring as proof that you have served the Coldain well. You may wish to show it to the Seneschal should you ever stop in our fine city. Farewell, $name, it has been my pleasure knowing you.");
    quest::summonitem(30164); # Item: Velium Coldain Insignia Ring
#Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(406,30); # Faction: Coldain
    quest::faction(405,30); # Faction: Dain Frostreaver IV
    quest::faction(419,-30); # Faction: Kromrif
    quest::faction(448,-30); # Faction: Kromzek
    quest::exp(2000000);
	DepopTroops();
    quest::depop();
	quest::ding();
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_WAYPOINT_ARRIVE {
  if ($wp == 0) {
    quest::settimer(30,5);
  }
}

sub EVENT_TIMER {
  if($timer == 30){
	quest::stoptimer(30);
	SignalAttackTroops();
  }

}

sub DepopTroops{
	#royal wolven guard
	quest::depopall(116563);
	quest::depopall(116578);
	quest::depopall(116579);
	quest::depopall(116580);
	quest::depopall(116581);
	quest::depopall(116582);
	quest::depopall(116583);
	quest::depopall(116584);
	
	#priest of brell
	quest::depopall(116541);
	quest::depopall(116585);
	quest::depopall(116586);
	quest::depopall(116587);
	quest::depopall(116588);
	quest::depopall(116589);
	quest::depopall(116590);
	quest::depopall(116591);
	
	#royal archer
	quest::depopall(116555);
	quest::depopall(116592);
	quest::depopall(116593);
	quest::depopall(116594);
	quest::depopall(116595);
	quest::depopall(116596);
	quest::depopall(116597);
	quest::depopall(116598);
	
	#paladin of brell
	quest::depopall(116549);
	quest::depopall(116599);
	quest::depopall(116600);
	quest::depopall(116601);
	quest::depopall(116602);
	quest::depopall(116603);
	quest::depopall(116604);
	quest::depopall(116605);
	
}

sub SignalAttackTroops{
	quest::shout("For the Glory of Thurgadin! CHARGE!!");
	$npc->SetRunning(true);
	#royal wolven guard
	quest::signalwith(116563,3);
	quest::signalwith(116578,3);
	quest::signalwith(116579,3);
	quest::signalwith(116580,3);
	quest::signalwith(116581,3);
	quest::signalwith(116582,3);
	quest::signalwith(116583,3);
	quest::signalwith(116584,3);
	
	#priest of brell
	quest::signalwith(116541,3);
	quest::signalwith(116585,3);
	quest::signalwith(116586,3);
	quest::signalwith(116587,3);
	quest::signalwith(116588,3);
	quest::signalwith(116589,3);
	quest::signalwith(116590,3);
	quest::signalwith(116591,3);
	
	#royal archer
	quest::signalwith(116555,3);
	quest::signalwith(116592,3);
	quest::signalwith(116593,3);
	quest::signalwith(116594,3);
	quest::signalwith(116595,3);
	quest::signalwith(116596,3);
	quest::signalwith(116597,3);
	quest::signalwith(116598,3);
	
	#paladin of brell
	quest::signalwith(116549,3);
	quest::signalwith(116599,3);
	quest::signalwith(116600,3);
	quest::signalwith(116601,3);
	quest::signalwith(116602,3);
	quest::signalwith(116603,3);
	quest::signalwith(116604,3);
	quest::signalwith(116605,3);
	

	
}

