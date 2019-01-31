# boxes.kak

[`boxes`](http://boxes.thomasjensen.com/) integration for the [Kakoune]http://kakoune.org/) editor. 
As such, this plugin requires `boxes` to be installed.


## Commands

### box

The `:box [<boxes options>]` command will take the current selection and run it through `boxes`. 
All options are sent to `boxes`. The default behavior, for supported filetypes, is to create a 
comment block.

Default boxing filetypes supported:

- sh
- Go
- C
- Java
- Kakoune
- Lisp
- Java
- HTML
- VIM


### unbox

`:unbox` is, unsurprisingly, the inverse of `:box`. This relies on `boxes` default _unboxing_ 
behavior.


## Installation

### Using plug.kak

To install with [plug.kak](https://github.com/andreyorst/plug.kak), add the following line to your 
`kakrc`:

```
plug "jwhett/boxes-kak"
```

Run `:plug-install` to install.

> Use `:plug-update` to update.


### Manual (plugin directory)

Clone this repository into a `plugins` directory and source:

```sh
mkdir -p ~/.config/kak/plugins
git clone https://github.com/jwhett/boxes-kak.git ~/.config/kak/plugins/boxes-kak
```

Add the following to your `kakrc`.

```
source "%val{config}/plugins/boxes-kak/boxes.kak
```
