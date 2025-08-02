import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/extensions/size_extension.dart';
import '../../../core/helpers/messages.dart';
import '../../../core/theme/app_theme.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final controller = Injector.get<LoginController>();

  @override
  void initState() {
    super.initState();
    effect(() {
      if (controller.logged) {
        Navigator.of(context).pushReplacementNamed('/tab/initial_homes/');
      }
    });
    messageListener(controller);
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
      body: _buildBody,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.secondaryColor,
        onPressed: () {
          controller.debug();
        },
        child: const Icon(Icons.bug_report),
      ),
    );
  }

  Widget get _buildBody => Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppTheme.secondaryColor,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        constraints: BoxConstraints(
          maxWidth: 400,
          minWidth: 300,
          minHeight: context.screenHeight * 0.7,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset('assets/images/baby_2.png', height: 120),
              ),
              const SizedBox(height: 24),
              const Text(
                'Olá, Mamãe👶',
                style: AppTheme.titleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: emailEC,
                validator: Validatorless.multiple([
                  Validatorless.required('E-mail obrigatório'),
                  Validatorless.email('E-mail inválido'),
                ]),
                decoration: _inputDecoration('E-mail'),
              ),
              const SizedBox(height: 24),
              Watch((_) {
                return TextFormField(
                  obscureText: controller.obscurePassword,
                  controller: passwordEC,
                  validator: Validatorless.required('Senha obrigatória'),
                  decoration: _inputDecoration('Senha').copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppTheme.secondaryColor,
                      ),
                      onPressed: controller.passwordToggle,
                    ),
                  ),
                );
              }),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.forgotMyPassword,
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.textColor,
                  ),
                  child: const Text('Esqueceu a senha?'),
                ),
              ),
              const SizedBox(height: 16),
              _loginButton,
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/auth/initial_form/form');
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.textColor,
                ),
                child: const Text('Não possui conta? Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  InputDecoration _inputDecoration(String label) => InputDecoration(
    labelText: label,
    filled: true,
    fillColor: Colors.blue.shade50,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  );

  Widget get _loginButton => SizedBox(
    height: 48,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppTheme.textColor),
      onPressed: () {
        // final valid = formKey.currentState?.validate() ?? false;
        // if (valid) {
        //   controller.login(emailEC.text, passwordEC.text);
        // }
        controller.debug();
      },
      child: const Text(
        'ENTRAR',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
