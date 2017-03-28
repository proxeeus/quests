#npc - KerraRidge Guard Protectors
#zone - KerraRidge
#by Angelox

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Well met $name!");
  quest::say("Godspeed!");
 }
}

sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("Now feel the wrath of my sword!!");
   quest::say("For the protection of all Kerranians!");
   quest::say("This town will be a safer place now that we are here!");
   }
}
sub EVENT_ATTACK {
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("Another corpse for the caretaker ...");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("You fool!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("Let me polish my sword with your skin!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("Your death will come quickly!");
    }elsif($combat_state == 1){
    quest::say("Halt! who enters here?");}
   }

