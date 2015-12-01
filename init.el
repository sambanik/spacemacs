;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

(setq gc-cons-threshold 100000000)
(defconst spacemacs-version          "0.105.0" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.3" "Minimal version of Emacs.")

(defun spacemacs/emacs-version-ok ()
  (version<= spacemacs-emacs-min-version emacs-version))

(if (spacemacs/emacs-version-ok)(progn
                                 (load-file (concat user-emacs-directory "core/core-load-paths.el"))
                                 (when init-file-debug (require 'core-debug))
                                 (require 'core-spacemacs)
                                 (spacemacs/init)
                                 (spacemacs/maybe-install-dotfile)
                                 (configuration-layer/sync)
                                 (spacemacs/setup-startup-hook)
                                 (require 'server)
                                 (unless (server-running-p) (server-start)))
  (message "Emacs too old! Spacemacs version %d requires Emacs version %d" spacemacs-emacs-min-version spacemacs-emacs-min-version))
