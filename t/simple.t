#!perl
use strict;
use warnings;
use lib 'lib';
use Test::Expect;
use Test::More tests => 18;

require_ok('Expect');

ok(1, "True");

foreach my $filename ('read', 'readline') {
  ok($filename, "Testing $filename");
  expect_run(
    command => "$^X $filename",
    prompt  => $filename . ': ',
    quit    => 'quit',
  );
  isa_ok(expect_handle(), 'Expect');
  expect_like(qr/Hi there, to $filename/, "expect_like");
  expect_is("* Hi there, to $filename", "expect_is");
  expect_send("ping", "expect_send");
  expect("ping", "pong", "expect");
};
