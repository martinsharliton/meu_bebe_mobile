// lib/modules/login/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../../app_module.dart';
import '../../core/helpers/messages.dart';
import '../../core/theme/app_theme.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailEC;
  late final TextEditingController passwordEC;
  late final LoginController controller;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailEC = TextEditingController();
    passwordEC = TextEditingController();
    controller = Modular.get<LoginController>();

    effect(() {
      if (controller.logged) {
        Navigator.of(context).pushReplacementNamed(routeTab);
      }
    });
  }

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20, offset: const Offset(0, 8)),
              ],
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/logo_app.png', height: 120),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextFormField(
                      controller: emailEC,
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido'),
                      ]),
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        prefixIcon: const Icon(Icons.email_outlined, color: AppTheme.darkTextColor),
                        filled: true,
                        fillColor: Colors.blue.shade50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: TextFormField(
                      controller: passwordEC,
                      obscureText: controller.obscurePassword,
                      validator: Validatorless.required('Senha obrigatória'),
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.lock_outline, color: AppTheme.darkTextColor),
                        suffixIcon: IconButton(
                          icon: Watch((context) {
                            return Icon(
                              controller.obscurePassword ? Icons.visibility : Icons.visibility_off,
                              color: AppTheme.darkTextColor,
                            );
                          }),
                          onPressed: controller.passwordToggle,
                        ),
                        filled: true,
                        fillColor: Colors.blue.shade50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          Messages.showError('Funcionalidade ainda não implementada');
                        },
                        style: TextButton.styleFrom(foregroundColor: AppTheme.textColor),
                        child: const Text('Esqueceu a senha?', style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.titleStyle.color,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 4,
                        ),
                        onPressed: () {
                          // final valid = formKey.currentState?.validate() ?? false;
                          // if (valid) {
                          //   controller.login(emailEC.text, passwordEC.text);
                          // }
                          controller.debug();
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: TextButton(
                      onPressed: () {
                        Modular.to.pushNamed(routeForm);
                      },
                      style: TextButton.styleFrom(foregroundColor: AppTheme.textColor, elevation: 4),
                      child: const Text(
                        'Não possui conta? Cadastre-se',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
