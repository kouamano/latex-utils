#!/usr/bin/perl
while(<>){
	$file = '';
	if($_ =~ /^\s*\\input\{(.*?)\}/){
		$file = $1;
		$s=~/()/;
		system("cat $file");
	}else{
		print $_;
	}
}
