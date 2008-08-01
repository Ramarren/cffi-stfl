(defpackage #:cffi-stfl
  (:nicknames #:stfl)
  (:use #:cl #:iterate #:alexandria #:cffi)
  (:shadow "GET" "SET")
  (:export #:create #:free #:run #:reset))
