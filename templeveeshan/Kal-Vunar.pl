# link aaryonar and guards
#

#sub EVENT_AGGRO {
#  my $guard1 = $entity_list->GetMobByNpcTypeID(124012); #nir`tan
 # my $guard2 = $entity_list->GetMobByNpcTypeID(124010); #aaryonar
 # if ($guard1) {
#    my $call_guard1 = $guard1->CastToNPC();
#    $call_guard1->AddToHateList($client, 1);
#  }
 # if ($guard2) {
 #   my $call_guard2 = $guard2->CastToNPC();
 #   $call_guard2->AddToHateList($client, 1);
 # }
#}

# EOF zone: templeveeshan ID: 124016 NPC: Kal-Vunar

sub EVENT_COMBAT
{
    if($combat_state == 1)
    {
        quest::emote("lets out a piercing roar as it charges!");
    }
}