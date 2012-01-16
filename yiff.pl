#!/usr/bin/perl
#murrrrrrrrr

use utf8;
use warnings;
use strict;

#-----------------------=[info]=----------------------#
# yiff.pl
# x-chat port by jakk
# irssi port by mike
# scripting by jakk, berry and mike
# includes yiffs from lol.pl, yiffscript, bukkakescript
# Dr. Dos, SquareMoogle, RooR, WB, LoliSquirrel, 7chan
#-----------------------------------------------------#

#-----------------------=[usage]=---------------------#
# /yiff <nick>
# yiffs a selected user
# /ryiff
# randomly chooses a user and yiffs them 
#-----------------------------------------------------#

my $VERSION = '5.0';

my %IRSSI = (
	authors     => 'jakk + madclown',
	contact     => 'jakk@m3n.biz / irc.xax.li # / http://m3n.biz/yiff.pl',
	name        => 'yiff.pl',
	description => 'lots of yiff scripts niggered together',
	license     => 'WTFPL',
	url         => 'http://m3n.biz',
	changed     => 'im gay',
);

my $yifffile = "yiffs.txt";
my $solofile = "solos.txt";

Irssi::command_bind("yiff", \&yiff);

sub yiff {
	my ($data, $server, $chan) = @_;
	if ($data) {
		my $target = $data;
		$target =~ s/\s*$//; $target =~ s/^\s*//;
		my @users = $chan->nicks();
		my $user = $users[rand (@users)]->{nick};
		my $nick = $server->{nick};
		my $channel = $chan->{name};
		if (open(YIFFFILE,"<",$yifffile)) {
			my @yiffs = <YIFFFILE>;
			close(YIFFFILE);
			my $yiff = $yiffs[rand @yiffs];
			$yiff =~ s/\$target/$target/g;
			$yiff =~ s/\$user/$user/g;
			$yiff =~ s/\$nick/$nick/g;
			$yiff =~ s/\$channel/$channel/g;
			$chan->command("me $yiff");
		}
	} else {
		my @users = $chan->nicks();
		my $user = $users[rand (@users)]->{nick};
		my $nick = $server->{nick};
		my $channel = $chan->{name};
		if (open(SOLOFILE,"<",$solofile)) {
			my @solos = <SOLOFILE>;
			close(SOLOFILE);
			my $yiff = $solos[rand @solos];
			$yiff =~ s/\$user/$user/g;
			$yiff =~ s/\$nick/$nick/g;
			$yiff =~ s/\$channel/$channel/g;
			$chan->command("me $yiff");
		}
	}
}

Irssi::command_bind("ryiff", \&ryiff);

sub ryiff {
	my ($data, $server, $chan) = @_;
	my @users = $chan->nicks();
	my $target = $users[rand (@users)]->{nick};
	my $user = $users[rand (@users)]->{nick};
	my $nick = $server->{nick};
	my $channel = $chan->{name};
	if (open(YIFFFILE,"<",$yifffile)) {
		my @yiffs = <YIFFFILE>;
		close(YIFFFILE);
		my $yiff = $yiffs[rand @yiffs];
		$yiff =~ s/\$target/$target/g;
		$yiff =~ s/\$user/$user/g;
		$yiff =~ s/\$nick/$nick/g;
		$yiff =~ s/\$channel/$channel/g;
		$chan->command("me $yiff");
	}
}
