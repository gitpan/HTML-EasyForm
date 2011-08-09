package HTML::EasyForm::Field::Checkbox;
BEGIN {
  $HTML::EasyForm::Field::Checkbox::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $HTML::EasyForm::Field::Checkbox::VERSION = '0.100';
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

1;
__END__
=pod

=head1 NAME

HTML::EasyForm::Field::Checkbox - Checkbox

=head1 VERSION

version 0.100

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

