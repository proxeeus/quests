sub EVENT_SPAWN 
{
    my $class = $bot->GetClassName();
	my $level = $bot->GetLevel();
	my $name = $bot->GetName();
	$bot->OwnerMessage("Spawned your level $level $class bot.");
	$bot->ModifyNPCStat("runspeed", 1.5);
}