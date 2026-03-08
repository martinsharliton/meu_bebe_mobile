import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../core/extensions/size_extension.dart';
import '../../../../../core/ui/theme/app_theme.dart';
import '../../../../../model/pregnant_data.dart';
import '../../../../../model/user_data.dart';
import 'profile_data_controller.dart';
import 'profile_form_controller.dart';
import 'widgets/custom_drop_down.dart';
import 'widgets/custom_text_field.dart';

class ProfileDataPage extends StatefulWidget {
  const ProfileDataPage({super.key});

  @override
  State<ProfileDataPage> createState() => _ProfileDataPageState();
}

class _ProfileDataPageState extends State<ProfileDataPage> with ProfileFormController {
  late final ProfileDataController controller;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    controller = Modular.get<ProfileDataController>();

    controller.initialize().then((_) {
      initializeForm(controller.pregnant, controller.user);
    });
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(
          builder: (_) {
            return Text(controller.formEnabled ? 'Alterar Dados' : 'Meus Dados', style: AppTheme.titleSmallStyle);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: context.screenWidth,
              alignment: Alignment.topCenter,
              color: AppTheme.secondaryColor,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            spacing: 12.5,
                            children: [
                              _nameField(),
                              _socialNameField(),
                              _birthDateField(),
                              _cpfField(),
                              _emailField(),
                              _cnsField(),
                              _prenatalPlaceField(),
                              _maritalStatusField(),
                              _educationField(),
                              _incomeField(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Observer(
                    builder: (context) {
                      return Container(
                        color: AppTheme.secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                          child: controller.formEnabled ? _saveButton() : _editButton(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------- Fields ----------
  Widget _nameField() => CustomTextField(
    controller: controller,
    textController: nameEC,
    label: 'Nome',
    validator: Validatorless.required('Nome obrigatório'),
    textCapitalization: TextCapitalization.words,
  );

  Widget _socialNameField() => CustomTextField(
    controller: controller,
    textController: socialNameEC,
    label: 'Nome social',
    textCapitalization: TextCapitalization.words,
  );

  Widget _birthDateField() => CustomTextField(
    controller: controller,
    textController: birthdayEC,
    label: 'Data de nascimento',
    validator: Validatorless.required('Data de nascimento obrigatória'),
    keyboardType: TextInputType.datetime,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly, DataInputFormatter()],
  );

  Widget _cpfField() => CustomTextField(
    controller: controller,
    textController: cpfEC,
    label: 'CPF',
    validator: Validatorless.required('CPF obrigatório'),
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly, CpfInputFormatter()],
  );

  Widget _emailField() => CustomTextField(
    controller: controller,
    textController: emailEC,
    label: 'E-mail',
    validator: Validatorless.multiple([
      Validatorless.required('E-mail obrigatório'),
      Validatorless.email('O conteúdo não é um e-mail'),
    ]),
    keyboardType: TextInputType.emailAddress,
  );

  Widget _cnsField() => CustomTextField(
    controller: controller,
    textController: nationalHealthCardEC,
    label: 'Número do Cartão Nacional de Saúde',
    keyboardType: TextInputType.number,
  );

  Widget _prenatalPlaceField() =>
      CustomTextField(controller: controller, textController: prenatalPlaceEC, label: 'Local que realiza o pré-natal');

  Widget _maritalStatusField() =>
      CustomDropDown(label: 'Estado civil', textController: maritalStatusEC, type: 0, controller: controller);

  Widget _educationField() =>
      CustomDropDown(label: 'Nível de escolaridade', textController: educationEC, type: 1, controller: controller);

  Widget _incomeField() =>
      CustomDropDown(label: 'Renda familiar', textController: incomeEC, type: 2, controller: controller);

  // -------- Buttons ----------
  SizedBox _saveButton() => _actionButton(
    label: 'Salvar',
    onPressed: () async {
      FocusScope.of(context).unfocus();
      final valid = formKey.currentState?.validate() ?? false;
      if (!valid) return;

      final success = await controller.saveProfile(
        PregnantData(
          id: controller.pregnant?.id ?? 0,
          name: nameEC.text,
          socialName: socialNameEC.text,
          birthDate: birthdayEC.text,
          cpf: cpfEC.text,
          nationalHealthCard: nationalHealthCardEC.text,
          prenatalPlace: prenatalPlaceEC.text,
          professionalName: controller.pregnant?.professionalName,
          prenatalPlaceContact: controller.pregnant?.prenatalPlaceContact,
        ),
        UserData(
          id: controller.user?.id ?? 0,
          name: controller.user?.name ?? '',
          email: emailEC.text,
          phone: controller.user?.phone,
        ),
      );

      if (success) controller.setFormEnabled(false);
    },
  );

  SizedBox _editButton() => _actionButton(label: 'Editar', onPressed: () => controller.setFormEnabled(true));

  SizedBox _actionButton({required String label, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(onPressed: onPressed, child: Text(label)),
    );
  }
}
