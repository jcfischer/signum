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


