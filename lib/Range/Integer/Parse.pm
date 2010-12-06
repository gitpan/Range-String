=head1 NAME

Range::Integer::Parse - Implements Range::Interface::Parse.

=cut
package Range::Integer::Parse;

use base Range::Interface::Parse;

=head1 VERSION

This documentation describes version 0.01

=cut
use version;      our $VERSION = qv( 0.01 );

use warnings;
use strict;

use Range::Integer::Object;

=head1 DESCRIPTION

=head2 OBJECT

A even sized ARRAY containing boundary values of contiguous elements,
in ascending order.

e.g. '-5,23,4~13,0~2' is stored as [ -5, -5, 0, 2, 4, 13, 23, 23 ]

=cut
sub _object { Range::Integer::Object->new( [] ) }

=head2 LITERAL

A rudimentary range form. e.g.

 '4~13'
 '-5'

=cut
sub _literal
{
    my ( $this, $input ) = @_;
    my ( $node, @range ) = '';
    my %symbol = $this->symbol();

    if ( $input->[0] ne $symbol{range} && $input->[-1] ne $symbol{range} )
    { 
        while ( @$input )
        {
            my $char = $input->[0];
    
            if ( $char eq $symbol{range} )
            {
                push @range, $node;
                $node = '';
    
                last if @range == 2;
            }
            else
            {
                last unless $char =~ /\d/ || $char =~ /[-+]/ && $node eq '';
                $node .= $char;
            }
    
            shift @$input;
        }
    }

    if ( @$input )
    {
        splice @range;
        splice @$input;
    }
    else
    {
        push @range, $node;

        if ( @range == 1 )
        {
            $range[1] = $range[0];
        }
        elsif ( $range[1] < $range[0] )
        {
            @range = reverse @range;
        }
    }

    Range::Integer::Object->new( \@range );
}

1;

__END__

=head1 AUTHOR

Kan Liu

=head1 COPYRIGHT and LICENSE

Copyright (c) 2010. Kan Liu

This program is free software; you may redistribute it and/or modify
it under the same terms as Perl itself.

=cut
