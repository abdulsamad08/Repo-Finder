import 'package:flutter/material.dart';

extension SpacingExtension on Widget {
  // vertical space
  Widget get shortSpace => const SizedBox(height: 5);

  // horizontal space
  Widget get shortSpaceh => const SizedBox(width: 5);

  // vertical space
  Widget get smallSpace => const SizedBox(height: 10);

  // vertical space (two)
  Widget get smallSpaceTwo => const SizedBox(height: 16);

  // Mvertical space
  Widget get mediumSpace => const SizedBox(height: 25);

  // vertical space
  Widget get largeSpace => const SizedBox(height: 35);
}
