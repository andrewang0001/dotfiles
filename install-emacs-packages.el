(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; install all the packages! 
(setq package-list '(reftex ivy company auctex doom doom-modeline doom-themes))
(mapc #'package-install package-list)
