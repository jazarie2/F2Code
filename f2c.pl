use XML::Simple ;# qw(:strict);
use Data::Dumper;
use HTML::Entities;


$Input = @ARGV[0];
#@ObjectTypes - For Collecting Information regarding all object types used
#@Nodes - for Collecting all the nodes needed

#$Output = @ARGV[1];
#@option =  (ForceArray => [ "HeartbeatTimeoutInSeconds","TestType","TimeoutInSeconds","Version","InitialWaitForStartInSeconds","TypeName","AssemblyName","Configuration","Status"], ValueAttr => [ ],KeyAttr=>[]);
#@Console[$ShapeID] 

$xml = new XML::Simple;
$Source = $xml->XMLin($Input);#,@option);

#Collecting All Master Shapes into @ObjectTypes
while($Source->{Masters}->{Master}->[-1] != NULL){	$id = $Source->{Masters}->{Master}->[-1]->{ID};	$name 	= $Source->{Masters}->{Master}->[-1]->{NameU};		@ObjectTypes[$id] = $Source->{Masters}->{Master}[-1];	delete ($Source->{Masters}->{Master}->[-1]);}


$all=$Source->{Pages}->{Page}->{Shapes}->{Shape};
while($all->[-1] != NULL)
{
	
	$id = $all->[-1]->{ID};
	@Shapes[$id] = $all->[-1];
	
	$Master = (@ObjectTypes[@Shapes[$id]->{Master}]);	
	if($Master->{NameU} =~ /Console/)
	{
	print ("[console]");
	}	
	elsif ($Master->{NameU} =~ /Winform/)
	{
	print ("[winform]");
	}
	
	delete $all->[-1];
}


# foreach(@Shapes)
# {
# $Master = (@ObjectTypes[$_->{Master}]);
# if($Master->{NameU} =~ /Console/)
# {
# print Dumper($Master->{NameU});
# }

# }





# $all = $data->{TestIterations}->{TestIteration};
# $ctr=0;
# while($all->[-1] != NULL)
# {
	# if($all->[-1]->{Result} =~ /Failed/)
	# {
		# @failed[$ctr] = $all->[-1]->{Test};
		# $ctr++;		
	# }
	# delete $all->[-1];
# }

 # delete($x->{TestLists}->{TestList}->{Tests});

 # $ctr=0;
 # print Dumper(@failed);
 
 
 # foreach(@failed)
 # {
	 
	 # $x->{TestLists}->{TestList}->{Tests}->{Test}->[$ctr] = $_;
	 # $ctr++;
 # }
 
 
 # my $xs  = XML::Simple->new(@option);
 # my $xml = $xs->XMLout($x);
 # $xml =~ s/\<PlatformSettings\>\<\/PlatformSettings\>//g;
 # $xml =~ s/\<TestLists\>\<\/TestLists\>//g;
 # $xml =~ s/\<FileCache\>\<\/FileCache\>/\<FileCache \/\>/g;
 # $xml =~ s/\<AutomationFlows\>\<\/AutomationFlows\>/\<AutomationFlows \/\>/g;
 
 # $xml =~ s/\<opt/<AutomationRunDatabase/g;
 # $xml =~ s/opt\>/AutomationRunDatabase\>/g;
 
 
  # $xml =~ s/\<Algorithm>/\<TestLists \/\>\<PlatformSettings \/\>\<Algorithm\>/g;

 # $xml =~ s/\&quot\;/\"/g;

 
 # $OUT = @ARGV[0];
 # open (MYFILE, ">$OUT");
 # print  MYFILE $xml;
 # close (MYFILE); 
  