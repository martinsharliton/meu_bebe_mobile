import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../app_module.dart';
import '../../../core/helpers/messages.dart';
import '../../../core/theme/app_theme.dart';
import '../main_controller.dart';
import 'widgets/tile_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with MessageViewMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Modular.get<MainController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Watch((_) {
            if (!mounted) return const SizedBox.shrink();

            final name = controller.name;
            final firstLetter = name.isNotEmpty ? name[0].toUpperCase() : '';

            return Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
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
                  TileButton(
                    icon: Icons.person,
                    text: 'Meus dados',
                    onTap: () async {
                      await _abrirDadosPerfil();
                    },
                  ),
                  TileButton(
                    icon: Icons.notifications,
                    text: 'Notificações',
                    onTap: () {},
                  ),
                ],
              ),
            );
          });
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<void> _abrirDadosPerfil() async {
    await Modular.to.pushNamed(routeDadosPerfil);
    controller.initialize();
  }
}
