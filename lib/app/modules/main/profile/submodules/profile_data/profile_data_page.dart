import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../core/app_database.dart';
import '../../../../../core/extensions/size_extension.dart';
import '../../../../../core/helpers/messages.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../model/gestation/pregnant_model.dart';
import '../../../../../model/user/user_model.dart';
import '../../../widgets/base_card.dart';
import 'profile_data_controller.dart';
import 'profile_form_controller.dart';
import 'widgets/custom_drop_down.dart';
import 'widgets/custom_text_field.dart';

class ProfileDataPage extends StatefulWidget {
  const ProfileDataPage({super.key});

  @override
  State<ProfileDataPage> createState() => _ProfileDataPageState();
}

class _ProfileDataPageState extends State<ProfileDataPage>
    with ProfileFormController, MessageViewMixin {
  final formKey = GlobalKey<FormState>();

  final _controller = Modular.get<ProfileDataController>();

  @override
  void initState() {
    super.initState();
    if (mounted) messageListener(_controller);
    _controller.initialize().then((_) {
      initializeForm(_controller.pregnant, _controller.user);
    });
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar, body: _content);
  }

  AppBar get _buildAppBar => AppBar(
    title: Watch(
      (_) => Text(
        _controller.formEnabled ? 'Alterar Dados' : 'Meus Dados',
        style: AppTheme.titleSmallStyle,
      ),
    ),
    centerTitle: true,
  );

  Widget get _content => Column(
    children: [
      Expanded(
        child: Container(
          width: context.screenWidth,
          alignment: Alignment.topCenter,
          color: AppTheme.secondaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildFields],
          ),
        ),
      ),
    ],
  );

  Widget get _buildFields {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: BaseCard(
            child: Form(
              key: formKey,
              child: Watch(
                (_) => Column(
                  spacing: 12.5,
                  children: [
                    CustomTextField(
                      controller: _controller,
                      textController: nameEC,
                      label: 'Nome',
                      validator: Validatorless.required('Nome obrigatório'),
                      textCapitalization: TextCapitalization.words,
                    ),
                    CustomTextField(
                      controller: _controller,
                      textController: socialNameEC,
                      label: 'Nome social',
                      textCapitalization: TextCapitalization.words,
                    ),
                    CustomTextField(
                      controller: _controller,
                      textController: birthdayEC,
                      label: 'Data de nascimento',
                      validator: Validatorless.required(
                        'Data de nascimento obrigatória',
                      ),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter(),
                      ],
                    ),
                    CustomTextField(
                      controller: _controller,
                      textController: cpfEC,
                      label: 'CPF',
                      validator: Validatorless.required('CPF obrigatório'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                    ),
                    CustomTextField(
                      controller: _controller,
                      textController: emailEC,
                      label: 'E-mail',
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('O conteúdo não é um e-mail'),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      controller: _controller,
                      textController: nationalHealthCardEC,
                      label: 'Número do Cartão Nacional de Saúde',
                      keyboardType: TextInputType.number,
                    ),

                    CustomTextField(
                      controller: _controller,
                      textController: prenatalPlaceEC,
                      label: 'Local que realiza o pré-natal',
                    ),
                    CustomDropDown(
                      label: 'Estado civil',
                      textController: maritalStatusEC,
                      type: 0,
                      controller: _controller,
                    ),
                    CustomDropDown(
                      label: 'Nível de escolaridade',
                      textController: educationEC,
                      type: 1,
                      controller: _controller,
                    ),
                    CustomDropDown(
                      label: 'Renda familiar',
                      textController: incomeEC,
                      type: 2,
                      controller: _controller,
                    ),
                    _controller.formEnabled ? _saveButton() : _editButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _saveButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          final valid = formKey.currentState?.validate() ?? false;
          if (valid) {
            final sucess = await _controller.saveProfile(
              PregnantModel(
                name: nameEC.text,
                socialName: socialNameEC.text,
                birthDate: birthdayEC.text,
                cpf: cpfEC.text,
                nationalHealthCardNumber: nationalHealthCardEC.text,
                preNatalPlace: prenatalPlaceEC.text,
                profissionalName: _controller.pregnant?.profissionalName,
                prenatalPlaceContact:
                    _controller.pregnant?.prenatalPlaceContact,
              ),
              UserData(
                id: 0,
                email: emailEC.text,
                maritalStatus: maritalStatusEC.text.isEmpty
                    ? null
                    : MaritalStatus.values[int.parse(maritalStatusEC.text)],
                education: educationEC.text.isEmpty
                    ? null
                    : Education.values[int.parse(educationEC.text)],
                familyIncome: incomeEC.text.isEmpty
                    ? null
                    : FamilyIncome.values[int.parse(incomeEC.text)],
              ),
            );
            if (sucess) _controller.setFormEnabled(false);
          }
        },
        child: const Text('Salvar'),
      ),
    );
  }

  SizedBox _editButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          _controller.setFormEnabled(true);
        },
        child: const Text('Editar'),
      ),
    );
  }
}
