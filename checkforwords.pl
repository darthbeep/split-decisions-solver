use strict;
use warnings;


sub get_list_of_words {

    my ($before, $after, $p1, $p2) = @_;
    my $filename = 'words_alpha.txt';

    my $alldata = slurp($filename);
    #print "$alldata";

    open(my $fh, '<:encoding(UTF-8)', $filename)
        or die "could not find $filename" ;
    open(my $sfh, '<:encoding(UTF-8)', $filename)
        or die "could not find $filename" ;
    while (my $row = <$fh>) {
        chomp $row;
        my $rs = "^(.{$before})$p1(.{$after})\$";
        if ($row =~ $rs) {
            my $comp1 = $1;
            my $comp2 = $2;
            my $oldreg = "$comp1" . "$p1" . "$comp2";
            my $newreg = "$comp1" . "$p2" . "$comp2";
            #print "$newreg\n";
            if ($alldata =~ $newreg) {
                my $answer = "$newreg ". " $oldreg";
                print "$newreg\n";
                #print "$oldreg\n";
            }
        }
    }
}

sub slurp {
    my $file = shift;
    open my $fh, '<', $file or die;
    local $/ = undef;
    my $cont = <$fh>;
    close $fh;
    return $cont;
}
get_list_of_words(1, 5, "at", "ib");
