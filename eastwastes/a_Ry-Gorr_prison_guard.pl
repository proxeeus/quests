sub EVENT_SIGNAL {
    quest::emote(" advances grimly on Corbin Blackwell and beats him until he collapses.");
}

sub EVENT_COMBAT {
    if ($combat_state == 1) {
        quest::say("Rygorr orcs kill in the snow!  We'll bash in your face and cut off your toe!!");
    }
}

