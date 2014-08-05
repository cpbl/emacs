;----------------------;
;;; Custom Functions ;;;
;----------------------;

; unfill a paragraph, i.e., make it so the text does not wrap in the
; paragraph where the cursor is
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

; unfill a region, i.e., make is so the text in that region does not
; wrap
(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(defun make-plugin-path (plugin)
  (expand-file-name
   (concat plugin-path plugin)))

(defun include-plugin (plugin)
  (add-to-list 'load-path (make-plugin-path plugin)))

(defun make-elget-path (plugin)
  (expand-file-name
   (concat elget-path plugin)))

(defun include-elget-plugin (plugin)
  (add-to-list 'load-path (make-elget-path plugin)))



;; Compatibility with pre-23.3 , ie for Apollo server (RHEL6), etc: the "string-prefix-p" is missing
(defun request-testing-string-prefix-p (prefix str &optional ignore-case)
  (let ((case-fold-search ignore-case))
    (string-match-p (format "^%s" (regexp-quote prefix)) str)))

(unless (fboundp 'string-prefix-p)      ; not defined in Emacs 23.1
  (fset 'string-prefix-p (symbol-function 'request-testing-string-prefix-p)))



(provide 'custom-functions)
