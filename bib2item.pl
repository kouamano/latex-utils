#!/usr/bin/perl

$sep = ";";
while(<>){
	push(@bib,$_);
	$bib = join('',@bib);
	@bibarr = split('@',$bib);
	shift(@bibarr);
}
foreach(@bibarr){
	@item = split("\n",$_);
	$label = shift(@item);
	$label =~ s/.*?\{//;
	$label =~ s/,.*?//;
	$label = '\bibitem{'.$label.'}';
	print "$label\n";
	foreach(@item){
		$_ =~ s/^\s*//;
		$_ =~ s/\s*$//;
		@pair = split(/ *= */,$_);
		$kvs{lc($pair[0])}=$pair[1];
	}
	$au = $kvs{"author"};
	$au =~ s/^[{"]*//;
	$au =~ s/["},]*$//;
	print "$au$sep ";
	$ti = $kvs{"title"};
	$ti =~ s/^[{"]*//;
	$ti =~ s/["},]*$//;
	print "$ti$sep ";
	$ju = $kvs{"journal"};
	$ju =~ s/^[{"]*//;
	$ju =~ s/["},]*$//;
	if($ju ne ""){
		print "$ju ";
	}
	$vo = $kvs{"volume"};
	$vo =~ s/^[{"]*//;
	$vo =~ s/["},]*$//;
	if($vo ne ""){
		print "Vol.$vo ";
	}
	$no = $kvs{"number"};
	$no =~ s/^[{"]*//;
	$no =~ s/["},]*$//;
	if($no ne ""){
		print "No.$no ";
	}
	$pa = $kvs{"pages"};
	$pa =~ s/^[{"]*//;
	$pa =~ s/["},]*$//;
	if($pa ne ""){
		print "P.$pa ";
	}
	$ya = $kvs{"year"};
	$ya =~ s/^[{"]*//;
	$ya =~ s/["},]*$//;
	if($ya ne ""){
		print "$ya$sep ";
	}

	print "\n";
}

