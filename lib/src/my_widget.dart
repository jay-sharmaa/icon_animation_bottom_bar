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

  final Widget? floatingWidget;

  const IconAnimationBottomBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
    this.floatingWidget,
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
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(
      begin: _floatingPosition,
      end: _floatingPosition,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
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
      height: 80,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
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
                          size: 24,
                          color: isSelected ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),

          if (widget.floatingWidget != null)
            Positioned(
              top: 5,
              left: _animation.value * itemWidth + itemWidth / 2 - 15,
              child: widget.floatingWidget!,
            ),
        ],
      ),
    );
  }
}
