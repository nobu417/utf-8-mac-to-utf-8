#! /usr/bin/perl -w
use strict;
use Text::Iconv;

my $filename = $ARGV[0];

open (FH, $filename);
my @lines = <FH>;
close (FH);

my $string = '';

foreach my $line (@lines) {
	$line = Text::Iconv->new('UTF-8-Mac', 'UTF-8')->convert($line);
	$string = $string . $line;
}

open (FH, ">$filename");
print FH $string;
close (FH);
