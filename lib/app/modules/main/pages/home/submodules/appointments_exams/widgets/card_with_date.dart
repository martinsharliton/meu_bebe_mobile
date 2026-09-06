import 'package:flutter/material.dart';

import '../../../../../widgets/base_card.dart';

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

  Future<void> _showDeleteConfirmation(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final colorScheme = Theme.of(dialogContext).colorScheme;

        return AlertDialog(
          icon: Icon(Icons.delete_outline_rounded, color: colorScheme.error, size: 32),
          title: const Text('Excluir registro?', textAlign: TextAlign.center),
          content: Text('Esta ação excluirá “$title” permanentemente.', textAlign: TextAlign.center),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            OutlinedButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('Cancelar')),
            ElevatedButton(
              style: FilledButton.styleFrom(backgroundColor: colorScheme.error, foregroundColor: colorScheme.onError),
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BaseCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(14)),
            child: Icon(Icons.event_note_rounded, color: colorScheme.onPrimaryContainer),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),

                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant, height: 1.4),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 14, color: colorScheme.onSurfaceVariant),
                      const SizedBox(width: 5),
                      Text(
                        date,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          IconButton(
            tooltip: 'Excluir',
            onPressed: () => _showDeleteConfirmation(context),
            icon: const Icon(Icons.delete_outline_rounded),
            color: colorScheme.error,
          ),
        ],
      ),
    );
  }
}
