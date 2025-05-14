import 'package:flutter/material.dart';

class CryptoAsset {
  final String name;
  final String balance;
  final String localValue;
  final String network;
  final IconData icon;
  final Color iconColor;

  CryptoAsset({
    required this.name,
    required this.balance,
    required this.localValue,
    required this.network,
    required this.icon,
    required this.iconColor,
  });
}
