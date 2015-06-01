#use warnings;
$SUCCESS = "Success";
$ERROR = "Error";
$timestamp = "(\\d\\d\\d\\d-\\d\\d-\\d\\d \\d\\d:\\d\\d:\\d\\d,\\d\\d\\d)";

$num_args = $#ARGV + 1;
if ($num_args != 1) {
    print "\nUsage: hiveServer2logparser.pl <path to dir containing hiveserver2.log* >\n";
    exit;
}

$logdir = $ARGV[0];

$outfile = 'output.xls';
$failedqueries = 'failedqueries.sql';
$passedqueries = 'passedqueries.sql';

open $outfailed, ">$failedqueries" or die "Could not open $failedqueries: $!";
open $outpassed, ">$passedqueries" or die "Could not open $passedqueries: $!";

open $out, ">$outfile" or die "Could not open $outfile: $!";
print $out "Op Id\tStart\tEnd\tDuration (s)\tStatus\tError\tSql\n";


$cmdstarted=0;
$count=0;

@files = glob("$logdir/hiveserver2.log*");

    foreach my $logfile (@files) {

        print "Opening $logfile\n";
		open my $info, $logfile or die "Could not open $file: $!";

        while( my $line = <$info>)  {   
    
        	if ($line =~ /.*Initialization Done (\d+) OP/) {
        		$opid=$1;
        	} 
		
        	#op start seen
        	if ($cmdstarted==0 && $line =~ /$timestamp.*Starting command:\s*(.*)/) {
        		$cmdstarted=1;
        		$status=$SUCCESS;
        		$start_time=$1; 
        		$sql=$2;   
        	} 	

        	#this seems to be the correct catchall but doesn't give detailed exception
        	#if ($cmdstarted && $line =~ /$timestamp.*Error running hive query:/) {

        	#For now, list out error scenario to capture detailed exception error
        	if ($cmdstarted && $line =~ /$timestamp.*Failed to execute tez graph./){	
        		$errorseen=1; 
        		$status=$ERROR
        	} 		
        	if ($cmdstarted && $line =~ /$timestamp.*Failure while running task:.*/){	
		        $errorseen=1; 
        		$status=$ERROR
        	} 		
	
	
        	if ($cmdstarted && $line =~ /$timestamp.*<\/PERFLOG method=runTasks.*duration=(\d+) from=org.apache.hadoop.hive.ql.Driver>/) {
        		$duration=int($2)/1000;		
        	} 

        	#End of op seen
        	if ($cmdstarted && $line =~ /$timestamp.* - (\d+) finished. closing.../) {
        		$cmdstarted=0;
        		$end_time=$1; 					
		
        		$trimmed_sql = trim($sql);
        		$trimmed_error = trim($error);
		
        		print "Found sql $opid: took $duration seconds and status was: $status\n";    

        		print $out "$opid\t$start_time\t$end_time\t$duration\t$status\t$trimmed_error\t$trimmed_sql\n";
		
        		#write out sql to appropriate file
        		if ($status eq $SUCCESS){
        			$filetowriteto = $outpassed;					
        		}
        		else{
        			$filetowriteto = $outfailed;		
        		}
			
        		print $filetowriteto "-- id: $opid"."\r\n";			
        		print $filetowriteto "$sql"."\r\n";		
        		print $filetowriteto ";"."\r\n\r\n\r\n\r\n";
						
        		$count++; 						
        		#reset tracking globals
        		$sql="";
	        	$opid="";
        		$error="";
	        	$errorseen=0;
		
        	} 
	
        	#ignore other lines starting with timestamp for now
        	if ($cmdstarted && $line =~ /^$timestamp.*/) {
        		;
        	} 

        	elsif ($errorseen) {
        		$error = "$error $line";
        	} 	
		
        	elsif ($cmdstarted) {
        		$sql = "$sql $line";
        	} 			

        }


    }
    

close $info;
close $out;
close $outpassed;
close $outfailed;

print "Done! Found $count queries and wrote summary to output.xls, passedqueries.sql and failedqueries.sql\n";


sub trim {
	local $str = shift;
	$str =~ s/\r\n/\n/g;
	$str =~ s/\n/ /g;		
	$str =~ s/\s+/ /g;		

	return $str;
}