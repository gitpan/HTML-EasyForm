package HTML::EasyForm::Field::Datetime::RFC3339;
BEGIN {
  $HTML::EasyForm::Field::Datetime::RFC3339::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $HTML::EasyForm::Field::Datetime::RFC3339::VERSION = '0.101';
}
# ABSTRACT: DateTime field based on RFC3339 formatting (with timezone)

use Moose;
extends 'HTML::EasyForm::Field';

use DateTime::Format::RFC3339;

has '+widget' => (
	default => sub { 'text' },
);

sub input_to_value {
	my ( $self ) = @_;
	$self->value(DateTime::Format::RFC3339->new->parse_datetime($self->input_value));
}

sub value_to_output {
	my ( $self ) = @_;
	$self->output_value(DateTime::Format::RFC3339->new->format_datetime($self->value));
}

1;
__END__
=pod

=head1 NAME

HTML::EasyForm::Field::Datetime::RFC3339 - DateTime field based on RFC3339 formatting (with timezone)

=head1 VERSION

version 0.101

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

