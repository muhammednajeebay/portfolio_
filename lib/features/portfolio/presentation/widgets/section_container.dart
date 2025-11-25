import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final bool spacerBelow;
  const SectionContainer(
      {super.key, required this.child, this.spacerBelow = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 12),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1040),
        child: child,
      ),
    );
  }
}
