package HTML::EasyForm::Field::Password;
BEGIN {
  $HTML::EasyForm::Field::Password::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $HTML::EasyForm::Field::Password::VERSION = '0.101';
}
# ABSTRACT: Hidden field

use Moose;
extends 'HTML::EasyForm::Field';

has '+widget' => (
	default => sub { 'password' },
);

1;
__END__
=pod

=head1 NAME

HTML::EasyForm::Field::Password - Hidden field

=head1 VERSION

version 0.101

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

