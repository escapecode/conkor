## Conkor

[![Build Status](https://travis-ci.org/escapecode/conkor.png)](https://travis-ci.org/escapecode/conkor)


[![screenshot](https://github.com/escapecode/conkor/blob/master/conkor.jpg)](https://raw.github.com/wiki/escapecode/conkor/blob/master/conkor.jpg)

**Conkor** is a free, light-weight desktop widget using Conky and xdotool for interaction.  There is a bunch of Conky, LUa and xdotool coding utilized, making this widget valuable for use as well as code referencing.

### Features
* RSS news
* Weather feed with images
* Lua coding with Cairo graphics, internet connections, etc.
* xdotool interaction to administer services

Valuable note:  Conkor does not use xdotool's "behave mouse_click" functionality, since it is non-consistent and unstable.  "behave focus" is used and provides similar functionality

Grab the [latest release from GitHub](https://github.com/escapecode/conkor/releases/latest).
### Screenshots

[![screenshot](https://github.com/escapecode/conkor/blob/master/conkor.jpg)](https://raw.github.com/wiki/escapecode/conkor/blob/master/conkor.jpg)

See the [User Configs](https://github.com/escapecode/conkor/wiki/User-Configs) section of the wiki for more

### Documentation

The [GitHub Wiki](https://github.com/escapecode/conkor/wiki) serves as a central hub for all of
Conkor's documentation. Quick links:

* [Install](https://github.com/escapecode/conkor/wiki/Installation)
* [Configure](https://github.com/escapecode/conkor/wiki/Configuration-Settings)
* [User Configs](https://github.com/escapecode/conkor/wiki/User-Configs)
* [Frequently Asked Questions](https://github.com/escapecode/conkor/wiki/FAQ)

### Todo
* forecasts and link to eather site
* heat graphs for things like disk utilization
* not sure if should be a part of Conky / Lua, but maybe add notifications (low disk spac, file mount, logging, etc.)

### License

Conkor is licensed under the terms of the [GPLv3](LICENSE.GPL) and
[BSD](LICENSE.BSD) licenses.

### Contributing

To submit code changes, please open pull requests against [the GitHub repository](https://github.com/escapecode/conkor/edit/master/README.md). Patches submitted in issues, email, or elsewhere will likely be ignored. Here's some general guidelines when submitting PRs:

 * In your pull request, please:
   * Describe the changes, why they were necessary, etc
   * Describe how the changes affect existing behaviour
   * Describe how you tested and validated your changes
   * Include any relevant screenshots/evidence demonstrating that the changes work and have been tested
 * Any new source files should include a GPLv3 license header
 * Any contributed code must be GPLv3 licensed

[wiki]: https://github.com/escapecode/conkor/wiki
[conky]:http://conky.sourceforge.net/variables.html
[xdotool]: https://www.semicomplete.com/projects/xdotool/xdotool.xhtml
[luawiki]: http://en.wikipedia.org/wiki/Lua_%28programming_language%29
[Imlib2]: http://docs.enlightenment.org/api/imlib2/html/
[cairo]: http://www.cairographics.org/
