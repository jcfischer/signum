Signum
======

A library to compute cryptographic signatures of strings. We use it protect
parameters passed to an API by signing the params, and passing that signature
along. On the receiving side, the params are checked against the signature to
detect spoofing. Of course this needs some kind of secret to prevent a slightly
higher skilled hacker to just re-compute the signature.

Installation
------------

Usage
-----

    Signum.signature_for :value => { "param1" => "hello", "param2" => "world"},
                         :secret => "aLongAndDifficultSecretString"

internally, this calls the Signature class directly. You could therefore also
use:

    Signum::Signature.for "secret", "param1" => "hello", "param2" => "world"
    => a3562b14ae3b14cc6db2aa01840273f4
