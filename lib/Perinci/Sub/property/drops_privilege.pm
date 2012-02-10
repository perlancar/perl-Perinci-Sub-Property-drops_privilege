package Perinci::Sub::property::drops_privilege;

use 5.010;
use strict;
use warnings;

use Perinci::Util qw(add_property);

# VERSION

sub import {
    add_property(
        type => 'function',
        name => 'drops_privilege',
        schema => {
        },
    );
}

package     sub after_eval {
            my ($wrapper, $val) = @_;
                $wrapper->add_line('if ($< == 0 && $>) { $> = 0; $) = $( }');
            }

    1;

    update_schema();

1;
# ABSTRACT: Add function metadata property 'drops_privilege'

=head1 SYNOPSIS

 # in your function metadata
 drops_privilege => 1


=head1 DESCRIPTION

Argument: BOOL

This module adds 'drops_privilege' clause to sub spec. If set to 1, it specifies
that sub drops OS privileges when doing its job. Usually this is for tasks that
run as root/administrator.

This module adds a wrapper code to make sure that OS privilege is restored. A
sub might die in the middle of execution and haven't restored OS privileges yet.


=head1 SEE ALSO

L<Sub::Spec>

L<Sub::Spec::Wrapper>

=cut
