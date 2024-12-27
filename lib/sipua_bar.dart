library sipua_bar;

import 'package:flutter/material.dart';

class SipuaNavigationBar extends StatefulWidget {
  /// current index of the selected item
  final int currentIndex;

  /// return the new index of selected item
  final Function(int) onItemSelected;

  /// the item list
  final List<SipuaItem> items;

  /// color of the selected item content
  final Color selectedContent;

  /// color of the unselected item content
  final Color unselectedContent;

  /// duration of animation
  final Duration animationDuration;

  /// bar background color
  final Color backgroundColor;

  /// color of the item
  final Color cursorColor;

  /// radius of item card
  final BorderRadius? cursorRadius;

  /// spacing around edges
  final bool floating;

  /// this field will do nothing
  final double? opacity;

  /// border radius of bar
  final BorderRadius? borderRadius;

  /// padding
  final EdgeInsets? padding;

  SipuaNavigationBar({
    required this.currentIndex,
    required this.onItemSelected,
    required this.items,
    required this.selectedContent,
    required this.unselectedContent,
    required this.animationDuration,
    required this.backgroundColor,
    required this.cursorColor,
    this.cursorRadius,
    this.floating = false,
    this.opacity,
    this.borderRadius,
    this.padding,
  }) : assert(items.length >= 2) {
    for (int i = 0; i < items.length; i++) {
      items[i].index = i;
    }
  }

  @override
  _SipuaNavigationBarState createState() => _SipuaNavigationBarState();
}

class _SipuaNavigationBarState extends State<SipuaNavigationBar> {
  late int currentIndex;
  late List<SipuaItem> items;
  late Color selectedContent;
  late Color unselectedContent;
  late Duration animationDuration;
  late Color backgroundColor;
  late Color cursorColor;
  BorderRadius? cursorRadius;
  late bool floating;
  double? opacity;
  BorderRadius? borderRadius;
  EdgeInsets? padding;
  List<GlobalKey> _keys = [];
  Offset? initialOffset;
  late Widget itemBuilder;
  late bool firstUse;
  late double off;

  @override
  void initState() {
    firstUse = true;
    _setup();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _setOffset();
    });
    super.initState();
  }

  _setup() {
    currentIndex = widget.currentIndex;
    items = widget.items;
    selectedContent = widget.selectedContent;
    unselectedContent = widget.unselectedContent;
    animationDuration = widget.animationDuration;
    backgroundColor = widget.backgroundColor;
    cursorColor = widget.cursorColor;
    cursorRadius = widget.cursorRadius;
    floating = widget.floating;
    opacity = widget.opacity;
    borderRadius = widget.borderRadius;
    padding = widget.padding;
  }

  _setOffset() {
    try {
      if (firstUse) {
        _keys.forEach((element) {
          itemSize.add(element.currentContext?.size ?? Size(0, 0));
        });
      }
      RenderBox render =
          _keys[currentIndex].currentContext?.findRenderObject() as RenderBox;
      initialOffset = render.localToGlobal(Offset.fromDirection(1, -16));
      if (initialOffset != null) {
        initialOffset = Offset(initialOffset!.dx, initialOffset!.dx);
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void didUpdateWidget(covariant SipuaNavigationBar oldWidget) {
    if (oldWidget != widget) {
      firstUse = true;
      _keys.clear();
      itemSize.clear();
      _setup();
      WidgetsBinding.instance.addPostFrameCallback((timestamp) {
        _setOffset();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: animationDuration,
      padding: padding ?? EdgeInsets.only(right: 8, left: 8.0),
      child: AnimatedContainer(
        height: 75,
        duration: animationDuration,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(opacity ?? 1),
          borderRadius: borderRadius,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              AnimatedPositioned(
                left: initialOffset?.dx ?? 0,
                duration:
                    firstUse ? Duration(milliseconds: 1) : animationDuration,
                curve: Curves.easeInOut,
                child: Container(
                  height: itemSize.isEmpty ? 10 : itemSize[currentIndex].height,
                  width: itemSize.isEmpty ? 10 : itemSize[currentIndex].width,
                  decoration: BoxDecoration(
                    color: cursorColor,
                    borderRadius: cursorRadius ??
                        BorderRadius.vertical(top: Radius.circular(18)),
                  ),
                ),
              ),
              Flex(
                direction: Axis.horizontal,
                children: getItemWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getItemWidget() {
    List<Widget> barItems = [];
    for (var element in items) {
      _keys.add(GlobalKey(debugLabel: element.label));
      barItems.add(
        Expanded(
          child: GestureDetector(
            key: _keys[element.index],
            onTap: () {
              currentIndex = element.index;
              firstUse = false;
              try {
                RenderBox render = _keys[element.index]
                    .currentContext
                    ?.findRenderObject() as RenderBox;
                initialOffset =
                    render.localToGlobal(Offset.fromDirection(1, -16));
                if (initialOffset != null) {
                  initialOffset = Offset(initialOffset!.dx, initialOffset!.dx);
                }
              } catch (e) {
                print(e);
              }
              widget.onItemSelected(currentIndex);
              setState(() {});
            },
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, left: 16, bottom: 8),
                  child: Icon(
                    element.icon,
                    size: 30,
                    color: element.index == currentIndex
                        ? selectedContent
                        : unselectedContent,
                  ),
                ),
                element.index == currentIndex
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TweenAnimationBuilder(
                          duration: firstUse
                              ? Duration(microseconds: 1)
                              : animationDuration,
                          tween: Tween<Offset>(
                              begin: Offset(0, 16), end: Offset(0, 0)),
                          child: Text(
                            element.label,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: selectedContent,
                            ),
                            textAlign: TextAlign.center,
                            textScaleFactor: 1,
                          ),
                          builder: (_, Offset val, child) {
                            return Transform.translate(
                              offset: val,
                              child: child,
                            );
                          },
                        ),
                      )
                    : SizedBox(
                        height: 16,
                      ),
              ],
            ),
          ),
        ),
      );
    }
    return barItems;
  }

  List<Size> itemSize = [];
}

class SipuaItem {
  final String label;
  final IconData icon;
  late int index;

  SipuaItem({required this.label, required this.icon});
}
