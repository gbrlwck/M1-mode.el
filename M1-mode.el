;; M1-mode

(defconst M1-font-lock-keywords
  (list
   '( "\\(\\(#\\|;\\).*\\)$" . font-lock-comment-face)  ;; comments
   '( "^DEFINE"              . font-lock-warning-face)  ;; the one KEY word

   '( "!\\-?\\([0-9]\\)+"         . font-lock-constant-face)  ;; numbers !-8
   '( "\\.\\([A-F0-9]\\{8\\}\\)"  . font-lock-reference-face) ;; define register numbers .012345678
   '( "\\([A-F0-9]\\{8\\}\\)"     . font-lock-reference-face) ;; define function numbers 012345678

   '( "[~!\\$][a-zA-Z0-9_]+"    . font-lock-variable-name-face) ;; label-references
   '( "\:[a-zA-Z0-9_]+"      . font-lock-function-name-face) ;; labels

   ;; RISCV M1 specific
   '( "\\(RD_\\w+\\)"     . font-lock-keyword-face)       ;; destination registers
   '( "\\(RS[12]_\\w+\\)" . font-lock-doc-face)           ;; source registers
   '( "\\([A-Z]+\\)"      . font-lock-string-face)        ;; instruction names
   "minimal highlighting for M1 entries"))

(define-derived-mode M1-mode prog-mode "M1"
  "mode to highlight syntax in bootstrappable M1 code"
  (set (make-local-variable 'font-lock-defaults) '(M1-font-lock-keywords))
  '())
