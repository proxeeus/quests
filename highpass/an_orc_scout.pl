# NPC: ORC_WARRIOR
# Angelox

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("'Argg!!! This is now orc territory and all trespassers must DIE!!!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("Filthy $race\s like you must die!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("$race\s have no place in our realm!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("It's $race\s like you who have ruined your own lands, You'll not ruin mine!");
    }elsif(($combat_state == 1) &&($random_result<=100)){
    quest::say("For the glory of Zek!  Attack!!");}
}

sub EVENT_ATTACK
{quest::say("Argg!!! This is now orc territory and all trespassers must DIE!!!");}

sub EVENT_DEATH
{quest::say("You shall have all the Shralok Orcs on your tail for my death!");}

# HIGHPASS
