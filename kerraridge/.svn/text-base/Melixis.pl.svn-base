#zone - KerraRidge
#quest - Melixis
#Angelox 

sub EVENT_SAY {
  if ($text=~/hail/i){
    quest::emote("Looks up at you");
    quest::say("Melixis can sale you things");
    quest::say("Melixis lost her [ring]..");}
  elsif ($text=~/ring/i){
   quest::emote("Sadly looks at the floor");
   quest::say("Have ring long time, mother give to me. You [find]?");}
     elsif ($text=~/find/i){
   quest::emote("Looks at her empty finger");
   quest::say("Make Melixis happy, find ring. I give you something");}
}

sub EVENT_ITEM{
  if($itemcount{103} == 1) {
    quest::emote("beams with glee.");
    quest::say("Oh $name, you too kind. Take this for finding my ring.");
    quest::say("Thank you!");
     quest::ding(); quest::exp(25);
    if($class eq 'Warrior'){quest::summonitem(106);}
    elsif($class eq 'Cleric'){quest::summonitem(114);}
    elsif($class eq 'Ranger'){quest::summonitem(111);}
    elsif($class eq 'Paladin'){quest::summonitem(110);}
    elsif($class eq 'Shadowknight'){quest::summonitem(109);}
    elsif($class eq 'Druid'){quest::summonitem(115);}
    elsif($class eq 'Monk'){quest::summonitem(107);}
    elsif($class eq 'Bard'){quest::summonitem(113);}
    elsif($class eq 'Rogue'){quest::summonitem(108);}
    elsif($class eq 'Shaman'){quest::summonitem(116);}
    elsif($class eq 'Necromancer'){quest::summonitem(120);}
    elsif($class eq 'Wizard'){quest::summonitem(117);}
    elsif($class eq 'Magician'){quest::summonitem(118);}
    elsif($class eq 'Enchanter'){quest::summonitem(119);}
    elsif($class eq 'Beastlord'){quest::summonitem(112);}
    elsif($class eq 'Berserker'){quest::summonitem(121);}
  }
else {
quest::say("I have no use for this");
plugin::return_items(\%itemcount);}
}

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("The time has come for you to die!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("It is unwise of you to try that!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("How dare you attack me!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("The spirits will condem you!");
    }elsif($combat_state == 1){
    quest::say("I shall bathe in your blood!");}
}

sub EVENT_DEATH{
 quest::emote("'s corpse drops to the ground.");
 }

