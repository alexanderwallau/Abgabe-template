{
  description = "Abgabe Template";
  outputs = { self }: {

    # nix flake init --template 'github:alexanderwallau/Abgabe-template'
    templates.default = self.templates.abgabe-templates;
    templates.abgabe-templates = {
      description = "Abgabe Template";
      path = ./src;
      welcomeText = ''
        # Simple Template for University Assignments
        ## More info
        - [GitHub](https://github.com/alexanderwallau/Abgabe-template/)
      '';
    };

  };
}
