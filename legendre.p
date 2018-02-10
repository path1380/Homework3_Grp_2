#!/usr/apps/bin/perl
#
# perl program to try the approximation of various functions
# in an L2 sense.
# run with : perl legendre.p
#
#
# Here is the generic file
$cmdFile="./InputControl.Template.f90";
$outFile="./InputControl.f90";
$cmdFile2="./main.Template.f90";
$outFile2="./main.f90";

# Functions to test

@array_f = ("exp( ((grd_pts-2.0_dp)**2.0_dp)/2.0_dp)", "1 + grd_pts", "sin(grd_pts)");
@array_num_grdpts = ("3", "5", "3");
@array_num_intervals = ("2", "4", "2");
@array_degrees = ("(/12, 12/)", "(/12,12,12,12/)", "(/12, 12/)");
@array_grdpts = ("(/0.0_dp, 0.3_dp, 1.0_dp/)", "(/0.0_dp, 0.3_dp, 1.0_dp, 2.0_dp, 2.2_dp/)", "(/0.0_dp, 0.3_dp, 1.0_dp/)");
@array_num_subsamples = ("15", "15", "15");

for( $m = 0; $m < 3; $m = $m+1){
    # Open the Template file and the output file.
    open(FILE,"$cmdFile") || die "cannot open file $cmdFile!" ;
    open(OUTFILE,"> $outFile") || die "cannot open file!" ;

    # Setup the outfile based on the template
    # read one line at a time.
    while( $line = <FILE> )
    {
    # Replace the the stings by using substitution
    # s
    $line =~ s/\bFFFF\b/$array_f[$m]/;
    $line =~ s/\bIIII\b/$array_num_intervals[$m]/;
    $line =~ s/\bDDDD\b/$array_degrees[$m]/;
    $line =~ s/\bNNNN\b/$array_num_grdpts[$m]/;
    $line =~ s/\bPPPP\b/$array_grdpts[$m]/;

    print OUTFILE $line;
        # You can always print to secreen to see what is happening.
        # print $line;
    }
    # Close the files
    close( OUTFILE );
    close( FILE );

    open(FILE,"$cmdFile2") || die "cannot open file $cmdFile!" ;
    open(OUTFILE,"> $outFile2") || die "cannot open file!" ;

    # Setup the outfile based on the template
    # read one line at a time.
    while( $line = <FILE> )
    {
    # Replace the the stings by using substitution
    # s
    $line =~ s/\bGGGG\b/$array_num_grdpts[$m]/;
    $line =~ s/\bNNNN\b/$array_num_subsamples[$m]/;

    print OUTFILE $line;
        # You can always print to secreen to see what is happening.
        # print $line;
    }
    # Close the files
    close( OUTFILE );
    close( FILE );

    # # Run the shell commands to compile and run the program
    system("make -f Makefile_main");
    # #system("./a.out > tmp.txt");

     open(FILE,"output.txt") || die "cannot open file" ;
    # # Setup the outfile based on the template
    # # read one line at a time.
     while( $line = <FILE> )
     {
    # # Replace the the stings by using substitution
    # # s
     $line =~ s/\s+/ , /g;
     $line =~ s/ , $/ /;
     $line =~ s/^ , / /;
     $line =  $line . "\n";
     print $line;
    # }
     close( FILE );
     system("make -f Makefile_main clean");

}
rename("output.txt", "output" . $m . ".txt") || die ( "Error in renaming" );
}
exit
