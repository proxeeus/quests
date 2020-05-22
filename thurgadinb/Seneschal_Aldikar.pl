my $ringQuest = undef;
my $isInPrivateQuarters = undef;

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(5,780,38,260,true);
	}
	if($signal==2) {
		quest::moveto(-3,693,69,258,true);
		$isInPrivateQuarters = undef;
	}
}

sub EVENT_SPAWN {
	$ringQuest = undef;
	$isInPrivateQuarters = undef;
}


sub EVENT_SAY {
	if($text=~/i will accept this task/i && $ringQuest && $isInPrivateQuarters){
		quest::say("In this box, place the accursed dirk of the fallen Rodrick. With it combine the heads of every traitor you dispose of. When this is done give the box and the velium insignia ring to the Dain directly. On behalf of the crown and all good Coldain, I thank you ... May Brell be with you.");
		quest::summonitem(17055); 
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($ringQuest eq "true") {
		$isInPrivateQuarters = "true";
		quest::settimer(10, 5);
	}
}

sub EVENT_ITEM {
	
	
	if($entity_list->GetNPCByNPCTypeID(129098) && plugin::check_handin(\%itemcount, 30164 => 1) )  {
		quest::say("Well done %t, I have heard of your victory over the Ry'Gorr. If you are willing to assist the crown further please follow me.");
		quest::summonitem(30164);
		quest::moveto(5, 780, 37, 260,true);
		$ringQuest = "true";

	}
	elsif($entity_list->GetNPCByNPCTypeID(129099) && plugin::check_handin(\%itemcount, 30164 => 1) ) {
		quest::say("I must speak to the Dain before I instruct you further. Please speak to me while the royal court is in session.");
		quest::summonitem(30164);
		$ringQuest = undef;
	}
	else{
		plugin::return_items(\%itemcount);
	}
}

sub EVENT_TIMER {
	if($timer == 10 && $isInPrivateQuarters) {
		quest::stoptimer(10);
		quest::say("Please, shut the door behind you. What I am about to share with you must not be overheard.");
		quest::settimer(11,10);
	}
	elsif($timer == 11) {
		quest::stoptimer(11);
		quest::say("My army stands prepared to launch an assault on Kael itself, but one task must be completed before this can happen.");
		quest::settimer(12,10);
	}
	elsif($timer == 12) {
		quest::stoptimer(12);
		quest::say("It seems Rodrick was not alone in his treachery. There is a faction of Coldain who believe that a treaty should be signed with the Kromrif, ending our hostilities with them. This, of course, is impossible. If there is one thing our history here has taught us it is that the Kromrif simply cannot be trusted.");
		quest::settimer(13,10);
	}
	elsif($timer == 13) {
		quest::stoptimer(13);
		quest::say("These traitors are poisoning the minds of our citizens, promising great rewards to those who will betry the Dain. It will take the unbiased eye of an outlander to flush out the masterminds behind this plan. Once again we turn to you.");
		quest::settimer(14,10);
	}
	elsif($timer == 14) {
		quest::stoptimer(14);
		quest::say("Will you accept this task outlander?");
		quest::settimer(15, 300);
	}
	elsif($timer == 15) {
		quest::stoptimer(15);
		$ringQuest = undef;
		
		if($entity_list->GetNPCByNPCTypeID(129098)){
			$isInPrivateQuarters = undef;
			quest::moveto(-3,693,69,258,true);
		}
	}
}

#END of FILE Zone:thurgadinb  ID:Not_Found -- Seneschal_Aldikar 
