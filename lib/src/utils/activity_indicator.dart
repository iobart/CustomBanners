import 'package:flutter/material.dart';

const STROKE_WIDTH = 3.0;
const SIZE_ACTIVITY = 30.0;

class ActivityIndicator extends StatelessWidget {
  final double width;
  final double height;
  final double strokeWidth;

  const ActivityIndicator({
    Key? key,
    this.width = SIZE_ACTIVITY,
    this.height = SIZE_ACTIVITY,
    this.strokeWidth = STROKE_WIDTH,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
