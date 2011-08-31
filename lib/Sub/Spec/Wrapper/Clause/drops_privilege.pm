package Sub::Spec::Wrapper::Clause::drops_privilege;

sub after_eval {
    my ($wrapper) = @_;
    $wrapper->add_line('if ($< == 0 && $>) { $> = 0; $) = $( }');
}

1;
