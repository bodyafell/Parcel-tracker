import 'package:flutter/material.dart';

class CarrierLogo extends StatelessWidget {
  final String code;
  final double size;

  const CarrierLogo({super.key, required this.code, this.size = 48});

  @override
  Widget build(BuildContext context) {
    final (assetPath, backgroundColor) = switch (code) {
      'NP' => ('assets/images/np_icon.png', const Color(0xFFFAECEC)),
      'UP' => ('assets/images/up_icon.png', const Color(0xFFFFF7DB)),
      'MEEST' => ('assets/images/m_icon.png', const Color(0xFFE8F1FC)),
      _ => throw ArgumentError.value(code, 'code', 'Unknown carrier code'),
    };

    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size * 0.29),
      ),
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }
}
