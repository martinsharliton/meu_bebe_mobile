import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../app_module.dart';
import '../../../core/extensions/size_extension.dart';
import '../../../core/theme/app_theme.dart';
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
    // 🔥 se o controller NÃO for singleton, pode forçar descarte aqui também:
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Watch((_) {
            if (!mounted) return const SizedBox.shrink();

            final name = controller.name;
            final firstLetter = name.isNotEmpty ? name[0].toUpperCase() : '';

            return ListView(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: _abrirDadosPerfil,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(height: 100, width: context.screenWidth, color: Colors.white70),
                          Positioned(
                            bottom: -40,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                InkWell(
                                  onTap: _abrirDadosPerfil,
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 51,
                                      child: Text(
                                        firstLetter,
                                        style: const TextStyle(
                                          fontSize: 50,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 4,
                                  right: 4,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: AppTheme.textColor, // 🔵 cor de fundo do botão
                                    child: const Icon(
                                      Icons.edit,
                                      size: 14,
                                      color: Colors.white, // ⚪ ícone branco
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65, left: 15, right: 15),
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TileButton(icon: Icons.notifications, text: 'Notificações', onTap: () {}),
                    ),
                  ],
                ),
              ],
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
