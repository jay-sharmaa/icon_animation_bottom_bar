import 'package:flutter/material.dart';

class BottomBarItem {
  final IconData icon;
  final String label;

  BottomBarItem({required this.icon, required this.label});
}

class IconAnimationBottomBar extends StatefulWidget {
  final List<BottomBarItem> items;
  final int selectedIndex;
  final void Function(int) onTap;
  final Widget floatingWidget;
  final Color iconSelectedColor;
  final Color iconColor;
  final Color textSelectedColor;
  final Color textColor;
  final Color backGroundColor;
  final int duration;
  final Curve curve;
  final double textSize;
  final double iconSize;
  final double verticalPadding;
  final double bottomBarHeight;
  final double alignParameter;

  const IconAnimationBottomBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    required this.floatingWidget, 
    this.iconSelectedColor = Colors.blue, 
    this.iconColor = Colors.black, 
    this.textSelectedColor = Colors.blue, 
    this.textColor = Colors.black,
    this.backGroundColor = Colors.white,
    this.duration = 300,
    this.curve = Curves.easeInOut,
    this.textSize = 24,
    this.iconSize = 24,
    this.verticalPadding = 8,
    this.bottomBarHeight = 80,
    this.alignParameter = 15
  });

  @override
  State<IconAnimationBottomBar> createState() =>
      _IconAnimationBottomBarState();
}

class _IconAnimationBottomBarState extends State<IconAnimationBottomBar>
    with SingleTickerProviderStateMixin {
  late double _floatingPosition;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _floatingPosition = widget.selectedIndex.toDouble();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    _animation = Tween<double>(
      begin: _floatingPosition,
      end: _floatingPosition,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void didUpdateWidget(covariant IconAnimationBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _animateTo(widget.selectedIndex.toDouble());
    }
  }

  void _animateTo(double newPosition) {
    _animation = Tween<double>(
      begin: _floatingPosition,
      end: newPosition,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve))
      ..addListener(() => setState(() {}));
    _controller.forward(from: 0);
    _floatingPosition = newPosition;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / widget.items.length;
    return SizedBox(
      height: widget.bottomBarHeight,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
              decoration: BoxDecoration(
                color: widget.backGroundColor,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(widget.items.length, (index) {
                  final item = widget.items[index];
                  final isSelected = index == widget.selectedIndex;

                  return GestureDetector(
                    onTap: () => widget.onTap(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item.icon,
                          size: widget.iconSize,
                          color: isSelected ? widget.iconSelectedColor : widget.iconColor,
                        ),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize: widget.textSize,
                            color: isSelected ? widget.textSelectedColor : widget.textColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
            Positioned(
              top: 5,
              left: _animation.value * itemWidth + itemWidth / 2 - widget.alignParameter,
              child: widget.floatingWidget,
            ),
        ],
      ),
    );
  }
}
