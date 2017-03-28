# The Gnome Take
# by Proxeeus

sub EVENT_SAY{
	if($text=~/628/i) {
		quest::say("wiz... tik... 628...");
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 12164 => 1)) {
		quest::say("wiz... tik... 628...");
		quest::summonitem(12162);
	}

}