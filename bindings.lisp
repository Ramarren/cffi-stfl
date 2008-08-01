(in-package :cffi-stfl)

(define-foreign-library stfl (:unix "./libstfl.so"))

(use-foreign-library stfl)

(defparameter *ipool* nil)

(defctype stfl-form :pointer "STFL form handler")
(defctype stfl-string :pointer)

(defcfun (%create "stfl_create") stfl-form (text stfl-string))
(defcfun (%free "stfl_free") :void (form stfl-form))
(defcfun (%run "stfl_run") stfl-string (form stfl-form) (timeout :int))
(defcfun (reset "stfl_reset") :void)
(defcfun (%get "stfl_get") stfl-string (form stfl-form) (name stfl-string))
(defcfun (%set "stfl_set") :void (form stfl-form) (name stfl-string) (value stfl-string))
(defcfun (%get-focus "stfl_get_focus") stfl-string (form stfl-form))
(defcfun (%set-focus "stfl_set_focus") :void (form stfl-form) (name stfl-string))
(defcfun (%stfl-quote "stfl_quote") :void (text stfl-string))
(defcfun (%dump "stfl_dump") stfl-string (form stfl-form) (name stfl-string) (prefix stfl-string) (focus :int))
(defcfun (%modify "stfl_modify") :void (form stfl-form) (name stfl-string) (mode stfl-string) (text stfl-string))
(defcfun (%lookup "stfl_lookup") stfl-string (form stfl-form) (path stfl-string) (newname stfl-string))
(defcfun (%get-error "stfl_error") stfl-string)
(defcfun (%error-action "stfl_error_action") :void (mode stfl-string))

;;; ipool

(defctype stfl-ipool :pointer)

(defcfun (ipool-create "stfl_ipool_create") stfl-ipool (code :string))
(defcfun (ipool-add "stfl_ipool_add") :void (pool stfl-ipool) (data :pointer))
(defcfun (ipool-towc "stfl_ipool_towc") stfl-string (pool stfl-ipool) (buf :string))
(defcfun (ipool-fromwc "stfl_ipool_fromwc") :string (pool stfl-ipool) (buf stfl-string))
(defcfun (ipool-flush "stfl_ipool_flush") :void (pool stfl-ipool))
(defcfun (ipool-destroy "stfl_ipool_destroy") :void (pool stfl-ipool))

(defun ipool-reset ()
  (if *ipool*
      (setf *ipool* (ipool-create "UTF8"))
      (ipool-flush *ipool*)))

(defun towc (text)
  (ipool-towc *ipool* text))

(defun fromwc (stfl-text)
  (ipool-fromwc *ipool* stfl-text))

(declaim (inline ipool-reset towc fromwc))