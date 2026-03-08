import 'package:flutter/material.dart';

import '../../../../core/ui/theme/app_theme.dart';

class ItemTabPage extends StatefulWidget {
  final String title;
  final List<Widget> children;
  const ItemTabPage({super.key, required this.title, required this.children});

  @override
  State<ItemTabPage> createState() => _ItemTabPageState();
}

class _ItemTabPageState extends State<ItemTabPage> {
  String get title => widget.title;
  List<Widget> get children => widget.children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
          child: Text(title, style: AppTheme.titleStyle.copyWith(fontSize: 28, color: AppTheme.darkTextColor)),
        ),
        Expanded(child: ListView(shrinkWrap: true, children: children)),
      ],
    );
  }
}
