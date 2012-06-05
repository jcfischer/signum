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
                         :secret => "aLongAndDifficultSecretString",
                         :method => :sha2

The :value parameter is a hash of parameters to be signed. It is sorted and normalized
before the hashing is done. Also the parameters +controller+ and +action+ are removed
in order to make it possible to directly pass the parameters of a rails request.

The :method parameter is either :md5 (default) or :sha2

internally, this calls the Signature class directly. You could therefore also
use:

    Signum::Signature.for "secret", :sha2, "param1" => "hello", "param2" => "world"
    => a3562b14ae3b14cc6db2aa01840273f4

Version history
---------------

0.0.4 - added SHA2 digest