import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:univalle_estereo/providers/providers.dart';

class DiscoRotante extends StatefulWidget {
  const DiscoRotante({
    super.key,
    this.estado = true,
  });
  final bool estado;
  @override
  State<DiscoRotante> createState() => _DiscoRotanteState();
}

class _DiscoRotanteState extends State<DiscoRotante>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RadioOnlineProvider radioOnlineProvider =
        Provider.of<RadioOnlineProvider>(context);
    if (widget.estado) {
      !radioOnlineProvider.estado ? _controller.stop() : _controller.repeat();
    }

    return AnimatedBuilder(
      animation: _controller,
      child: SizedBox(
        width: 250.0,
        height: 250.0,
        child: Image.asset(
          'assets/img/disco.png',
          fit: BoxFit.contain,
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
