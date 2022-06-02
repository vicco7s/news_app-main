import 'package:aplikasi_berita/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Error extends StatelessWidget {
  final String message;
  Error({required this.message});
  @override
  Widget build(BuildContext context) {
    return _buildError(context, message);
  }

  Widget _buildError(BuildContext context, String message) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Lottie.asset(
        'assets/error.json',
        width: 250,
        height: 200,
        fit: BoxFit.fill,
        repeat: false,
        reverse: false,
        animate: false,
      ),
      const SizedBox(height: 8),
      Text(message, style: primaryTextStyle)
    ]));
  }
}
