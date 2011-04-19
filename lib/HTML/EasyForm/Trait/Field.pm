package HTML::EasyForm::Trait::Field;
BEGIN {
  $HTML::EasyForm::Trait::Field::AUTHORITY = 'cpan:GETTY';
}
BEGIN {
  $HTML::EasyForm::Trait::Field::VERSION = '0.001';
}
# ABSTRACT: Trait for all Fields for the wrapping of HTML::FormHandler

use Moose::Role;
use File::Spec;

has template => (
	isa => 'Str',
	is => 'rw',
	lazy => 1,
	default => sub {
		my $self = shift;
		return File::Spec->catdir( 'form', 'widget', ($self->widget).'.tt' );
	},
);

use Data::Dumper;

sub check_params {
	my ( $self ) = @_;
	if ($self->isa('HTML::FormHandler::Field::Repeatable')) {
		if ($self->form->params->{($self->name).'_add'}) {
			my %values;
			for (@{$self->create_element->fields}) {
				for (@{$_->fields}) {
					$values{$_->name} = $_->value;
				}
			}
			push @{$self->form->params->{($self->name)}}, \%values;
		}
	} elsif ($self->isa('HTML::FormHandler::Field::Repeatable::Instance')) {
		if ($self->form->params->{$self->parent->name}->{$self->name}->{delete}) {
			print Dumper (ref $self->parent);
		}
	}
	if ($self->has_fields) {
		$_->check_params for ($self->all_fields);
	}
}

has addlabel => (
	isa => 'Str',
	is => 'rw',
);

sub loc_addlabel {
    my $self = shift;
    return $self->_localize($self->addlabel);
}

has vertical_cell => (
	isa => 'Bool',
	is => 'rw',
	default => sub { 0 },
);

has full => (
	isa => 'Bool',
	is => 'rw',
	lazy => 1,
	default => sub {
		my $self = shift;
		return 1 if $self->can('is_compound') && $self->is_compound;
		return 1 if $self->widget eq 'hidden';
		return 0;
	},
);

1;
__END__
=pod

=head1 NAME

HTML::EasyForm::Trait::Field - Trait for all Fields for the wrapping of HTML::FormHandler

=head1 VERSION

version 0.001

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

