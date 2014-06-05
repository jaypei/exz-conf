;;; exz-util.el --- summary

;; Copyright (C) 2014 jaypei

;; Author: jaypei <jaypei97159@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(defun exz/debug (&rest args)
  (let ((format-string (car args))
        (other-args (cdr args)))
    (setf format-string (concat "[DEBUG] " format-string))
    (push format-string other-args)
    (apply 'message other-args)))

(defmacro exz/when-aquamacs (&rest body)
  (declare (indent 0) (debug t))
  `(when (boundp 'aquamacs-version)
     ,@body))

(defmacro exz/when-gui (&rest body)
  (declare (indent 0) (debug t))
  `(when (display-graphic-p)
     ,@body))

(defmacro exz/when-console (&rest body)
  (declare (indent 0) (debug t))
  `(unless (display-graphic-p)
     ,@body))

(defmacro exz/when-gnu-emacs (&rest body)
  (declare (indent 0) (debug t))
  `(unless (display-graphic-p)
     ,@body))

(defmacro exz/when-osx (&rest body)
  (declare (indent 0) (debug t))
  `(when (eq system-type 'darwin)
     ,@body))

(provide 'exz-util)
;;; exz-util.el ends here
