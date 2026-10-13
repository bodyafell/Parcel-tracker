import 'package:flutter/material.dart';

class Parcel {
  final String title;
  final String trackingNumber;
  final String carrier;
  final String statusText;
  final Color statusBg;
  final Color statusTextColor;
  final String dateText;
  final String logoCode; // 'NP', 'UP', 'MEEST'

  const Parcel({
    required this.title,
    required this.trackingNumber,
    required this.carrier,
    required this.statusText,
    required this.statusBg,
    required this.statusTextColor,
    required this.dateText,
    required this.logoCode,
  });
}