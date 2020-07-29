#!/usr/bin/perl
while(<>){
	$file = '';
	if($_ =~ /^\\input\{(.*?)\}/){
		$file = $1;
		$s=~/()/;
		system("cat $file");
	}else{
		print $_;
	}
}
