
use Test;

BEGIN { plan tests => 7 };

use Crypt::OpenSSL::X509;

ok(1);

ok(my $x509 = Crypt::OpenSSL::X509->new_from_file('certs/vsign1.pem'));

ok($x509->serial() eq '325033CF50D156F35C81AD655C4FC825');

# this has a trailing null - how to deal?
ok($x509->fingerprint_md5() =~ '51:86:E8:1F:BC:B1:C3:71:B5:18:10:DB:5F:DC:F6:20');

ok($x509->issuer() eq 'C=US, O=VeriSign, Inc., OU=Class 1 Public Primary Certification Authority');
ok($x509->subject() eq 'C=US, O=VeriSign, Inc., OU=Class 1 Public Primary Certification Authority');

ok($x509->hash() =~ '2edf7016');
