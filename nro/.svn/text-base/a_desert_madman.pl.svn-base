# NPC: a_desert_madman
# Angelox

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=35)){
    quest::say("Damn my eyes! You're just another mirage!");
    }elsif(($combat_state == 1) &&($random_result<=70)){
    quest::say("$race\s like you are better left dead than alive.");
    }elsif(($combat_state == 1) &&($random_result<=95)){
    quest::say("It's $race\s like you who have ruined your own lands, You'll not ruin mine!");}
}
sub EVENT_DEATH{
    my $random_result2 = int(rand(100));
    if($random_result2<=33)     {
      quest::say("Damn my eyes! I followed Angelox to the spectral abyss.");
        }
    elsif($random_result2<=66) {
      quest::say("Damn my ears! I followed Leslamarch to my doom. There is no Oasis here.");
        }
    elsif($random_result2>66)  {
      quest::say("Damn my black heart! How I wandered thirsty just to see Asram arisen.");
        }
  }
# OASIS
