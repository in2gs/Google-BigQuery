BEGIN {
  require LWP::Simple;
  LWP::Simple->import('get');
  unless (get('http://169.254.169.254') ){
    Test::More::plan(skip_all => 'This test needs http://169.254.169.254');
  }
}

use strict;
use Test::More 0.98;
use Google::BigQuery;

my $bigquery = Google::BigQuery::create();
isnt($bigquery, undef, 'constructor');
isnt($bigquery->{access_token}, undef, 'access_token');

done_testing;
