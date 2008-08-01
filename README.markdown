* Overview

This are CFFI bindings for [STFL](http://www.clifford.at/stfl/), Structured Terminal Forms Language/Library.

* Notes

This is almost completely untested. Only most basic display/event handling was checked at all. In particular I am worried about threading, as STFL seems to depend on pthreads. Also by default only static library is provided. I wrote binding against shared library generate just by adding `-shared` to Makefile, and am not sure how well does this work.