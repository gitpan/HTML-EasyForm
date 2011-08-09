package HTML::EasyForm::Field::Textarea;
BEGIN {
  $HTML::EasyForm::Field::Textarea::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $HTML::EasyForm::Field::Textarea::VERSION = '0.100';
}
# ABSTRACT: Textarea field

use Moose;
extends 'HTML::EasyForm::Field';

has '+widget' => (
	default => sub { 'textarea' },
);

has cols => (
	isa => 'Int',
	is => 'rw',
	predicate => 'has_cols',
);

has rows => (
	isa => 'Int',
	is => 'rw',
	predicate => 'has_rows',
);

1;
__END__
=pod

=head1 NAME

HTML::EasyForm::Field::Textarea - Textarea field

=head1 VERSION

version 0.100

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

