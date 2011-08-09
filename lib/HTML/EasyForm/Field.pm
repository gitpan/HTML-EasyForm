package HTML::EasyForm::Field;
BEGIN {
  $HTML::EasyForm::Field::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $HTML::EasyForm::Field::VERSION = '0.101';
}
# ABSTRACT: Base field implementation

use Moose;
extends 'Form::DemonCore::Field';

has full => (
	isa => 'Bool',
	is => 'rw',
	default => sub { 0 },
);

has class => (
	isa => 'Str',
	is => 'rw',
	predicate => 'has_html_class',
);

has id => (
	isa => 'Str',
	lazy => 1,
	is => 'ro',
	default => sub { shift->param_name },
);

has label => (
	is => 'rw',
	lazy => 1,
	default => sub { shift->name },
);

has widget => (
	is => 'rw',
	lazy => 1,
	default => sub { 'text' },
);

has style => (
	isa => 'Str',
	is => 'rw',
	predicate => 'has_style',
);

has template => (
	is => 'ro',
	isa => 'Str',
	lazy => 1,
	default => sub { 'form/widget/'.shift->widget },
);

has template_tt => (
	is => 'ro',
	isa => 'Str',
	lazy => 1,
	default => sub { shift->template.'.tt' },
);

1;
__END__
=pod

=head1 NAME

HTML::EasyForm::Field - Base field implementation

=head1 VERSION

version 0.101

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

