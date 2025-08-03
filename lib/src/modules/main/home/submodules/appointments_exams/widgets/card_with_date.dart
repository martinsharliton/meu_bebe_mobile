import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../widgets/base_card.dart';

class CardWithDate extends StatelessWidget {
  const CardWithDate({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    required this.onTap,
  });

  final String title;
  final String date;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'Deseja excluir?',
                  style: AppTheme.titleSmallStyle,
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Não'),
                  ),
                  TextButton(
                    onPressed: () {
                      onTap();
                      Navigator.pop(context);
                    },
                    child: const Text('Sim'),
                  ),
                ],
              ),
            );
          },
          child: BaseCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.subTitleStyle,
                    ),
                    Text(date, style: AppTheme.textStyle),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(description, style: AppTheme.textStyle),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
