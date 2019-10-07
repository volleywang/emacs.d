;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)
(require-package 'rx)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (after-load 'anaconda-mode
    (define-key anaconda-mode-map (kbd "M-?") nil))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (after-load 'python
        (push 'company-anaconda company-backends)))))

;; (setq python-shell-interpreter "/usr/local/bin/python3")
;; (setq elpy-rpc-python-command "/usr/local/bin/python3")

;; (require-package 'use-package)
;; (use-package elpy
;;   :ensure t
;;   :defer t
;;   :init
;;   (advice-add 'python-mode :before 'elpy-enable))
;; (when (maybe-require-package 'elpy)
;;   (elpy-enable))

;; (when (maybe-require-package 'flycheck)
;;   (after-load 'elpy
;;     (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;     (add-hook 'elpy-mode-hook 'flycheck-mode))
;;   (when (maybe-require-package 'py-autopep8)
;;     (after-load 'elpy
;;       (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))))

(provide 'init-python)
;;; init-python.el ends here
