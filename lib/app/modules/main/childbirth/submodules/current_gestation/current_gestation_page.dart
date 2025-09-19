import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_core.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../database/database.dart';
import '../../../widgets/base_card.dart';
import 'current_gestation_controller.dart';
import 'current_gestation_form_controller.dart';

class CurrentGestationPage extends StatefulWidget {
  const CurrentGestationPage({super.key});

  @override
  State<CurrentGestationPage> createState() => _CurrentGestationPageState();
}

class _CurrentGestationPageState extends State<CurrentGestationPage>
    with CurrentGestationFormController {
  final formKey = GlobalKey<FormState>();
  final _controller = Modular.get<CurrentGestationController>();

  @override
  void initState() {
    super.initState();
    _controller.initialize().then((_) {
      initializeForm(_controller.model!);
    });
    
    effect(() {
      if (_controller.saved) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar, body: _buildBody);
  }

  AppBar get _buildAppBar {
    return AppBar(
      title: const Text('Gravidez Atual', style: AppTheme.titleSmallStyle),
      centerTitle: true,
    );
  }

  Widget get _buildBody {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SingleChildScrollView(
        child: BaseCard(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Sobre a minha gravidez',
                  style: AppTheme.titleSmallStyle,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  lastMenstrualPeriodEC,
                  'Data da última menstruação',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Em relação ao 1° ultrassom',
                  style: AppTheme.titleSmallStyle,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  firstUltrasoundEC,
                  'Data do primeiro ultrassom',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
                ),
                const SizedBox(height: 16),
                _saveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextField(
    TextEditingController controller,
    String label, {
    FormFieldValidator<String?>? validator,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization captalization = TextCapitalization.sentences,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(label: Text(label)),
      keyboardType: keyboardType,
      textCapitalization: captalization,
      inputFormatters: inputFormatters,
    );
  }

  Widget _saveButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
          final valid = formKey.currentState?.validate() ?? false;

          if (valid) {
            _controller.saveGestation(
              CurrentPregnancyData(
                id: 1,
                lastMenstrualPeriod: lastMenstrualPeriodEC.text.isEmpty
                    ? null
                    : lastMenstrualPeriodEC.text,
                firstUltrasound: firstUltrasoundEC.text.isEmpty
                    ? null
                    : firstUltrasoundEC.text,
              ),
            );
          }
        },
        child: const Text('Salvar'),
      ),
    );
  }
}
