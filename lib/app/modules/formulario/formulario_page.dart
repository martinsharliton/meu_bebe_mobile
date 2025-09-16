// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  FormularioPageState createState() => FormularioPageState();
}

class FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  // Dados do formulário
  String escolaridade = '';
  String escolaFrequenta = '';
  String dificuldadesEscolares = '';
  bool estuda = false;
  bool temDificuldadeEscola = false;

  String profissao = '';
  String tipoEmprego = '';
  String beneficiosTrabalho = '';
  bool empregado = false;
  bool ambienteSeguro = false;
  bool recebeBeneficioTrabalho = false;

  String fonteAgua = '';
  String tratamentoAgua = '';
  String destinoLixo = '';
  bool aguaPotavel = false;
  bool esgotoTratado = false;
  bool coletaLixoRegular = false;

  String distanciaUBS = '';
  String qualidadeAtendimento = '';
  String servicosUtilizados = '';
  bool acessoUBS = false;
  bool consultaRecente = false;
  bool temCartaoSUS = false;

  String tipoMoradia = '';
  String problemasHabitacionais = '';
  String energiaEletrica = '';
  bool estruturaAdequada = false;
  int pessoasPorComodo = 0;
  bool temEnergiaEletrica = false;

  String tiposAlimentos = '';
  String fontesAlimentacao = '';
  String programasAlimentacao = '';
  int refeicoesPorDia = 0;
  bool acessoAlimentos = false;
  bool participaProgramasAlimentacao = false;
  String destinoEsgoto = '';
  String coletaLixo = '';
  bool preocupacaoAgua = false;
  String cuidadosVetores = '';

  String faixaRenda = '';
  bool permitePreNatal = false;

  bool temPausas = false;
  bool recebeAuxilioMaternidade = false;
  bool recebeValeTransporte = false;
  bool recebeValeAlimentacao = false;
  String motivoDesemprego = '';
  bool recebeBeneficioSocial = false;
  String impactoGestacaoTrabalho = '';

  // Habitação

  int numeroComodos = 0;
  bool temAguaEncanada = false;
  bool temBanheiro = false;
  bool temCozinhaSeparada = false;
  String segurancaEstrutural = '';
  bool adaptacaoParaBebe = false;
  String melhoriasDesejadas = '';
  bool facilAcessoSaude = false;

  bool cadastradaUBS = false;
  String acessibilidadeUBS = '';
  bool preNatalMedico = false;
  bool preNatalEnfermagem = false;
  bool participaGrupoGestantes = false;
  bool examesPreNatalCompletos = false;
  bool vacinasEmDia = false;
  String avaliacaoPreNatal = '';
  String dificuldadesSaude = '';

  bool insegurancaAlimentar = false;
  bool consomeFrutasVerduras = false;
  bool consomeCarnes = false;
  bool consomeLeite = false;
  bool consomeFeijao = false;
  String fonteAlimentos = '';
  bool mudancaAlimentacaoGestacao = false;
  bool usaSuplementos = false;
  String avaliacaoAlimentacao = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Formulário'))),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Stepper horizontal personalizado
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    final isActive = index == _currentStep;
                    final isCompleted = index < _currentStep;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ), // espaçamento entre passos
                      child: InkWell(
                        onTap: () {
                          setState(() => _currentStep = index);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: isCompleted
                                    ? AppTheme.textColor
                                    : isActive
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey.shade300,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isActive
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.shade400,
                                ),
                              ),
                              child: isCompleted
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _getStepTitle(index),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isActive
                                    ? Theme.of(context).primaryColor
                                    : Colors.black54,
                                fontWeight: isActive
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const Divider(height: 1, thickness: 1),

            // Conteúdo do passo atual
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  //color: context.colors.background,
                  image: DecorationImage(
                    opacity: .05,
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/logo_app.png'),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: _buildCurrentStepContent(),
                ),
              ),
            ),

            // Botões de navegação
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => setState(() => _currentStep--),
                        child: const Text('Voltar'),
                      ),
                    ),
                  if (_currentStep < 5)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          //if (_formKey.currentState!.validate()) {
                          setState(() => _currentStep++);
                          //}
                        },
                        child: const Text('Próximo'),
                      ),
                    ),
                  if (_currentStep == 5)
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _submitForm();
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStepTitle(int index) {
    final titles = [
      'Educação',
      'Trabalho',
      'Saneamento',
      'Saúde',
      'Habitação',
      'Alimentação',
    ];
    return titles[index];
  }

  Widget _buildCurrentStepContent() {
    switch (_currentStep) {
      case 0:
        return _educacaoStep();
      case 1:
        return _trabalhoStep();
      case 2:
        return _saneamentoStep();
      case 3:
        return _saudeStep();
      case 4:
        return _habitacaoStep();
      case 5:
        return _alimentacaoStep();
      default:
        return Container();
    }
  }

  Widget _educacaoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Educação'),
        const SizedBox(height: 16),

        // Dados básicos de escolaridade
        SwitchListTile(
          title: const Text('Está estudando atualmente?'),
          value: estuda,
          onChanged: (val) => setState(() => estuda = val),
        ),
        const SizedBox(height: 16),

        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Qual seu grau de escolaridade?',
            border: OutlineInputBorder(),
            hintText: 'Ex: Ensino Médio Completo',
          ),
          validator: (value) =>
              value?.isEmpty ?? true ? 'Campo obrigatório' : null,
          onChanged: (val) => escolaridade = val,
        ),
        const SizedBox(height: 16),

        SwitchListTile(
          title: const Text(
            'Já teve que interromper os estudos por causa da gestação?',
          ),
          value: estuda,
          onChanged: (val) => setState(() => estuda = val),
        ),
        const SizedBox(height: 16),

        // Dificuldades de acesso
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Que dificuldades enfrenta no acesso à educação?',
            border: OutlineInputBorder(),
            hintText: 'Ex: Distância, custos, falta de vagas...',
          ),
          maxLines: 3,
          onChanged: (val) => dificuldadesEscolares = val,
        ),
        const SizedBox(height: 16),

        // Educação especial
        SwitchListTile(
          title: const Text(
            'Você consegue entender bem as orientações dos profissionais de saúde?',
          ),
          value: false,
          onChanged: (val) => setState(() {}),
        ),
        const SizedBox(height: 16),

        // Cursos extras
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Faz ou fez algum curso extracurricular?',
            border: OutlineInputBorder(),
            hintText: 'Ex: Idiomas, informática, cursos profissionalizantes...',
          ),
          onChanged: (val) => setState(() {}),
        ),
        const SizedBox(height: 16),

        // Expectativas educacionais
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Quais são suas expectativas/projetos educacionais?',
            border: OutlineInputBorder(),
            hintText: 'Ex: Concluir o ensino médio, entrar na faculdade...',
          ),
          maxLines: 3,
          onChanged: (val) => setState(() {}),
        ),
      ],
    );
  }

  Widget _trabalhoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Trabalho e Renda'),
        const SizedBox(height: 16),

        // Situação atual de trabalho
        SwitchListTile(
          title: const Text('Você está trabalhando atualmente?'),
          value: empregado,
          onChanged: (val) => setState(() => empregado = val),
        ),

        if (empregado) ...[
          const SizedBox(height: 16),

          // Tipo de emprego (Radio)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Qual o tipo do seu emprego?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Column(
                children: [
                  RadioGroup(
                    groupValue: tipoEmprego,
                    onChanged: (val) => setState(() => tipoEmprego = val ?? ''),
                    child: RadioListTile<String>(
                      title: const Text('Autônoma'),
                      value: 'Autônoma',
                    ),
                  ),
                  RadioGroup(
                    groupValue: tipoEmprego,
                    onChanged: (val) => setState(() => tipoEmprego = val ?? ''),
                    child: RadioListTile<String>(
                      title: const Text('Autônoma'),
                      value: 'Autônoma',
                    ),
                  ),
                  RadioGroup(
                    groupValue: tipoEmprego,
                    onChanged: (val) => setState(() => tipoEmprego = val ?? ''),
                    child: RadioListTile<String>(
                      title: const Text('Informal'),
                      value: 'Informal',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Renda (Dropdown)
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Qual sua faixa de renda mensal?',
              border: OutlineInputBorder(),
            ),
            initialValue: faixaRenda.isEmpty ? null : faixaRenda,
            items: const [
              DropdownMenuItem(
                value: 'Até 1 salário mínimo',
                child: Text('Até 1 salário mínimo'),
              ),
              DropdownMenuItem(
                value: '1-2 salários',
                child: Text('1-2 salários mínimos'),
              ),
              DropdownMenuItem(
                value: '2-3 salários',
                child: Text('2-3 salários mínimos'),
              ),
              DropdownMenuItem(
                value: 'Mais de 3 salários',
                child: Text('Mais de 3 salários mínimos'),
              ),
              DropdownMenuItem(
                value: 'Prefiro não informar',
                child: Text('Prefiro não informar'),
              ),
            ],
            onChanged: (val) => setState(() => faixaRenda = val ?? ''),
          ),
          const SizedBox(height: 16),

          // Condições de trabalho
          SwitchListTile(
            title: const Text(
              'Seu trabalho permite ir às consultas de pré-natal?',
            ),
            value: permitePreNatal,
            onChanged: (val) => setState(() => permitePreNatal = val),
          ),
          const SizedBox(height: 8),

          SwitchListTile(
            title: const Text(
              'Seu ambiente de trabalho é seguro para gestante?',
            ),
            subtitle: const Text(
              'Considerando esforço físico, produtos químicos, etc.',
            ),
            value: ambienteSeguro,
            onChanged: (val) => setState(() => ambienteSeguro = val),
          ),
          const SizedBox(height: 8),

          SwitchListTile(
            title: const Text(
              'Tem pausas para descanso e alimentação adequada?',
            ),
            value: temPausas,
            onChanged: (val) => setState(() => temPausas = val),
          ),
          const SizedBox(height: 16),

          // Benefícios (Checkbox)
          const Text(
            'Quais benefícios você recebe?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          CheckboxListTile(
            title: const Text('Auxílio-maternidade'),
            value: recebeAuxilioMaternidade,
            onChanged: (val) =>
                setState(() => recebeAuxilioMaternidade = val ?? false),
          ),
          CheckboxListTile(
            title: const Text('Vale-transporte'),
            value: recebeValeTransporte,
            onChanged: (val) =>
                setState(() => recebeValeTransporte = val ?? false),
          ),
          CheckboxListTile(
            title: const Text('Vale-alimentação/refeição'),
            value: recebeValeAlimentacao,
            onChanged: (val) =>
                setState(() => recebeValeAlimentacao = val ?? false),
          ),
        ],

        // Para quem não está empregada
        if (!empregado) ...[
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Por que não está trabalhando atualmente?',
              border: OutlineInputBorder(),
              hintText: 'Ex: Demissão, licença saúde, por causa da gravidez...',
            ),
            maxLines: 2,
            onChanged: (val) => motivoDesemprego = val,
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Já solicitou ou recebe algum benefício social?'),
            subtitle: const Text('Ex: Auxílio Brasil, Bolsa Família, etc.'),
            value: recebeBeneficioSocial,
            onChanged: (val) => setState(() => recebeBeneficioSocial = val),
          ),
        ],

        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Como a gestação afetou sua situação de trabalho?',
            border: OutlineInputBorder(),
            hintText: 'Ex: Mudou de função, reduziu carga horária...',
          ),
          maxLines: 3,
          onChanged: (val) => impactoGestacaoTrabalho = val,
        ),
      ],
    );
  }

  Widget _saneamentoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Saneamento Básico'),
        const SizedBox(height: 16),

        // Fonte de água (Dropdown)
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Qual a principal fonte de água da sua residência?',
            border: OutlineInputBorder(),
          ),
          validator: (value) => value == null ? 'Campo obrigatório' : null,
          initialValue: fonteAgua.isNotEmpty ? fonteAgua : null,
          items: const [
            DropdownMenuItem(
              value: 'Rede pública',
              child: Text('Rede pública'),
            ),
            DropdownMenuItem(
              value: 'Poço/Nascente',
              child: Text('Poço ou nascente'),
            ),
            DropdownMenuItem(value: 'Cisterna', child: Text('Cisterna')),
            DropdownMenuItem(value: 'Carro-pipa', child: Text('Carro-pipa')),
            DropdownMenuItem(value: 'Outra', child: Text('Outra fonte')),
          ],
          onChanged: (val) => setState(() => fonteAgua = val ?? ''),
        ),
        const SizedBox(height: 16),

        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Há interrupções frequentes no fornecimento de água?',
            border: OutlineInputBorder(),
          ),
          validator: (value) => value == null ? 'Campo obrigatório' : null,
          initialValue: fonteAgua.isNotEmpty ? fonteAgua : null,
          items: const [
            DropdownMenuItem(value: 'Sim', child: Text('Sim')),
            DropdownMenuItem(value: 'Não', child: Text('Não')),
            DropdownMenuItem(value: 'Sim', child: Text('Sim')),
            DropdownMenuItem(value: 'Não', child: Text('Não')),
          ],
          onChanged: (val) => setState(() => fonteAgua = val ?? ''),
        ),
        const SizedBox(height: 16),
        // Esgoto (Radio)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Como é o esgotamento sanitário na sua residência?',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                RadioGroup(
                  groupValue: destinoEsgoto,
                  onChanged: (val) => setState(() => destinoEsgoto = val ?? ''),
                  child: const RadioListTile<String>(
                    title: Text('Rede coletora'),
                    value: 'Rede coletora',
                  ),
                ),
                RadioGroup(
                  groupValue: destinoEsgoto,
                  onChanged: (val) => setState(() => destinoEsgoto = val ?? ''),
                  child: const RadioListTile<String>(
                    title: Text('Céu aberto/rio'),
                    value: 'Céu aberto',
                  ),
                ),
                RadioGroup(
                  groupValue: destinoEsgoto,
                  onChanged: (val) => setState(() => destinoEsgoto = val ?? ''),
                  child: const RadioListTile<String>(
                    title: Text('Outro'),
                    value: 'Outro',
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Coleta de lixo (Dropdown)
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Como é feita a coleta de lixo na sua comunidade?',
            border: OutlineInputBorder(),
          ),
          initialValue: coletaLixo.isNotEmpty ? coletaLixo : null,
          items: const [
            DropdownMenuItem(
              value: 'Coleta regular',
              child: Text('Coleta regular'),
            ),
            DropdownMenuItem(
              value: 'Coleta irregular',
              child: Text('Coleta irregular'),
            ),
            DropdownMenuItem(value: 'Queima', child: Text('Queima do lixo')),
            DropdownMenuItem(
              value: 'Terreno baldio',
              child: Text('Joga em terreno baldio'),
            ),
            DropdownMenuItem(value: 'Outro', child: Text('Outro método')),
          ],
          onChanged: (val) => setState(() => coletaLixo = val ?? ''),
        ),
        const SizedBox(height: 16),

        // Pergunta específica para gestantes
        SwitchListTile(
          title: const Text(
            textAlign: TextAlign.justify,
            'Já teve algum problema de saúde por conta da água?',
          ),
          value: preocupacaoAgua,
          onChanged: (val) => setState(() => preocupacaoAgua = val),
        ),
        const SizedBox(height: 16),

        // Controle de vetores
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Quais cuidados toma contra mosquitos/doenças?',
            border: OutlineInputBorder(),
            hintText: 'Ex: Telas, repelente, eliminação de criadouros...',
          ),
          maxLines: 2,
          onChanged: (val) => cuidadosVetores = val,
        ),
      ],
    );
  }

  Widget _saudeStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Saúde'),
        const SizedBox(height: 16),

        // Tipo de moradia (Dropdown)
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Há uma UBS próxima da sua casa?',
            border: OutlineInputBorder(),
          ),
          validator: (value) => value == null ? 'Campo obrigatório' : null,
          initialValue: tipoMoradia.isNotEmpty ? tipoMoradia : null,
          items: const [
            DropdownMenuItem(
              value: 'Casa de alvenaria',
              child: Text('Casa de alvenaria'),
            ),
            DropdownMenuItem(
              value: 'Casa de madeira',
              child: Text('Casa de madeira'),
            ),
            DropdownMenuItem(value: 'Apartamento', child: Text('Apartamento')),
            DropdownMenuItem(
              value: 'Cômodo único',
              child: Text('Cômodo único'),
            ),
            DropdownMenuItem(value: 'Outro', child: Text('Outro tipo')),
          ],
          onChanged: (val) => setState(() => tipoMoradia = val ?? ''),
        ),
        const SizedBox(height: 8),

        // Cartão SUS e cadastro
        SwitchListTile(
          title: const Text(
            textAlign: TextAlign.justify,
            'Já faltou a alguma consulta por dificuldade de transporte ou trabalho?',
          ),
          value: temCartaoSUS,
          onChanged: (val) => setState(() => temCartaoSUS = val),
        ),
        const SizedBox(height: 8),

        // Tipo de moradia (Dropdown)
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Como você costuma chegar a UBS?',
            border: OutlineInputBorder(),
          ),
          validator: (value) => value == null ? 'Campo obrigatório' : null,
          initialValue: tipoMoradia.isNotEmpty ? tipoMoradia : null,
          items: const [
            DropdownMenuItem(
              value: 'Casa de alvenaria',
              child: Text('Casa de alvenaria'),
            ),
            DropdownMenuItem(
              value: 'Casa de madeira',
              child: Text('Casa de madeira'),
            ),
            DropdownMenuItem(value: 'Apartamento', child: Text('Apartamento')),
            DropdownMenuItem(
              value: 'Cômodo único',
              child: Text('Cômodo único'),
            ),
            DropdownMenuItem(value: 'Outro', child: Text('Outro tipo')),
          ],
          onChanged: (val) => setState(() => tipoMoradia = val ?? ''),
        ),
        const SizedBox(height: 16),

        if (temCartaoSUS) ...[
          SwitchListTile(
            title: const Text('Está cadastrada na UBS mais próxima?'),
            value: cadastradaUBS,
            onChanged: (val) => setState(() => cadastradaUBS = val),
          ),
          const SizedBox(height: 8),
        ],

        // Pré-natal (Checkbox)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quais serviços de pré-natal você utiliza?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            CheckboxListTile(
              title: const Text('Consulta médica regular'),
              value: preNatalMedico,
              onChanged: (val) {
                setState(() => preNatalMedico = val ?? false);
              },
            ),
            CheckboxListTile(
              title: const Text('Consulta com enfermeiro'),
              value: preNatalEnfermagem,
              onChanged: (val) {
                setState(() => preNatalEnfermagem = val ?? false);
              },
            ),
            CheckboxListTile(
              title: const Text('Grupo de gestantes'),
              value: participaGrupoGestantes,
              onChanged: (val) {
                setState(() => participaGrupoGestantes = val ?? false);
              },
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Exames e vacinação
        SwitchListTile(
          title: const Text(
            'Realizou todos os exames solicitados no pré-natal?',
          ),
          value: examesPreNatalCompletos,
          onChanged: (val) => setState(() => examesPreNatalCompletos = val),
        ),
        const SizedBox(height: 8),

        SwitchListTile(
          title: const Text('Tomou todas as vacinas indicadas para gestantes?'),
          subtitle: const Text('Incluindo dTpa e influenza'),
          value: vacinasEmDia,
          onChanged: (val) => setState(() => vacinasEmDia = val),
        ),
        const SizedBox(height: 16),

        // Qualidade do atendimento (Dropdown)
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Como avalia o atendimento de pré-natal?',
            border: OutlineInputBorder(),
          ),
          initialValue: avaliacaoPreNatal.isNotEmpty ? avaliacaoPreNatal : null,
          items: const [
            DropdownMenuItem(value: 'Excelente', child: Text('Excelente')),
            DropdownMenuItem(value: 'Bom', child: Text('Bom')),
            DropdownMenuItem(value: 'Regular', child: Text('Regular')),
            DropdownMenuItem(value: 'Ruim', child: Text('Ruim')),
            DropdownMenuItem(value: 'Péssimo', child: Text('Péssimo')),
          ],
          onChanged: (val) => setState(() => avaliacaoPreNatal = val ?? ''),
        ),
        const SizedBox(height: 16),

        // Dificuldades específicas
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Quais dificuldades enfrenta no acesso à saúde?',
            border: OutlineInputBorder(),
            hintText: 'Ex: Horários, falta de profissionais, transporte...',
          ),
          maxLines: 3,
          onChanged: (val) => dificuldadesSaude = val,
        ),
      ],
    );
  }

  Widget _habitacaoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Habitação'),
        const SizedBox(height: 16),

        // Tipo de moradia (Dropdown)
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Tipo de moradia',
            border: OutlineInputBorder(),
            hintText: 'Selecione o tipo de residência',
          ),
          validator: (value) => value == null ? 'Campo obrigatório' : null,
          initialValue: tipoMoradia.isNotEmpty ? tipoMoradia : null,
          items: const [
            DropdownMenuItem(
              value: 'Casa de alvenaria',
              child: Text('Casa de alvenaria'),
            ),
            DropdownMenuItem(
              value: 'Casa de madeira',
              child: Text('Casa de madeira'),
            ),
            DropdownMenuItem(value: 'Apartamento', child: Text('Apartamento')),
            DropdownMenuItem(
              value: 'Cômodo único',
              child: Text('Cômodo único'),
            ),
            DropdownMenuItem(value: 'Outro', child: Text('Outro tipo')),
          ],
          onChanged: (val) => setState(() => tipoMoradia = val ?? ''),
        ),
        const SizedBox(height: 16),

        // Número de pessoas e cômodos
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nº de pessoas na casa',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
                onChanged: (val) => pessoasPorComodo = int.tryParse(val) ?? 0,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nº de cômodos',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) => numeroComodos = int.tryParse(val) ?? 0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Condições da moradia (Checkbox)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quais destes itens sua casa possui?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const Text('Água encanada'),
              value: temAguaEncanada,
              onChanged: (val) =>
                  setState(() => temAguaEncanada = val ?? false),
            ),
            CheckboxListTile(
              title: const Text('Banheiro dentro da casa'),
              value: temBanheiro,
              onChanged: (val) => setState(() => temBanheiro = val ?? false),
            ),
            CheckboxListTile(
              title: const Text('Cozinha separada'),
              value: temCozinhaSeparada,
              onChanged: (val) =>
                  setState(() => temCozinhaSeparada = val ?? false),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Tipo de moradia (Dropdown)
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Como avalia a segurança da sua casa?',
            border: OutlineInputBorder(),
          ),
          validator: (value) => value == null ? 'Campo obrigatório' : null,
          initialValue: tipoMoradia.isNotEmpty ? tipoMoradia : null,
          items: const [
            DropdownMenuItem(
              value: 'Casa de alvenaria',
              child: Text('Casa de alvenaria'),
            ),
            DropdownMenuItem(
              value: 'Casa de madeira',
              child: Text('Casa de madeira'),
            ),
            DropdownMenuItem(value: 'Apartamento', child: Text('Apartamento')),
            DropdownMenuItem(
              value: 'Cômodo único',
              child: Text('Cômodo único'),
            ),
            DropdownMenuItem(value: 'Outro', child: Text('Outro tipo')),
          ],
          onChanged: (val) => setState(() => tipoMoradia = val ?? ''),
        ),
        const SizedBox(height: 16),

        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Você se sente segura onde vive?',
            border: OutlineInputBorder(),
            hintText: 'Ex: Reformar banheiro, melhorar ventilação...',
          ),
          maxLines: 2,
          onChanged: (val) => melhoriasDesejadas = val,
        ),
        const SizedBox(height: 16),

        // Acesso a serviços básicos
        SwitchListTile(
          title: const Text(
            'Tem fácil acesso a serviços de saúde a partir da sua residência?',
          ),
          value: facilAcessoSaude,
          onChanged: (val) => setState(() => facilAcessoSaude = val),
        ),
      ],
    );
  }

  Widget _alimentacaoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Alimentação'),
        const SizedBox(height: 16),

        // Número de refeições (Radio)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quantas refeições completas você faz por dia?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Column(
              children: [
                RadioGroup(
                  groupValue: refeicoesPorDia,
                  onChanged: (val) {
                    setState(() => refeicoesPorDia = val ?? 0);
                  },
                  child: Text('1-2 refeições'),
                ),
                RadioGroup(
                  groupValue: refeicoesPorDia,
                  onChanged: (val) {
                    setState(() => refeicoesPorDia = val ?? 0);
                  },
                  child: Text('3 refeições'),
                ),
                RadioGroup(
                  groupValue: refeicoesPorDia,
                  onChanged: (val) {
                    setState(() => refeicoesPorDia = val ?? 0);
                  },
                  child: Text('4 ou mais refeições'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Segurança alimentar
        SwitchListTile(
          title: const Text(
            'Nos últimos 3 meses, deixou de comer por falta de dinheiro?',
          ),
          value: insegurancaAlimentar,
          onChanged: (val) => setState(() => insegurancaAlimentar = val),
        ),
        const SizedBox(height: 16),

        // Acesso a alimentos (Checkbox)
        const Text(
          'Quais alimentos você consome regularmente?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        CheckboxListTile(
          title: const Text('Frutas e verduras'),
          value: consomeFrutasVerduras,
          onChanged: (val) =>
              setState(() => consomeFrutasVerduras = val ?? false),
        ),
        CheckboxListTile(
          title: const Text('Carnes (vermelha, frango ou peixe)'),
          value: consomeCarnes,
          onChanged: (val) => setState(() => consomeCarnes = val ?? false),
        ),
        CheckboxListTile(
          title: const Text('Leite e derivados'),
          value: consomeLeite,
          onChanged: (val) => setState(() => consomeLeite = val ?? false),
        ),
        CheckboxListTile(
          title: const Text('Feijão e outras leguminosas'),
          value: consomeFeijao,
          onChanged: (val) => setState(() => consomeFeijao = val ?? false),
        ),
        const SizedBox(height: 16),

        // Qualidade do atendimento (Dropdown)
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'De onde vem os alimentos que você consome?',
            border: OutlineInputBorder(),
          ),
          initialValue: avaliacaoPreNatal.isNotEmpty ? avaliacaoPreNatal : null,
          items: const [
            DropdownMenuItem(value: 'Excelente', child: Text('Excelente')),
            DropdownMenuItem(value: 'Bom', child: Text('Bom')),
            DropdownMenuItem(value: 'Regular', child: Text('Regular')),
            DropdownMenuItem(value: 'Ruim', child: Text('Ruim')),
            DropdownMenuItem(value: 'Péssimo', child: Text('Péssimo')),
          ],
          onChanged: (val) => setState(() => avaliacaoPreNatal = val ?? ''),
        ),
        const SizedBox(height: 16),

        // Mudanças na gestação
        SwitchListTile(
          title: const Text('Sua alimentação mudou durante a gestação?'),
          subtitle: const Text('Seja por orientação médica ou outros motivos'),
          value: mudancaAlimentacaoGestacao,
          onChanged: (val) => setState(() => mudancaAlimentacaoGestacao = val),
        ),
        const SizedBox(height: 16),

        // Suplementação
        SwitchListTile(
          title: const Text(
            'Está tomando suplementos vitamínicos ou de ferro?',
          ),
          value: usaSuplementos,
          onChanged: (val) => setState(() => usaSuplementos = val),
        ),
        const SizedBox(height: 16),

        // Avaliação subjetiva
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Como você avalia sua alimentação durante a gestação?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Column(
              children: [
                RadioGroup(
                  groupValue: avaliacaoAlimentacao,
                  onChanged: (val) {
                    setState(() => avaliacaoAlimentacao = val ?? '');
                  },
                  child: RadioListTile<String>(
                    title: const Text(
                      'Muito boa - atende todas minhas necessidades',
                    ),
                    value: 'Muito boa',
                  ),
                ),
                RadioGroup(
                  groupValue: avaliacaoAlimentacao,
                  onChanged: (val) {
                    setState(() => avaliacaoAlimentacao = val ?? '');
                  },
                  child: RadioListTile<String>(
                    title: const Text('Boa - com algumas limitações'),
                    value: 'Boa',
                  ),
                ),
                RadioGroup(
                  groupValue: avaliacaoAlimentacao,
                  onChanged: (val) {
                    setState(() => avaliacaoAlimentacao = val ?? '');
                  },
                  child: RadioListTile<String>(
                    title: const Text('Regular - poderia ser melhor'),
                    value: 'Regular',
                  ),
                ),
                RadioGroup(
                  groupValue: avaliacaoAlimentacao,
                  onChanged: (val) {
                    setState(() => avaliacaoAlimentacao = val ?? '');
                  },
                  child: RadioListTile<String>(
                    title: const Text('Ruim - não atende minhas necessidades'),
                    value: 'Ruim',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Formulário enviado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      // Mostrar resumo dos dados
      _showSummaryDialog();
    }
  }

  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Resumo do Formulário'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSummaryItem('Escolaridade', escolaridade),
              _buildSummaryItem('Estuda atualmente', estuda ? 'Sim' : 'Não'),
              _buildSummaryItem('Profissão', profissao),
              _buildSummaryItem('Empregado', empregado ? 'Sim' : 'Não'),
              _buildSummaryItem('Fonte de água', fonteAgua),
              _buildSummaryItem('Tipo de moradia', tipoMoradia),
              _buildSummaryItem(
                'Refeições por dia',
                refeicoesPorDia.toString(),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value.isNotEmpty ? value : 'Não informado'),
          ],
        ),
      ),
    );
  }
}
