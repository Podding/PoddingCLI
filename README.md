PoddingCLI
==========

a simple CLI to help with managing podding installations

It is very much in development and kind of stupid.

It expects ```~/.podding``` to exist and look like this:

```
default_project: "dev"

dev:
  podding_root: "/Absolute/path/to/podding"

```

It would probably be a good idea to use [user_config]( http://rubydoc.info/gems/user_config/0.0.4/frames ).