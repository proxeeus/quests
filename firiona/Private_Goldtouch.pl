#Private Blackbark
#Angelox

sub EVENT_COMBAT{
    quest::say("One less enemy of the realm.  The caretaker will be busy today");
}

sub EVENT_DEATH_COMPLETE {
    quest::say("You shall now be a wanted man... The Union of Vie shall punish you.");
}
# EOF zone: Firona Vie
