import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../core/helpers/messages.dart';
import '../../../core/theme/app_theme.dart';
import '../custom_tab_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with MessageViewMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final CustomTabController _controller = Injector.get<CustomTabController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildContent();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildContent() {
    return Watch((_) {
      if (!mounted) return const SizedBox.shrink();

      final name = _controller.name;
      final firstLetter = name.isNotEmpty ? name[0].toUpperCase() : '';

      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: AppTheme.secondaryColor,
              child: CircleAvatar(
                radius: 64,
                backgroundColor: AppTheme.darkTextColor,
                child: Text(
                  firstLetter,
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              name,
              style: AppTheme.titleSmallStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: AppTheme.darkTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            _buildTileButton(
              icon: Icons.person,
              text: 'Meus dados',
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   '/profile-data',
                // ).then((_) => _controller.initialize());
              },
            ),
            _buildTileButton(
              icon: Icons.notifications,
              text: 'Notificações',
              onTap: () {},
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTileButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Icon(icon, size: 25, color: AppTheme.darkTextColor),
                const SizedBox(width: 16),
                Text(
                  text,
                  style: AppTheme.subTitleStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppTheme.darkTextColor,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.chevron_right,
                  color: AppTheme.darkTextColor.withValues(alpha: 0.6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
