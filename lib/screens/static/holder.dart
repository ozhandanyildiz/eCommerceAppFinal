import 'package:flutter/material.dart';

import '../../widgets/bottomnavbar.dart';

class HolderScreen extends StatefulWidget {
  final Widget child;
  const HolderScreen({super.key, required this.child});

  @override
  State<HolderScreen> createState() => _HolderScreenState();
}

class _HolderScreenState extends State<HolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox.expand(
        child: widget.child,
      )),
    );
  }
}
