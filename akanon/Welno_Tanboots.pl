sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18776)) {
    $client->Message(15, "A voice echoes throughout the room as you take in your surroundings. 'Hey you! This is Welno Tanboots. Remember me? Read the note in your inventory and then hand it to me. Hurry up! We don't have all day! You owe me a lot of money!'");
  }
}

sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Greetings there $name! I am Welno Tanboots, Assassin of Ak'anon. I pride myself on being one of the few to train our younger prospects in the ways of the rogue. If you are a young gnome rogue in training then I might have some [tasks] for you.");
  }
  elsif($text=~/tasks/i){
    quest::say("Well I should hope you are truly a Rogue of Ak'anon or else I dont have any work for ya! However if you are then I have some things for you to do. I will present you with a magical box that you will use to craft together certain components that will make an armor material. You will then take the material that you have fashioned with the proper pattern to the forge to create your own armor. I will provide you with whatever patterns are necessary along with the armor [recipes] should you so ask.");
  }
  elsif($text=~/recipes/i){
    quest::say("I have the armor recipes for all pieces of Chainmail of the Shadowwalker all you must do is simply ask for whichever piece you want to craft. I can provide you with the recipe for Shadowwalker [Coifs], [Bracers], [Sleeves], [Boots], [Leggings], [Gloves] and [Tunic]. Once you have collected the necessary components for each recipe combine them in this box to fashion the correct material.");
    quest::summonitem(17254); # Welnos Assembly Kit
  }
  elsif($text=~/boots/i){
    quest::say("There are many things in the Steamfont Mountains that I am sure you don't want to step in $name. To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Yellow Reculse Silk, 2 Spiderling Eyes and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Boots.");
    quest::summonitem(19634); # Crude Boot Mold
  }
  elsif($text=~/bracers/i){
    quest::say("A pair of these here bracers will be a great addition to your armor set there $name. To create your bracer material you will need to combine 1 Brick of Crude Bronze, 1 Runaway Clockwork Motor, 1 Infected Rat Liver and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Bracer.");
    quest::summonitem(19632); # Crude Bracer Mold
  }
  elsif($text=~/coifs/i){
    quest::say("While you should usually be using the shadows to your advantage should you need to face your opponent having a good coif will greatly increase your chances of survival. To create your coif material you will need to combine 2 Bricks of Crude Bronze, 1 Rat Meat, 1 Grikbar Kobold Fur and 1 Throwing Knife in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Coif.");
    quest::summonitem(19631); # Crude Helm Mold
  }
  elsif($text=~/gloves/i){
    quest::say("Well you sure cant pick someones pocket with a broken hand now can you? I agree that gloves would be a great armor piece for you to craft. To create your glove material you will need to combine 3 Bricks of Crude Bronze, 1 Yellow Reculse Silk, 1 Brownie Leg , and 2 Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Gloves.");
    quest::summonitem(19633); # Crude Gauntlets Mold
  }
  elsif($text=~/leggings/i){
    quest::say("What do you think you are doing running around here with no pants on! To create your leggings material you will need to combine 4 Bricks of Crude Bronze, 1 Kobold Tooth, 1 Plague Rat Tail, 1 Bottle and the Torn Cloak of Faerron in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Leggings.");
    quest::summonitem(19636); # Crude Greaves Mold
  }
  elsif($text=~/sleeves/i){
    quest::say("Having the proper sleeves will definitely be to your advantage when in a heated battle. To create your sleeves material you will need to combine 2 Bricks of Crude Bronze, 2 Brownie Brains and 1 Young Ebon Drake Wing in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Sleeves.");
    quest::summonitem(19635); # Crude Vambrace Mold
  }
  elsif($text=~/tunic/i){
    quest::say("I'm glad to see that you have progressed this far in your training and that you are ready to craft your final armor piece. To create your tunic material you will need to combine 5 Bricks of Crude Bronze, 1 Minotaur Scalp, 1 Brownie Parts, 1 Runaway Clockwork Motor, 1 Swirling Mist and the evil Dirolensab`s Bracer in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Tunic. When you are finished with your tunic please come back to see me as I have a [favor] to ask of you.");
    quest::summonitem(19637); # Crude Breastplate Mold
  }
  elsif($text=~/favor/i){
    quest::say("Well you see I have been working on constructing some new daggers for all new rogues but I am in need of a few items to make my first prototype. If you were able to collect the rare items I am in need of to make this dagger I would be happy to give you the first I make should I be able to create it. Will you [collect] these rare items for me?");
  }
  elsif($text=~/collect/i){
    quest::say("Excellent, please seek out 2 Minotaur Scalps and 2 Mountain Lion Jawbones and return to me with them when you are done.");
  }
  elsif($text=~/trades/i){
	quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
	quest::summonitem(51121);
  }
  elsif($text=~/second book/i){
	quest::say("Here is the second volume of the book you requested, may it serve you well!");
	quest::summonitem(51122);
  }
}

sub EVENT_ITEM {
  # Minotaur Scalp, Mountain Lion Jawbone
  if(plugin::check_handin(\%itemcount, 9108 => 2, 9109 => 2)){
    quest::say("A most fine job, $name! Here is that dagger I promised you. May you use it wisely. And...stay in the shadows.");
    quest::summonitem(9110); # Gemmed Shadowwalkers Dagger
  }
  # Newbie guild note
  elsif(plugin::check_handin(\%itemcount, 18776 => 1)){
	quest::say("Yes, I just knew you'd see it my way, $name. Anyway, welcome to our little part of Ak'Anon's underworld. We have to pay a high price to keep our small orgainzation hidden, which keeps us all busy around here. Now throw this on, and let's put you to work. Once you are ready to begin your training please make sure that you come back to see me after collecting your initial supplies! I have many things to teach you that you would benefit from, from furthering your knowledge of our arts, to the various [trades] you will have available to you.");
	quest::summonitem(13519); # Scruffed Tunic
	quest::faction(240,10);
	quest::faction(288,10);
	quest::faction(255,10);
	quest::faction(238,10);
	quest::ding(); 
    quest::exp(1000);
  }
else
    {
     quest::say("I have no use for these $name.");
     plugin::return_items(\%itemcount);
    }
     #do all other handins first with plugin, then let it do disciplines
     plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
     plugin::return_items(\%itemcount);     
}


# SQL has been submitted 
