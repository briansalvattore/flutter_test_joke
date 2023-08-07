import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({required this.tag, super.key});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(tag),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
