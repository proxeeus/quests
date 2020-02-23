#this quest needs to remain ID based because it only applies to this
#specific version of the mob, there are several with this name

# A skeleton Worker, Overthere
# This one is indiff to everyone, other ones around are RTA.
# give hime : spectacles, forsaken pariah mask, Evergreen Ivy Ringband, Green Death Rum
# Necro skull cap 5, returns A metal key, you have to give it to Tin Banker Assistant

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12848 => 1, 12850 => 1, 12851 => 1, 12610 => 1)) {
    if ($ulevel > 20) {
      quest::summonitem(12849); # Item: Metal Key
		quest::exp(500);
		quest::ding();
		quest::emote("takes your hand and guides it into his ribcage. You feel something odd. It is a metal key!!");
    }
  }
  elsif (plugin::check_handin(\%itemcount, 12848 => 1)) {
    quest::emote("stops working and begins to open his creaking jaw.");
    quest::say("I live to study and quench my thirst. I live to Bash the Faces of Pariah and entangle myself in the ivy of evergreen. I live. I want to remember.");
    quest::summonitem(12848); # Item: Spectacle
	quest::exp(500);
	quest::ding();
  }
  plugin::return_items(\%itemcount);
}
