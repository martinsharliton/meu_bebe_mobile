import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/ui/theme/styles/design_tokens.dart';
import '../../../../../../core/ui/theme/styles/text_styles.dart';
import '../../../../../../model/plano_parto/plano_parto_enums.dart';
import '../../../../../formulario/widgets/dss_question.dart';
import '../../../../widgets/base_card.dart';
import 'birth_moment_controller.dart';

class BirthMomentPage extends StatefulWidget {
  const BirthMomentPage({super.key});

  @override
  State<BirthMomentPage> createState() => _BirthMomentPageState();
}

class _BirthMomentPageState extends State<BirthMomentPage> {
  final formKey = GlobalKey<FormState>();
  final _controller = Modular.get<BirthMomentController>();
  final otherPositionEC = TextEditingController();
  late ReactionDisposer _reactionDisposer;

  @override
  void initState() {
    super.initState();
    // Hidrata apenas o texto livre da posição "Outra" (único campo não-enum)
    // quando o plano carrega. O restante do estado vive nos observables do
    // controller. Nenhum `setState`: o TextField escuta o próprio controller.
    _reactionDisposer = reaction((_) => _controller.plano, (plano) => otherPositionEC.text = plano?.outraPosicao ?? '');
    _controller.initialize();
  }

  @override
  void dispose() {
    _reactionDisposer();
    otherPositionEC.dispose();
    super.dispose();
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
          appBar: AppBar(title: Text('Momento do Parto', style: textStyles.titleSmallStyle), centerTitle: true),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: Spacing.pageH, vertical: Spacing.pageV),
            child: SingleChildScrollView(
              child: BaseCard(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Como você prefere ...', style: textStyles.titleSmallStyle),
                      SizedBox(height: Spacing.lg),

                      DssQuestionCard(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text('Via de parto?', style: textStyles.textStyle.copyWith(color: Colors.black)),
                            SizedBox(height: Spacing.sm),
                            _buildViaPartoTabBar(_controller.viaParto, _controller.setViaParto),
                          ],
                        ),
                      ),

                      SizedBox(height: Spacing.sm),

                      DssQuestionCard(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text('Anestesia?', style: textStyles.textStyle.copyWith(color: Colors.black)),
                            SizedBox(height: Spacing.sm),
                            _buildTriTabBar(_controller.anestesia, _controller.setAnestesia),
                          ],
                        ),
                      ),

                      SizedBox(height: Spacing.sm),

                      DssQuestionCard(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Corte vaginal (episiotomia)?',
                              style: textStyles.textStyle.copyWith(color: Colors.black),
                            ),
                            SizedBox(height: Spacing.sm),
                            _buildTriTabBar(_controller.corteVaginal, _controller.setCorteVaginal),
                          ],
                        ),
                      ),

                      SizedBox(height: Spacing.sm),

                      DssQuestionCard(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'Posição preferida para o parto?',
                              style: textStyles.textStyle.copyWith(color: Colors.black),
                            ),
                            SizedBox(height: Spacing.sm),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: PosicaoParto.values.map((p) => _buildPositionTab(p)).toList(),
                            ),
                            if (_controller.posicaoPreferida == PosicaoParto.outra) ...[
                              SizedBox(height: Spacing.sm),
                              Padding(
                                padding: EdgeInsets.only(top: Spacing.md),
                                child: TextFormField(
                                  controller: otherPositionEC,
                                  decoration: const InputDecoration(
                                    label: Text('Descreva a posição'),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
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
          ),
        );
      },
    );
  }

  Widget _buildViaPartoTabBar(ViaParto selected, ValueChanged<ViaParto> onSelect) {
    return Wrap(
      spacing: Spacing.sm,
      runSpacing: Spacing.sm,
      children: ViaParto.values.map((value) {
        return DssMultiOption<ViaParto>(
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

  Widget _buildPositionTab(PosicaoParto value) {
    return DssMultiOption<PosicaoParto>(
      option: value,
      label: value.label,
      selected: _controller.posicaoPreferida == value,
      exclusive: false,
      onTap: () => _controller.setPosicaoPreferida(value),
    );
  }

  SizedBox _saveButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () {
          FocusScope.of(context).unfocus();
          final isOutra = _controller.posicaoPreferida == PosicaoParto.outra;
          _controller.saveBirthMoment(
            outraPosicao: isOutra && otherPositionEC.text.trim().isNotEmpty ? otherPositionEC.text.trim() : null,
          );
        },
        icon: const Icon(Icons.save, size: 18),
        label: const Text('Salvar'),
      ),
    );
  }
}
