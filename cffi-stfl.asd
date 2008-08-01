(asdf:defsystem cffi-stfl
  :version "0"
  :description "CFFI bindings for STFL terminal widgets library"
  :maintainer " <ramarren@cignet.higersbergernet>"
  :author " <ramarren@cignet.higersbergernet>"
  :licence "BSD-style"
  :depends-on (:iterate :alexandria :cffi)
  :components ((:file "package")
	       (:file "bindings" :depends-on ("package"))
	       (:file "wrap" :depends-on ("package" "bindings"))))

