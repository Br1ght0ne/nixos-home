;;; init.el -*- lexical-binding: t; -*-

(doom! :app               ; what makes Emacs the best OS
       calendar           ; essentials for a modern dweller
       ;; irc             ; how neckbeards socialize
       ;; regex           ; FIXME two problems instead of one
       (rss +org)         ; emacs as an RSS reader
       ;; twitter         ; twitter client https://twitter.com/vnought
       (write             ; emacs for writers (fiction, notes, papers, etc.)
        +wordnut          ; wordnet (wn) search
        +langtool)        ; a proofreader (grammar/style check) for Emacs

       :completion        ; be lazy, be productive
       (company           ; the ultimate imperative completion backend
        +auto)            ; as-you-type code completion
       (ivy               ; a search engine for love and life
        +fuzzy            ; enable fuzzy search backend for ivy
        +prescient        ; sorting and filtering machinery
        ;; +childframe    ; honey, look! our child is floating
        +icons)           ; because those are some sweet icons
       ;; helm            ; the *other* search engine for love and life
       ;; +fuzzy          ; enable fuzzy search backend for helm
       ;; ido             ; the other *other* search engine...

       :editor
       (evil              ; come to the dark side, we have cookies
        +everywhere)      ; the shadows grow longer
       file-templates     ; auto-snippets for empty files
       ;; god             ; run Emacs commands without modifier keys
       fold               ; basic code-folding support
       (format            ; all must be formatted...
        +onsave)          ; and don't even think about it.
       lispy              ; the best lisp package ever
       multiple-cursors   ; editing in many places at once
       ;;objed            ; text object editing for the innocent
       ;; parinfer        ; turn lisp into python, sort of
       rotate-text        ; cycle region at point between text candidates
       snippets           ; my elves. They type so I don't have to
       word-wrap          ; soft wrapping with language-aware indent

       :emacs             ; anything new is enormously patched old
       (dired             ; making dired pretty [functional]
        ;; +ranger        ; you can't forget it, let's be honest
        +icons)           ; it's 20XX already, come on!
       electric           ; smarter, keyword-based electric-indent
       vc                 ; version-control and Emacs, sitting in a tree

       :email             ; a thing of beauty
       mu4e               ; AM YOU
       ;; notmuch
       ;; wanderlust

       :lang              ; you either code, or should start coding
       ;; agda            ; types of types of types of types...
       assembly           ; assembly for fun or debugging
       (cc +lsp)          ; C/C++/Obj-C madness
       ;; clojure         ; java with a lisp
       ;; common-lisp     ; if you've seen one lisp, you've seen them all
       ;; coq             ; proofs-as-programs
       crystal            ; ruby at the speed of c
       ;; csharp          ; unity, .NET, and mono shenanigans
       data               ; config/data formats
       erlang             ; an elegant language for a more civilized age
       (elixir +lsp)      ; erlang done right
       ;; elm             ; care for a cup of TEA?
       emacs-lisp         ; drown in parentheses
       ;; ess             ; emacs speaks statistics
       ;;faust            ; dsp, but you get to keep your soul
       ;; fsharp          ; ML stands for Microsoft's Language
       go                 ; the hipster dialect
       ;; haskell         ; a language that's lazier than I am
       ;; hy              ; readability of scheme w/ speed of python
       ;; idris           ;
       (java +meghanada)  ; the poster child for carpal tunnel syndrome
       (javascript +lsp)  ; all(hope(abandon(ye(who(enter(here))))))
       julia              ; a better, faster MATLAB
       ;; kotlin          ; a better, slicker Java(Script)
       latex              ; writing papers in Emacs has never been so fun
       ledger             ; an accounting system in Emacs
       lua                ; one-based indices? one-based indices
       markdown           ; writing docs for people to ignore
       nim                ; python + lisp at the speed of c
       nix                ; I hereby declare "nix geht mehr!"
       ;; ocaml           ; an objective camel
       (org               ; organize your plain life in plain text
        +dragndrop        ; file drag & drop support
        +ipython          ; ipython support for babel
        +pandoc           ; for those *other* pleb formats
        +present)         ; emacs for presentations
       ;; perl            ; write code no one else can comprehend
       ;; php             ; perl's insecure younger brother
       plantuml           ; diagrams for confusing people more
       ;; purescript      ; javascript, but functional
       (python +lsp)      ; beautiful is better than ugly
       ;; qt              ; the 'cutest' gui framework ever
       racket             ; a DSL for DSLs
       rest               ; Emacs as a REST client
       (ruby              ; 1.step { |i| puts "Ruby is #{i.even? ? 'love' : 'life'}"}
        +lsp
        +rails)           ; convention over head-desk-banging
       (rust              ; a crabby language
        +lsp)             ; best in class
       ;; scala           ; java, but good
       ;; scheme          ; a fully conniving family of lisps
       sh                 ; she sells (ba|z)sh shells on the C xor
       ;; solidity        ; do you need a blockchain? No.
       ;; swift           ; who asked for emoji variables?
       ;; terra           ; Earth and Moon in alignment for performance.
       web                ; the tubes

       :term              ; is this hacking?
       eshell             ; hack the world, one cons at a time
       ;; shell           ; back to basics
       term               ; the virgin default terminal (still nice)
       ;; vterm           ; the CHAD native-enhanced terminal module (TODO alpha)

       :tools             ; of the trade, and other activities
       ansible            ; automate all the things, even if it takes more time
       debugger           ; stepping through code, to help you add bugs
       direnv             ; because long .profile files are bad
       docker             ; ever played buzzword bingo?
       editorconfig       ; let someone else argue about tabs vs spaces
       ;; ein             ; tame Jupyter notebooks with emacs
       (eval +overlay)    ; run code, run (also, repls)
       (flycheck          ; tasing you for every semicolon you forget
        +childframe)      ; because popups are hungry for attention
       flyspell           ; tasing you for misspelling mispelling
       gist            ; interacting with github gists
       (lookup            ; helps you navigate your code and documentation
        +devdocs)         ; ...on devdocs.io online
       lsp                ; a sane way to talk to your editor in charge
       ;; macos           ; a hipster OS, not for the *real* developers.
       (magit             ; the best git porcelain everrr
        +forge)           ; git(hub|lab|gud) at your fingertips
       make               ; $ make your dreams come true  # doesn't work
       pass               ; password manager for nerds
       pdf                ; pdf enhancements
       ;; prodigy         ; FIXME managing external services & code builders
       rgb                ; creating color strings
       terraform          ; before Mars, start with your ~server~ ROOM AND THE MESS INSIDE
       ;; tmux            ; an API for interacting with tmux
       ;; upload          ; map local to remote projects via ssh/ftp
       wakatime           ; maintaining your illusions of being productive

       :ui                ; you can't stare at that console all day, Ronny!
       ;; deft            ; for those who didn't try org-mode
       doom               ; what makes DOOM look the way it does
       doom-dashboard     ; a nifty splash screen for Emacs
       doom-quit          ; DOOM quit-message prompts when you quit Emacs
       fill-column        ; a `fill-column' indicator
       hl-todo            ; highlight TODO/FIXME/NOTE tags
       hydra              ; a multi-headed snake at your fingertips
       ;; indent-guides   ; stop counting nesting levels, for god's sake
       modeline           ; snazzy, Atom-inspired modeline, plus API
       nav-flash          ; blink the current line after jumping
       ;; neotree         ; a project drawer, like NERDTree for vim
       ophints            ; display visual hints when editing in evil
       (popup             ; tame sudden yet inevitable temporary windows
        +all              ; catch all popups that start with an asterix
        +defaults)        ; default popup rules
       (pretty-code       ; replace bits of code with pretty symbols
        +fira)            ; the one true ligature font
       ;; tabs            ; FIXME an (incomplete) tab bar for Emacs
       treemacs           ; a project drawer, like neotree but cooler
       unicode            ; extended unicode support for various languages
       vc-gutter          ; vcs diff in the fringe
       vi-tilde-fringe    ; fringe tildes to mark beyond EOB
       (window-select     ; visually switch windows
        +numbers)         ; jump around like a freak
       workspaces         ; tab emulation, persistence & separate workspaces

       :config            ; configs. configs always change
       literate           ; something something org babel tangle
       (default           ; hlissner's legacy
         +bindings        ; spacemacs? spacemacs
         +smartparens))   ; parinfer, but actually no
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("001c2ff8afde9c3e707a2eb3e810a0a36fb2b466e96377ac95968e7f8930a7c5" "2878517f049b28342d7a360fd3f4b227086c4be8f8409f32e0f234d129cee925" "e7666261f46e2f4f42fd1f9aa1875bdb81d17cc7a121533cad3e0d724f12faf2" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "70ed3a0f434c63206a23012d9cdfbe6c6d4bb4685ad64154f37f3c15c10f3b90" "cdb3e7a8864cede434b168c9a060bf853eeb5b3f9f758310d2a2e23be41a24ae" default))
 '(mouse-wheel-progressive-speed nil)
 '(safe-local-variable-values
   '((plantuml-default-exec-mode quote jar)
     (TeX-engine . xelatex)
     (org-cycle-include-plain-lists . integrate)
     (org-cycle-include-plain-lists quote integrate)
     (magit-todos-depth . 1)))
 '(wakatime-api-key "d3ced585-ce02-419a-a204-36bf85a09926")
 '(wakatime-cli-path "wakatime")
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
