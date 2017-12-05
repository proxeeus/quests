# TODO: text classic?

sub EVENT_SAY
{ 
    if($text=~/Hail/i)
    {
      quest::say("Yes, yes, yes.  Hail to you, too, $name.  Now, quit bugging me!"); 
    }
}

sub EVENT_ITEM
{ 
    # A tattered note ID-18855
    if($itemcount{18855} == 1)
    {
        quest::say("Take this to help you on your journeys.");
        # Dirty Torn Robe ID-13564
        quest::summonitem("13564");
        quest::ding(); quest::exp("50");
    }
}

#END of FILE Zone:freporte  ID:10121 -- Heneva_Jexsped


