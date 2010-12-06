=head1 NAME

Range::Integer - Integer set arithmetics.

=cut
package Range::Integer;

use base Range::Integer::Parse;
use base Range::Integer::Object;

=head1 VERSION

This documentation describes version 0.01

=cut
use version;     our $VERSION = qv( 0.01 );

use warnings;
use strict;

use overload '""' => \&string;

=head1 SYNOPOSIS

 use Range::Integer;

 my @list = Range::Integer->expand( '3,4~9,-6~7,&6~10' );
 my $string = Range::Integer->serial( '3', '6', '7~9' );

 my $r1 = Range::Integer->new( '3', '6', '7~9' );
 my $r2 = Range::Integer->new( '3,6~7' );
 my $r3 = Range::Integer->new( '3,4~9,-6~7,&6~10' );

 my $r4 = $r2 - $r3;
 my $r5 = $r2 + $r3;
 my @r5 = $r5->list();

 $r5 &= $r1;

 print $r5, "\n";

=head1 DESCRIPTION

=head2 string()

Overloads B<"">.

=cut
sub string
{
    my ( $this ) = @_;
    Range::Integer::Object::string( $this, $this->symbol() );
}

=head1 SEE ALSO

Implements Range::Integer::Object and Range::Integer::Parse.
See Range::Integer::Object for additional methods.

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
