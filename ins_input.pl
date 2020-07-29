#!/usr/bin/perl
while(<>){
	if($_ =~ /\input\{\}){
		print $_;
	}
}
