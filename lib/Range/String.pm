=head1 NAME

Range::String - Set arithemtics.

=cut
package Range::String;

=head1 VERSION

This documentation describes version 0.01

=cut
use version;      our $VERSION = qv( 0.01 );

use base Range::String::Parse;
use base Range::String::Object;

use warnings;
use strict;

=head1 SYNOPOSIS

 use Range::String;

 my @list = Range::String->expand( 'abc001', 'abc002~abc013' );
 my $string = Range::String->serial( 'abc001~13' );

 my $r1 = Range::String->new( 'abc001', 'abc002~abc013' );
 my $r2 = Range::String->new( 'bcd003', 'abc008' );
 my $r3 = $r1 + $r2;
 my $r4 = $r1 - $r2;
 my $r5 = $r1 & $r2;

 $r5 &= $r1;

 print $r5, "\n";

=head1 DESCRIPTION

=head2 string()

Overloads B<"">.

=cut

use overload '""' => \&string;

=head1 DESCRIPTION

=head2 string()

Overloads B<"">.

=cut
sub string
{
    my ( $this ) = @_;
    Range::String::Object::string( $this, $this->symbol() );
}

=head1 SEE ALSO

Implements Range::String::Object and Range::String::Parse.
See Range::String::Object for additional methods.

=cut

1;

__END__

=head1 AUTHOR

Kan Liu

=head1 COPYRIGHT and LICENSE

Copyright (c) 2010. Kan Liu

This program is free software; you may redistribute it and/or modify
it under the same terms as Perl itself.

=cut
