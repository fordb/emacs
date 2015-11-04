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
;; enable Elpy
(package-initialize)
(elpy-enable)
(elpy-use-ipython)

;; Line highlighting
(global-hl-line-mode t)
(set-face-background 'hl-line "gray19")

;---------------;
;;; Utilities ;;;
;---------------;

;; Fill column indicator
(add-to-list 'load-path "~/.emacs.d/fill-column-indicator-1.86")
(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

;; copy to Mac clipboard (for copying text the wrapped '\' lines
(defun copy-to-mac-clipboard ()
  "Copy currently selected region to Mac clipboard (useful for wrapped '\\' lines)"
  (interactive)
  (if (> (- (region-end) (region-beginning)) 0)
      (progn
	(kill-ring-save (region-beginning) (region-end))
	(shell-command-on-region (region-beginning) (region-end) "pbcopy")
	(if (and transient-mark-mode mark-active)
	    (deactivate-mark)))
    (progn
      (message "no region active"))
    ))
(global-set-key "\M-w" 'copy-to-mac-clipboard)

;; disable menu bar mode
(menu-bar-mode 0)

;; remove scratch message
(setq initial-scratch-message nil)

;; time
(display-time-mode 1)
