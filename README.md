## Conkor

[![Build Status](https://travis-ci.org/escapecode/conkor.png)](https://travis-ci.org/escapecode/conkor)


[![screenshot](https://github.com/escapecode/conkor/blob/master/conkor.jpg)](https://raw.github.com/wiki/escapecode/conkor/blob/master/conkor.jpg)

**Conkor** is a free, light-weight desktop widget using Conky, using xdotool for interaction.  Most of the features of Conky and xdotool are utilized, so the code developed can be used for referential purposes.

### Features
* RSS news
* Weather feed with images
* Lua
* Lua Cairo graphics
* xdotool interaction to administer services

Note that xdotool does not use behave mouse_click, since mouse_click does not appear to be stable.  Focus is used and provides similar functionality

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
* Add hotspot click to start task manager when over top
* Add hot spot and updated image to show webcam screenshot (e.g. datacenter, front door, etc.)
* Add forecasts and link to eather site
* heat graphs for things like disk utilization

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

[luawiki]: http://en.wikipedia.org/wiki/Lua_%28programming_language%29
[wiki]: https://github.com/escapecode/conkor/wiki
[lists]: http://sourceforge.net/mail/?group_id=143975
[Imlib2]: http://docs.enlightenment.org/api/imlib2/html/
[cairo]: http://www.cairographics.org/
