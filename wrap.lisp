(in-package :cffi-stfl)

(defvar *form* nil)

(defmacro with-form ((form &optional (persist nil)) &body body)
  (once-only (form)
    `(let ((*form* (if (pointerp ,form)
		       ,form
		       (create ,form))))
       ,@(if persist
	     body
	     `(unwind-protect (progn
				,@body)
		(free))))))

(defun create (stfl-description)
  (assert (stringp stfl-description));add conversion from some s-exp format later
  (ipool-reset)
  (%create (towc stfl-description)))

(defun free (&optional (form *form*))
  (%free form))

(defun run (timeout &optional (form *form*))
  (ipool-reset)
  (fromwc (%run form timeout)))

(defun get (name &optional (form *form*))
  (ipool-reset)
  (fromwc (%get form (towc name))))

(defun set (name value &optional (form *form*))
  (ipool-reset)
  (%set form (towc name) (towc value)))

(defun get-focus (&optional (form *form*))
  (ipool-reset)
  (fromwc (%get-focus form)))

(defun set-focus (name &optional (form *form*))
  (ipool-reset)
  (%set-focus form (towc name)))

(defun dump (name prefix focus &optional (form *form*))
  (fromwc (%dump form (towc name) (towc prefix) focus)))

(defun modify (name mode text &optional (form *form*))
  (%modify form (towc name) (towc mode) (towc text)))

(defun lookup (path newname &optional (form *form*))
  (fromwc (%lookup form (towc path) (towc newname))))

(defun get-error ()
  (fromwc (%get-error)))

(defun error-action (mode)
  (%error-action (towc mode)))
