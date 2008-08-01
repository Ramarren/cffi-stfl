(in-package :cffi-stfl)

(defun create (stfl-description)
  (assert (stringp stfl-description));add conversion from some s-exp format later
  (ipool-reset)
  (%create (towc stfl-description)))

(defun run (form timeout)
  (ipool-reset)
  (fromwc (%run form timeout)))

(defun get (form name)
  (ipool-reset)
  (fromwc (%get form (towc name))))

(defun set (form name value)
  (ipool-reset)
  (%set form (towc name) (towc value)))

(defun get-focus (form)
  (ipool-reset)
  (fromwc (%get-focus form)))

(defun set-focus (form)
  (ipool-reset)
  (%set-focus form (towc name)))

(defun dump (form name prefix focus)
  (fromwc (%dump form (towc name) (towc mode) focus)))

(defun modify (form name mode text)
  (%modify form (towc name) (towc mode) (towc text)))

(defun lookup (form path newname)
  (fromwc (%lookup form (towc path) (towc newname))))

(defun get-error ()
  (fromwc (%get-error)))

(defun error-action (mode)
  (%error-action (towc mode)))
