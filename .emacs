;; Ford Bohrmann
;; Created 11/4/15



;-----------;
;;; Modes ;;;
;-----------;

;; Ido mode
(require 'ido)
(ido-mode 1)

;; Elpy
;; config where ELPA looks for packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
;; enable elpy

(package-initialize)
(elpy-enable)
(elpy-use-ipython)

;---------------;
;;; Utilities ;;;
;---------------;

;; Fill column indicator
(add-to-list 'load-path "~/.emacs.d/fill-column-indicator-1.86")
(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
