// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:async';

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  const DelayedAnimation({ required this.child, required this.delay});

  @override
  DelayedAnimationState createState() => DelayedAnimationState();
}

class DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _animOffset;

  @override

  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    final curve = CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate
    );
    _animOffset = Tween<Offset>(
      begin: Offset(0.0, -0.35),
      end: Offset.zero,
    ).animate(curve);
    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }
    Widget build(BuildContext context) {
      return FadeTransition(
        opacity: _controller,
        child: SlideTransition(
          position: _animOffset,
          child: widget.child,),
      );
    }
  }