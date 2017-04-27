sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say('Do you know who I am?!! I am the Commander of the Qeynos Guard!! Do you think I trod through these sewers to speak with you? If so then you are quite mistaken.');
  }
  if($text=~/nerissa/i) {
    quest::say('You keep you eyes off that sweet innocent girl. She is under my care.');
  }
  if($text=~/milea/i) {
    quest::say('Milea Clothspinner is an old flame of mine. She would have made a fine wife. Unfortunately for me, she chose to become a fine warrior.');
  }
  if($text=~/i am a bloodsaber/i) {
    quest::say('Bloodsabers!!? You must be new. Your shrine serves me well. You shall all be rewarded once I rule. No doubt you have not come to waste the time of the future emperor. Are you seeking [new information]?');
  }
  if($text=~/new information/i) {
    quest::say('I have gotten word from Guard McCluskey that the young knights from the Temple of Life and the Hall of Thunder have been holding contests to see who is the fleetest. Every so often they shall send a young knight to run the paths of the Plains of Karana and back. Lone, young knights are fodder for experienced Bloodsabers.');
  }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}