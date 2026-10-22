import 'package:flutter/material.dart';

void main() {
  runApp(const SimuladorInvestimentosApp());
}

class SimuladorInvestimentosApp extends StatelessWidget {
  const SimuladorInvestimentosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulador de Investimentos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)), // Azul Marinho Padrão
        scaffoldBackgroundColor: Colors.grey.shade50, // Fundo cinza bem claro para destacar os cards
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1565C0),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const TelaEntrada(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ============================================================================
// TELA 1: ENTRADA DE DADOS
// ============================================================================
class TelaEntrada extends StatefulWidget {
  const TelaEntrada({super.key});

  @override
  State<TelaEntrada> createState() => _TelaEntradaState();
}

class _TelaEntradaState extends State<TelaEntrada> {
  final _formKey = GlobalKey<FormState>();

  // Controladores do Investimento 1
  final _cap1Ctrl = TextEditingController();
  final _aporte1Ctrl = TextEditingController();
  final _taxa1Ctrl = TextEditingController();

  // Controladores do Investimento 2
  final _cap2Ctrl = TextEditingController();
  final _aporte2Ctrl = TextEditingController();
  final _taxa2Ctrl = TextEditingController();

  // Controlador do Período
  final _mesesCtrl = TextEditingController();

  @override
  void dispose() {
    _cap1Ctrl.dispose();
    _aporte1Ctrl.dispose();
    _taxa1Ctrl.dispose();
    _cap2Ctrl.dispose();
    _aporte2Ctrl.dispose();
    _taxa2Ctrl.dispose();
    _mesesCtrl.dispose();
    super.dispose();
  }

  // Método atualizado com ícones e design arredondado
  Widget _buildTextField(String label, TextEditingController controller, IconData icon, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: iconColor),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: iconColor, width: 2),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Campo obrigatório';
          if (double.tryParse(value) == null) return 'Número inválido';
          return null;
        },
      ),
    );
  }

  void _simular() {
    if (_formKey.currentState!.validate()) {
      final dados = {
        'cap1': double.parse(_cap1Ctrl.text),
        'aporte1': double.parse(_aporte1Ctrl.text),
        'taxa1': double.parse(_taxa1Ctrl.text),
        'cap2': double.parse(_cap2Ctrl.text),
        'aporte2': double.parse(_aporte2Ctrl.text),
        'taxa2': double.parse(_taxa2Ctrl.text),
        'meses': int.parse(_mesesCtrl.text),
      };

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaResultados(dados: dados)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const corInv1 = Color(0xFF1976D2); // Azul
    const corInv2 = Color(0xFF00897B); // Verde Esmeralda

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurar Simulação', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Seção Investimento 1
              const Row(
                children: [
                  Icon(Icons.trending_up, color: corInv1),
                  SizedBox(width: 8),
                  Text('Investimento 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: corInv1)),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField('Capital Inicial (R\$)', _cap1Ctrl, Icons.attach_money, corInv1),
              _buildTextField('Aplicação Mensal (R\$)', _aporte1Ctrl, Icons.add_circle_outline, corInv1),
              _buildTextField('Taxa de Juros Mensal (%)', _taxa1Ctrl, Icons.percent, corInv1),

              const Divider(height: 40, thickness: 1),

              // Seção Investimento 2
              const Row(
                children: [
                  Icon(Icons.trending_up, color: corInv2),
                  SizedBox(width: 8),
                  Text('Investimento 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: corInv2)),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField('Capital Inicial (R\$)', _cap2Ctrl, Icons.attach_money, corInv2),
              _buildTextField('Aplicação Mensal (R\$)', _aporte2Ctrl, Icons.add_circle_outline, corInv2),
              _buildTextField('Taxa de Juros Mensal (%)', _taxa2Ctrl, Icons.percent, corInv2),

              const Divider(height: 40, thickness: 1),

              // Parâmetro Compartilhado
              const Row(
                children: [
                  Icon(Icons.access_time, color: Colors.black87),
                  SizedBox(width: 8),
                  Text('Prazo da Simulação', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField('Período (Meses)', _mesesCtrl, Icons.calendar_today, Colors.black87),
            ],
          ),
        ),
      ),
      // SafeArea fixada na parte inferior (BottomNavigationBar) para evitar cortes da tela do celular
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: _simular,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1565C0),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
            ),
            child: const Text('Comparar Investimentos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// TELA 2: RESULTADOS E COMPARAÇÃO
// ============================================================================
class TelaResultados extends StatefulWidget {
  final Map<String, num> dados;

  const TelaResultados({super.key, required this.dados});

  @override
  State<TelaResultados> createState() => _TelaResultadosState();
}

class _TelaResultadosState extends State<TelaResultados> {
  List<double> evolucao1 = [];
  List<double> evolucao2 = [];
  double montanteFinal1 = 0;
  double rendimentoTotal1 = 0;
  double montanteFinal2 = 0;
  double rendimentoTotal2 = 0;

  @override
  void initState() {
    super.initState();
    _calcularInvestimentos();
  }

  void _calcularInvestimentos() {
    int meses = widget.dados['meses']!.toInt();
    double atual1 = widget.dados['cap1']!.toDouble();
    double aporte1 = widget.dados['aporte1']!.toDouble();
    double taxa1 = widget.dados['taxa1']!.toDouble() / 100;
    double totalInvestido1 = atual1;

    double atual2 = widget.dados['cap2']!.toDouble();
    double aporte2 = widget.dados['aporte2']!.toDouble();
    double taxa2 = widget.dados['taxa2']!.toDouble() / 100;
    double totalInvestido2 = atual2;

    for (int i = 0; i < meses; i++) {
      atual1 = (atual1 + aporte1) * (1 + taxa1);
      evolucao1.add(atual1);
      totalInvestido1 += aporte1;

      atual2 = (atual2 + aporte2) * (1 + taxa2);
      evolucao2.add(atual2);
      totalInvestido2 += aporte2;
    }

    setState(() {
      montanteFinal1 = atual1;
      rendimentoTotal1 = montanteFinal1 - totalInvestido1;
      montanteFinal2 = atual2;
      rendimentoTotal2 = montanteFinal2 - totalInvestido2;
    });
  }

  Widget _buildResumoCard(String titulo, double montante, double rendimento, Color corPrimaria, Color corFundo) {
    return Expanded(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: corPrimaria.withOpacity(0.3), width: 1.5),
        ),
        color: corFundo,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: corPrimaria)),
              const SizedBox(height: 12),
              const Text('Montante Final:', style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text('R\$ ${montante.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey.shade900)),
              const SizedBox(height: 8),
              const Text('Rendimento:', style: TextStyle(fontSize: 12, color: Colors.black54)),
              Text('+ R\$ ${rendimento.toStringAsFixed(2)}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: corPrimaria)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int meses = widget.dados['meses']!.toInt();
    const corInv1 = Color(0xFF1976D2);
    const corInv2 = Color(0xFF00897B);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório de Comparação', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Painel Superior com os Resumos
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildResumoCard('Investimento 1', montanteFinal1, rendimentoTotal1, corInv1, Colors.blue.shade50),
                const SizedBox(width: 12),
                _buildResumoCard('Investimento 2', montanteFinal2, rendimentoTotal2, corInv2, Colors.teal.shade50),
              ],
            ),
          ),

          // Título da Lista
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Evolução Mês a Mês', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
          ),

          // Cabeçalho da Tabela
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40, child: Text('Mês', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                Expanded(child: Text('Inv. 1 (R\$)', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: corInv1.withOpacity(0.8)))),
                Expanded(child: Text('Inv. 2 (R\$)', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, color: corInv2.withOpacity(0.8)))),
              ],
            ),
          ),
          const Divider(height: 1),

          // Lista Rolável
          Expanded(
            child: ListView.separated(
              itemCount: meses,
              separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 40,
                          child: Text('${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54))
                      ),
                      Expanded(
                          child: Text(evolucao1[index].toStringAsFixed(2), textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w500, color: corInv1))
                      ),
                      Expanded(
                          child: Text(evolucao2[index].toStringAsFixed(2), textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.w500, color: corInv2))
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Botão de reiniciar na área de navegação inferior segura
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.refresh),
            label: const Text('Realizar Nova Simulação', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF1565C0),
              side: const BorderSide(color: Color(0xFF1565C0), width: 2),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ),
    );
  }
}