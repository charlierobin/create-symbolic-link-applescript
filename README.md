An AppleScript droplet (supports `on open` event) and applet (supports `on run`) for creating .sym links of dragged and dropped (or selected) files/folders.

I think I originally started it in the late 2000s using the Apple Script Editor app ([AppleScript](support.apple.com/en-gb/guide/script-editor/welcome/mac)), but then at some point years later discovered Script Debugger ([Late Night Software | The home of Script Debugger](latenightsw.com/)) ~~and fell in love with that~~. (Or at least came to the conclusion that it was a lot better than the Apple offering when it came to the business of learning a little more about AppleScript. I’m not sure that love is involved.)

I seem to mainly use it for creating shared assets in Cinema 4D/After Effects projects and Visual Studio Code projects, where it seems to work well (whereas straight Apple Finder aliases fail):

eg: having several projects sharing common Javascript folders/files

[Symlink vs Alias: Symlinks and Aliases both display as a folder with a redirect arrow. But there are key differences in the way that they behave. #macos #terminal](https://gist.github.com/dotherightthing/3cbf17fe882dc8131eb8e9b9a501e9b9)

The script itself is simple enough: if files/folders are dropped onto the app, they are “handled”, ie: a .sym is created for each of them. If nothing is dropped, a dialog box is displayed allowing either folders or files to be selected, which will then handled.

There’s a little minimal error handling, but it could be better (probably).

Under the hood, it uses the standard command line:

`ln -s /path/to/item.js /path/to/item.js.sym`

### Other interesting links...

https://latenightsw.com/

https://support.apple.com/en-gb/guide/script-editor/welcome/mac

#### Other ways of doing the same thing...

This is another project I stumbled across whilst (finally, after all these years) composing this README, and having tried it out, it’s pretty good, both as a utility and as a tutorial in how to create MacOS Finder extensions in Swift:

https://github.com/ololx/quick-symlink

This is by the same author as the Finder extension above, except it’s an Automator workflow calling

`/System/Library/Automator/Run Shell Script.action`

with the same `n -s etc etc` command.

https://github.com/ololx/create-symlink

