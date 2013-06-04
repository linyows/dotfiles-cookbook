Dotfiles Cookbook
=================

This cookbook makes your dotfiles.

Usage
-----

Just include `dotfiles` in your node's `run_list`:

```json
{
  "name": "my_node",
  "run_list": [
    "recipe[dotfiles]"
  ],
  "dotfiles": {
    "data_bag_user_id": "vagrant"
  }
}
```

A data bag called "users" with an item for your user like the following:

```json
{
  "id": "vagrant",
  "dotfiles": {
    "resource": "git://github.com/linyows/dotfiles.git",
    "after_deploy": "setup.sh"
  }
}
```

Authors and Contributors
------------------------

- [linyows](https://github.com/linyows)

License
-------

MIT
