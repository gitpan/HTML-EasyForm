package HTML::EasyForm::Field::Checkbox;
BEGIN {
  $HTML::EasyForm::Field::Checkbox::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $HTML::EasyForm::Field::Checkbox::VERSION = '0.101';
}
# ABSTRACT: Checkbox

use Moose;
extends 'HTML::EasyForm::Field';

has '+widget' => (
	default => sub { 'checkbox' },
);

has checkbox_value => (
	isa => 'Str',
	is => 'ro',
	default => sub { 'checkbox_is_checked_and_selected' },
);

sub input_to_value {
	my ( $self ) = @_;
	$self->value($self->input_value eq $self->checkbox_value ? 1 : 0);
}

sub value_to_output {
	my ( $self ) = @_;
	$self->output_value($self->value);
}

sub notempty { 0 }
sub required { 0 }

1;
__END__
=pod

=head1 NAME

HTML::EasyForm::Field::Checkbox - Checkbox

=head1 VERSION

version 0.101

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

