# 3 corners spawn1
# EOF zone: frontiermtns
# NW corner mob
# Angelox

sub EVENT_DEATH_COMPLETE
{
my $a = quest::ChooseRandom(92182,92015,92186); # blugtugin, goblin raider,goblin herbcollector
#quest::say("Spawning SE corner mob");
quest::spawn2($a,248,0,-612,-2830,-478.75,244);
}
