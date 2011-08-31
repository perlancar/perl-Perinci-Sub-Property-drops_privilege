package Sub::Spec::Clause::drops_privilege;

# VERSION

sub update_schema {
    my $schema = $Sub::Spec::Schema::SCHEMA or return;
    $schema->[1]{keys}{drops_privilege} = 'bool*';
}

update_schema();

1;
# ABSTRACT: Add clause 'drops_privilege'

=head1 SYNOPSIS

 # in your sub spec
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
