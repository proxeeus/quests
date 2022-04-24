# 7th floor shrouded bats can sometimes spawn Tserrina.
sub EVENT_DEATH_COMPLETE
{
	my $random_result = int(rand(100));
	
	if($random_result<16)
	{
	  quest::unique_spawn(111154,0,0,7.25,843.23,306.0, 255);
	  quest::delglobal("Tserr");
	  quest::setglobal("Tserr",3,3,"F");
	  $Tserr=undef;
	}
}