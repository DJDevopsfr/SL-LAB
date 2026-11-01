Intro to ansible templates
-  install nginx and copy over config file which is a template
-  inject variable parts into jinga template by creating vars that are injected into template with same name


- Also show case handlers which reach to an evernt 
If the template task changes the config file (because the template content is different from what’s already on the server), then notify: restart nginx will run the handler named restart nginx.
