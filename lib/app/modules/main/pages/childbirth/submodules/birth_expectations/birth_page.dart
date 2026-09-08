import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/ui/theme/styles/colors_app.dart';
import '../../../../../../core/ui/theme/styles/design_tokens.dart';
import '../../../../../../core/ui/theme/styles/text_styles.dart';
import '../../../../../../model/plano_parto/plano_parto_enums.dart';
import '../../../../../formulario/widgets/dss_question.dart';
import '../../../../widgets/base_card.dart';
import 'birth_controller.dart';

class BirthPage extends StatefulWidget {
  const BirthPage({super.key});

  @override
  State<BirthPage> createState() => _BirthPageState();
}

class _BirthPageState extends State<BirthPage> {
  final _controller = Modular.get<BirthController>();

  @override
  void initState() {
    super.initState();
    _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;

    return Observer(
      builder: (_) {
        if (_controller.saved) {
          _controller.saved = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Modular.to.pop();
          });
        }
        return Scaffold(
          appBar: AppBar(title: Text('Nascimento', style: textStyles.titleSmallStyle), centerTitle: true),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: Spacing.pageH, vertical: Spacing.pageV),
            child: SingleChildScrollView(
              child: BaseCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expectativas para o nascimento', style: textStyles.titleSmallStyle),
                    SizedBox(height: Spacing.lg),

                    DssQuestionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quem cortará o cordão umbilical?',
                            style: textStyles.textStyle.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: Spacing.sm),
                          _buildActorTabBar(_controller.quemCortaCordao, _controller.setQuemCortaCordao),
                        ],
                      ),
                    ),

                    SizedBox(height: Spacing.sm),

                    DssQuestionCard(
                      child: _buildSwitchTile(
                        'Coleta de células-tronco?',
                        _controller.coletaCelulasTronco,
                        _controller.setColetaCelulasTronco,
                      ),
                    ),

                    SizedBox(height: Spacing.sm),

                    DssQuestionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Contato pele a pele?', style: textStyles.textStyle.copyWith(color: Colors.black)),
                          SizedBox(height: Spacing.sm),
                          _buildTriTabBar(_controller.contatoPeleAPele, _controller.setContatoPeleAPele),
                        ],
                      ),
                    ),

                    SizedBox(height: Spacing.sm),

                    DssQuestionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amamentação na primeira hora?',
                            style: textStyles.textStyle.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: Spacing.sm),
                          _buildTriTabBar(_controller.amamentarPrimeiraHora, _controller.setAmamentarPrimeiraHora),
                        ],
                      ),
                    ),

                    SizedBox(height: Spacing.sm),

                    DssQuestionCard(
                      child: _buildSwitchTile(
                        'Restrições à amamentação?',
                        _controller.restricoesAmamentacao,
                        _controller.setRestricoesAmamentacao,
                      ),
                    ),

                    SizedBox(height: Spacing.sm),

                    DssQuestionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Primeiro banho do bebê por?', style: textStyles.textStyle),
                          SizedBox(height: Spacing.sm),
                          _buildActorTabBar(_controller.primeiroBanho, _controller.setPrimeiroBanho),
                        ],
                      ),
                    ),

                    SizedBox(height: Spacing.xxl),
                    _saveButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActorTabBar(ActorChoice selected, ValueChanged<ActorChoice> onSelect) {
    return Wrap(
      spacing: Spacing.sm,
      runSpacing: Spacing.sm,
      children: ActorChoice.values.map((value) {
        return DssMultiOption<ActorChoice>(
          option: value,
          label: value.label,
          selected: selected == value,
          exclusive: false,
          onTap: () => onSelect(value),
        );
      }).toList(),
    );
  }

  Widget _buildTriTabBar(TriState selected, ValueChanged<TriState> onSelect) {
    return Row(
      spacing: Spacing.sm,
      children: TriState.values.map((value) {
        return Expanded(
          child: DssMultiOption<TriState>(
            option: value,
            label: value.label,
            selected: selected == value,
            exclusive: false,
            onTap: () => onSelect(value),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSwitchTile(String label, bool value, ValueChanged<bool> onChanged) {
    return Material(
      color: Colors.transparent,
      child: SwitchListTile(
        title: Text(label, style: context.textStyles.textStyle.copyWith(color: Colors.black)),
        value: value,
        onChanged: onChanged,
        activeThumbColor: context.colors.text,
        contentPadding: EdgeInsets.zero,
        dense: true,
      ),
    );
  }

  SizedBox _saveButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: _controller.saveBirth,
        icon: const Icon(Icons.save, size: 18),
        label: const Text('Salvar'),
      ),
    );
  }
}
