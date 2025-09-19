import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../../app_module.dart';
import '../../core/extensions/size_extension.dart';
import '../../core/helpers/messages.dart';
import '../../core/theme/app_theme.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final controller = Modular.get<LoginController>();

  @override
  void initState() {
    super.initState();
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
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(28),
            constraints: BoxConstraints(
              maxWidth: 420,
              minWidth: 320,
              minHeight: context.screenHeight * 0.65,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo_app.png',
                      height: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'Olá, Mamãe 👋',
                      style: AppTheme.titleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 36),

                  // E-mail
                  TextFormField(
                    controller: emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Senha
                  Watch((_) {
                    return TextFormField(
                      controller: passwordEC,
                      obscureText: controller.obscurePassword,
                      validator: Validatorless.required('Senha obrigatória'),
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppTheme.secondaryColor,
                          ),
                          onPressed: controller.passwordToggle,
                        ),
                        filled: true,
                        fillColor: Colors.blue.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 12),

                  // Esqueceu a senha
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () async {
                        Messages.showError(
                          'Funcionalidade ainda não implementada',
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppTheme.textColor,
                      ),
                      child: const Text('Esqueceu a senha?'),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botão Entrar
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.titleStyle.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
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
                        'ENTRAR',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Criar conta
                  TextButton(
                    onPressed: () {
                      Modular.to.pushNamed(routeForm);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppTheme.textColor,
                    ),
                    child: const Text(
                      'Não possui conta? Cadastre-se',
                      style: TextStyle(fontSize: 15),
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
