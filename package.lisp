(defpackage #:cffi-stfl
  (:nicknames #:stfl)
  (:use #:cl #:iterate #:alexandria #:cffi)
  (:shadow "GET" "SET")
  (:export #:with-form #:create #:free #:run #:reset #:get #:set
	   #:get-focus #:set-focus #:dump #:modify #:lookup #:get-error #:error-action))
