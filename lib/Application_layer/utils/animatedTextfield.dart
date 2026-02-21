import 'package:flutter/material.dart';

import '../constants/custom_textfield.dart';

class AnimatedBorderTextField extends StatefulWidget {

  final TextEditingController? controller;
  final String? labelText;

  AnimatedBorderTextField({this.controller, this.labelText});

  @override
  _AnimatedBorderTextFieldState createState() => _AnimatedBorderTextFieldState();
}

class _AnimatedBorderTextFieldState extends State<AnimatedBorderTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final double borderRadius = 21;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomTextFormField(
          controller: widget.controller!,
          labelText: '${widget.labelText}',
        ),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: _RoundedBorderPainter(
                  progress: _animation.value,
                  borderRadius: borderRadius,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _RoundedBorderPainter extends CustomPainter {
  final double progress;
  final double borderRadius;

  _RoundedBorderPainter({required this.progress, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final rrect = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius));

    final path = Path()..addRRect(rrect);

    // Get total length of path
    final metrics = path.computeMetrics().first;
    final totalLength = metrics.length;

    final start = progress * totalLength;
    final end = start + 200; // line length

    canvas.drawPath(
      metrics.extractPath(start % totalLength, end % totalLength),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _RoundedBorderPainter oldDelegate) => true;
}