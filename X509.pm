package Crypt::OpenSSL::X509;

use strict;
use vars qw($VERSION @EXPORT_OK);
use Exporter;
use base qw(Exporter);

$VERSION = '0.3';

@EXPORT_OK = qw(
	FORMAT_UNDEF FORMAT_ASN1 FORMAT_TEXT FORMAT_PEM FORMAT_NETSCAPE
	FORMAT_PKCS12 FORMAT_SMIME FORMAT_ENGINE FORMAT_IISSGC
);

BOOT_XS: {
	require DynaLoader;

	# DynaLoader calls dl_load_flags as a static method.
	*dl_load_flags = DynaLoader->can('dl_load_flags');

	do {__PACKAGE__->can('bootstrap') ||
		\&DynaLoader::bootstrap}->(__PACKAGE__,$VERSION);
}

1;

__END__

=head1 NAME

Crypt::OpenSSL::X509 - Perl extension to OpenSSL's X509 API.

=head1 SYNOPSIS

  use Crypt::OpenSSL::X509;

  my $x509 = Crypt::OpenSSL::X509->new_from_file('cert.pem');

  print $x509->pubkey() . "\n";
  print $x509->subject() . "\n";
  print $x509->issuer() . "\n";

=head1 ABSTRACT

  Crypt::OpenSSL::X509 - Perl extension to OpenSSL's X509 API.

=head1 DESCRIPTION

  This implement a large majority of OpenSSL's useful X509 API.

=head2 EXPORT

None by default.

On request:

	FORMAT_UNDEF FORMAT_ASN1 FORMAT_TEXT FORMAT_PEM FORMAT_NETSCAPE
	FORMAT_PKCS12 FORMAT_SMIME FORMAT_ENGINE FORMAT_IISSGC

=head1 SEE ALSO

OpenSSL(1), Crypt::OpenSSL::RSA, Crypt::OpenSSL::Bignum

=head1 AUTHOR

Dan Sully, E<lt>daniel@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2004 by Daniel Sully

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
