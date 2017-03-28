#Drops-Hints for where to play
#Angelox
#NPC: Band the Ranger

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER
{
my $random_result = int(rand(100));
my $random_result2 = int(rand(100));
$npc->SetAppearance(1);
if($random_result2<=40){
    if($random_result<=10){
    quest::say("There was a time when I camped in [Najena] for the Journeymans Boots...");
    }elsif($random_result<=20){
    quest::say("The [Fishbone] earring was my first item for underwater breathing");
    }elsif($random_result<=30){
    quest::say("Once I saw a mini-dragon living in a small pool while in The [Warrens]");
    }elsif($random_result<=40){
    quest::say("South Karana is one of my favorite hunting grounds, I got my first decent [bow] there");
    }elsif($random_result<=50){
    quest::say("Once we camped some [Ogres] in West Karana...");
    }elsif($random_result<=60){
    quest::say("I found the strangest item while hunting in [Everfrost]");
    }elsif($random_result<=70){
    quest::say("I once found an entrance to to some [caverns] by the Ry'Gorr fort in Eastern Wastes.");
    }elsif($random_result<=80){
    quest::say("I remember the time we camped for the Tserrina's Robe  in [ToFS].");
    }elsif($random_result<=90){
    quest::say("Ever been to [Dagnor's Cauldron]?");
    }else{
    quest::say("Don't let the [night] catch you in Lake Rathe!");
    }
  }
    if(($ulevel <= 3) && ($random_result2 >= 45)){
    quest::say("$name! Have you gotten your first bot (helper NPC) yet? Turn around and head back into the city, use your FIND button and look for Aediles Thrall. He will want to speak with you, He'll help you setup your Bots.");}
    if(($ulevel <= 5) && ($random_result2 >= 60)){
    quest::say("If you wish to travel to Shadeweaver's [Thicket], I can help you.");}
}

sub EVENT_EXIT
{
my $random_result = int(rand(100));
my $random_result2 = int(rand(100));
$npc->SetAppearance(1);
if($random_result2<=40){
    if($random_result<=10){
    quest::say("2:00 am in [Oot] is witching hour, you better not be there if you're not ready!");
    }elsif($random_result<=20){
    quest::say("The Pirates of [Gunthak] bore many treasures");
    }elsif($random_result<=30){
    quest::say("Did I tell you how I made [friends] with the frog people?");
    }elsif($random_result<=40){
    quest::say("Funny thing I noticed about the Temple of [Droga], when I went there after I was level 45, all the monsters had changed, and the loots were new!");
    }elsif($random_result<=50){
    quest::say("Have you found the new caves in [Toxxulia] Forest yet? ");
    }elsif($random_result<=60){
    quest::say("I found the strangest item while hunting in [Everfrost]");
    }elsif($random_result<=70){
    quest::say("I once found an entrance to to some [caverns] by the Ry'Gorr fort in Eastern Wastes.");
    }elsif($random_result<=80){
    quest::say("Lockjaw wasn't the only monster [croc] I found while exploring the Oasis.");
    }elsif($random_result<=90){
    quest::say("Did I tell you about the lady's [nightmare]?");
    }else{
    quest::say("Don't let the [night] catch you in Lake Rathe!");}
  }
}
sub EVENT_SAY {
my $random_result = int(rand(100));
$npc->SetAppearance(0);
if($text=~/Hail/i){
quest::say("Well met $name, I have [traveled] many lands, seen many things, if you're interested, I can tell you of them.");
quest::say("Feel free to ask me of my [travels] many times, as I carry much informations");
quest::say("I also have some Ranger [buffs]");}
    if(($text=~/travel/i) &&($random_result<=10)){
    quest::say("There was a time when I camped in [Najena] for the Journeymans Boots...");
      }elsif($text=~/Najena/i){
      quest::say("Aye Najenas dungeon, her and her [minions] can put up an interesting fight.");
        }elsif($text=~/minions/i){
         quest::say("Drelzna is who has the Jboots, but you will need to find the [key] to her room.");
          }elsif($text=~/key/i){
          quest::say("You need three keys to get there, Rathyl holds the one you need...");
    }elsif(($text=~/travel/i) &&($random_result<=20)){
    quest::say("The [Fishbone] earring was my first item for underwater breathing");
      }elsif($text=~/Fishbone/i){
      quest::say("I found mine on a barbarian that lives by a lake in Qeynos Hills");
    }elsif(($text=~/travel/i) &&($random_result<=30)){
    quest::say("Once I saw a mini-dragon living in a small pool while in The [Warrens]");
      }elsif($text=~/Warrens/i){
      quest::say("His name is Muglwump, and he's a Shaman with an attitude. You can get to Warrens via Paineel"); #
    }elsif(($text=~/travel/i) &&($random_result<=40)){
    quest::say("South Karana is one of my favorite hunting grounds, I got my first decent [bow] there");
        }elsif($text=~/bow/i){
         quest::say("An angry centaur goes by the name of Coloth Meadowgreen had that bow, but beware of The [Fabled] Coloth! he is much stronger.");
          }elsif($text=~/Fabled/i){
          quest::say("Aye, Fabled with a Fabled Bow! He's not the [only] Fabled minion in South Karana ...");
           }elsif($text=~/only/i){
           quest::say("Well, there's also the Fabled [Quillmane] and the Fabled Grizzleknot");
            }elsif($text=~/Quillmane/i){
            quest::say("Quilmane is the prettiest horse in the game, he is a legend of his time.  ");
    }elsif(($text=~/travel/i) &&($random_result<=50)){
    quest::say("Once we camped some [Ogres] in West Karana...");
      }elsif($text=~/Ogres/i){
      quest::say("Aye, Ogres - they were nice to us tell we started killing them, specially [Chief Goonda].");
       }elsif($text=~/Chief Goonda/i){
       quest::say("He gets real ornary when he gets mad, and the Fabled Chief is worse than him!");
    }elsif(($text=~/travel/i) &&($random_result<=60)){
    quest::say("I found the strangest item while hunting in [Everfrost]");
      }elsif($text=~/Everfrost/i){
      quest::say("Aye, it was at some gobbie camps on my way to the frozen river - helped lighten my load.");
    }elsif(($text=~/travel/i) &&($random_result<=70)){
    quest::say("I once found an entrance to to some [caverns] by the Ry'Gorr fort in Eastern Wastes.");
      }elsif($text=~/caverns/i){
      quest::say("They are known as Crystal Caverns,  The citizens of Froststone still have a small outpost in there. There's crystal spiders, geonids, stalag terrors, and more... "); #
    }elsif(($text=~/travel/i) &&($random_result<=80)){
    quest::say("I remember the time we camped for the Tserrina's Robe  in [ToFS].");
      }elsif($text=~/ToFS/i){
      quest::say("Aye, Tower of Frozen Shadow, you can find it in Iceclad. Tserrina Syl'Tor and her minions live there, and it is infested with undead, vampires, and more.  "); #
    }elsif(($text=~/travel/i) &&($random_result<=90)){
    quest::say("Ever been to [Dagnor's Cauldron]?");
      }elsif($text=~/Dagnor's Cauldron/i){
      quest::say("Strange place that is, over run by aqua goblins, mean little critters. There's one that carries a [prize] ");
       }elsif($text=~/prize/i){
       quest::say("His name is Bilge Farfathom; kill the gobbies in the camp, and you'll find him.");
    }elsif($text=~/travel/i){
    quest::say("Don't let the [night] catch you in Lake Rathe!");
     }elsif($text=~/nightmare/i){
     quest::say("Aye, she has a terrible fear of snakes - woke up one morning shaking all over, told me she dreamed of a giant rattle snake whose name is 'Craven', roamed the commonlands near Freeport, attacking anyone it saw.");
     }elsif($text=~/night/i){
     quest::say("Aye, night time brings out the undead, I seen that in [Kithicor] too - even seen werewolves in other places");
      }elsif($text=~/Kithicor/i){
      quest::say("Aye, a tame forest in daylight; be wary when night falls..");
    }elsif ($text=~/gunthak/i) {
      quest::say("Aye, Gunthak, Dulak, Nadox, Torgiran, a world of [pirates] and [treasure] ... ");
 	 }elsif ($text=~/pirates/i) {
  	   quest::say("There are many evil pirates there, nasty place to be. You can get there by running though Paineels Warrens, then Stonbrunt, the entrance is at an old Pirate ship by the water.");
  	 }elsif ($text=~/treasure/i) {
  	   quest::say("Many riches those pirates carry, you could attain an impressive status if you weren't killed first");
     }elsif($text=~/OoT/i){
     quest::say("Aye, night time brings out the undead, People turn into wolves and the [Skeletons] are everywhere");
  	 }elsif ($text=~/Skeletons/i) {
  	   quest::say("Aye, Captain Kidd is one of them, and he's the meanest of them all - stay away from the pier when you see the Ghost Ship coming, Captain Kidd is riding it.");
     }elsif($text=~/friends/i){
     quest::say("I met a frog in a town at Swamp of no Hope, his name is 'Exterminator Talern', and he collects mosquito wings. The more I gave him, the more he liked me - then one day I was in Sebilis; The frogs there liked me too! ");
     }elsif($text=~/Droga/i){
     quest::say("Aye, I saw  the same think happen in Nurga and Cazic-Thule too.");
     }elsif($text=~/tox/i){
     quest::say("They are both near the entrance to Kerra Ridge; one leads to Hollowshade Moore, the other Mines of Glooming Deep.");
     }elsif($text=~/croc/i){
     quest::say("While I was exploring the Oasis of Marr, I spotted an alligator with an unfamiliar name. It was 'Quagmire'.");
     }elsif($text=~/buff/i){
     quest::say("Good hunting!");
     $npc->CastSpell(269,$userid);
     }elsif(($text=~/Moonstone/i) && ($zoneid == 165)){
     quest::say("I see you made it to [Shadeweaver]...");
     }elsif(($text=~/Shadeweaver/i) && ($zoneid == 165)){
     quest::say("I possess another Moonstone that will transport you out of this [moon] in an instant. ");
     }elsif($text=~/Thicket/i){
     quest::say("I possess a legendary [Moonstone] that will transport you to Shadeweaver. ");
     }elsif($text=~/Moonstone/i){
     quest::say("I can grant you this Moonstone, but I need to be [sure] you have learned the way of the sword.");
     }elsif($text=~/sure/i){
     quest::say("Bring me four pieces of cloth armor of any type as proof of your abilities, and I will grant you the Moonstone.");
     }elsif(($text=~/moon/i) && ($zoneid == 165)){
     quest::say("Bring me four pieces of dingy armor of any type, and I will grant you this Moonstone of the [Wind].");
     }elsif(($text=~/wind/i) && ($zoneid == 165)){
     quest::say("Aye, Moonstone of the Wind! Fastest moonstone in Norrath, also great to have when trying to escape a dire situation");
  }
}

sub EVENT_ITEM {
my @itemz = (1000 .. 1036,30670 .. 30680,94000,94001,10152,42984);
my $total = 0;
foreach $xitem (@itemz) {
 $total += $itemcount{$xitem};
 };
if (($total >= 4) && ($zoneid == 165)) {
 quest::say("Thank you $name! Here is your Moonstone of the Wind.");
 $client->Message(6,"You received the Moonstone of the Wind!");
 quest::summonitem(139);
 return;
 };
if ($total >= 4) {
 quest::say("Thank you $name! Here is your Moonstone to Shadeweaver's Thicket.");
 $client->Message(6,"You received the Moonstone of the Shadeweaver!");
 quest::summonitem(138);
 return;
 };
my $owner = $npc->GetOwnerID();
if ($owner > 0) {
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
