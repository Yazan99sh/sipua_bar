# SIPUA BAR

![Flutter Platform](https://badgen.net/pub/flutter-platform/bottom_navigation_bar)

This package is part of the `IdeaHub` designs made by [Sipua](https://instagram.com/sipua_).
And implemented by me

## About

navigation bar

## Screen Shoot
###Photo
![Sipua Bar View](https://yazanshmo.000webhostapp.com/assets/Screenshot_1631883212.png)
###GIF 
If it not that good because of android studio bad emulator
![Sipua Bar Gif](https://yazanshmo.000webhostapp.com/assets/sipua_bar.gif)
## Usage

Main classes:

1. [SipuaNavigationBar](lib/sipua_bar.dart)
2. [SipuaItem](lib/sipua_bar.dart)

**Sample of Use**
```
 bottomNavigationBar: SipuaNavigationBar(
  cursorColor: Colors.white,
  currentIndex: 1,
  selectedContent: Colors.black,
  items: [
         SipuaItem(label: 'Tips', icon: Icons.opacity_rounded),
         SipuaItem(label: 'Home', icon: Icons.home_rounded),
         SipuaItem(label: 'Ideas', icon: Icons.lightbulb_rounded),
         SipuaItem(label: 'Book', icon: Icons.book_rounded),
         ],
  onItemSelected: (int) {},
  unselectedContent: Colors.white,
  animationDuration: Duration(milliseconds: 350),
  backgroundColor:Color.fromRGBO(238, 255, 132, 1),
),
```
## Navigator

Widget for simple switch content by selected item in bar.
More details of using you can see in example.

## Installation

Add `sipua_bar` to your `pubspec.yaml` file:

```yaml
dependencies:
  sipua_bar: ^0.0.1
```

## Changelog

All notable changes to this project will be documented in [this file](./CHANGELOG.md).

## Issues

For issues, file directly in the [main Sipua Bar repo](https://github.com/Yazan99sh/sipua_bar.git).


## How to reach us

Please feel free to ask any questions about this package. By contact us on Telegram. We speak English and Arabic.
 
* Sipua UI & UX Designer   
[![Telegram](https://img.shields.io/badge/chat-on%20Telegram-blue.svg)](https://t.me/sipuaa)
* Yazan Shekh Mohammed Developer   
  [![Telegram](https://img.shields.io/badge/chat-on%20Telegram-blue.svg)](https://t.me/YA1999ZAN)

## License

[MIT License](https://opensource.org/licenses/MIT)