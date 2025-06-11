{ config, pkgs, ... }: {
  # Emacs configuration
  programs.emacs = {
    enable = true;
    package = pkgs.emacs.override {
      withX = true;
    };
    extraPackages = epkgs: with epkgs; [
      vterm
      lsp-mode
      lsp-ui
      tree-sitter
      tree-sitter-langs
      pkgs.tree-sitter-grammars.tree-sitter-tsx
      pkgs.tree-sitter-grammars.tree-sitter-python
      pkgs.tree-sitter-grammars.tree-sitter-go
      pkgs.tree-sitter-grammars.tree-sitter-java
    ];
    	extraConfig = ''
      (setq user-emacs-directory "~/.emacs.d")  ; Correct directory for symlink or target path
      (load "~/.emacs.d/init.el")               ; Load the actual init.el file
      (message "init.el is loaded!")
 '';
  };

  # Optionally, ensure Emacs is the default editor
  services.emacs = {
    enable = true;
    defaultEditor = true;
  };

  # Home package configuration (like vterm)
  home.packages = with pkgs; [
    cmake
    libvterm
  ];
}
