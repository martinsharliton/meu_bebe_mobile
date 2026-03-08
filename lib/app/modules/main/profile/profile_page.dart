import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_module.dart';
import '../../../core/extensions/size_extension.dart';
import '../../../core/ui/theme/app_theme.dart';
import '../main_controller.dart';
import 'widgets/tile_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final GlobalKey<FormState> formKey;
  late final MainController controller;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    controller = Modular.get<MainController>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Observer(
            builder: (context) {
              final name = controller.name;
              final firstLetter = name.isNotEmpty ? name[0].toUpperCase() : '';

              return Container(
                width: context.screenWidth,
                color: AppTheme.secondaryColor,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        /// HEADER
                        Container(height: 100, width: context.screenWidth, color: AppTheme.primaryColor),

                        /// AVATAR
                        Transform.translate(
                          offset: const Offset(0, -50),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 51,
                              child: Text(
                                firstLetter,
                                style: const TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),

                        /// NAME
                        Text(
                          name.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w600),
                        ),

                        const SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                TileButton(
                                  icon: Icons.person,
                                  iconColor: AppTheme.darkTextColor,
                                  text: 'Meus Dados',
                                  onTap: _abrirDadosPerfil,
                                ),

                                const Divider(height: 1),

                                TileButton(
                                  icon: Icons.notifications,
                                  iconColor: AppTheme.darkTextColor,
                                  text: 'Notificações',
                                  onTap: () {},
                                ),

                                const Divider(height: 1),

                                TileButton(
                                  icon: Icons.settings,
                                  iconColor: AppTheme.darkTextColor,
                                  text: 'Configurações',
                                  onTap: () {},
                                ),
                                const Divider(height: 1),

                                TileButton(
                                  icon: Icons.logout,
                                  iconColor: AppTheme.darkTextColor,
                                  text: 'Sair',
                                  onTap: () {
                                    Modular.to.navigate(routeLogin);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
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
