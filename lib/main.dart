// Imports - material
import 'package:flutter/material.dart';

// Etapa 1 - Esqueleto da tela
// Objetivo: Entender a estrutura de um app Flutter

// Etapa Final - Estilização
void main() => runApp(MaterialApp(
  home: ChurrascoApp(),
));

class ChurrascoApp extends StatefulWidget{
  @override
  _ChurrascoAppState createState() => _ChurrascoAppState();
}

class _ChurrascoAppState extends State<ChurrascoApp>{

  final TextEditingController _homensController = TextEditingController();
  
  final TextEditingController _mulheresController = TextEditingController();

  String _resultado = "";

  // Paleta de Cores - Cor de fundo, cor de card, cor primária, cor secundária, cor do texto, cor da borda
  // RGB, HEX, nome (green, grey)

  static const Color corFundo = Color(0XFF1A0A00);
  static const Color corCard = Color(0XFF2C1500);
  static const Color corPrimaria = Color(0XFFFF6800);
  static const Color corSecundaria = Color(0XFFFFB347);
  static const Color corTexto = Color(0XFFFFF0E0);
  static const Color corTextoCinza = Color(0XFFAA8866);
  static const Color corBorda = Color(0XFF5C3010);

  void _calcular(){
    final int homens = int.tryParse(_homensController.text) ?? 0;
    final int mulheres = int.tryParse(_mulheresController.text) ?? 0;
    
    if(homens < 0 || mulheres < 0) {
      setState((){
        _resultado = "Informe ao menos uma pessoa";
      });
      return;
    }
    final double totalKg = (homens * 350 + mulheres * 300)/1000;
    setState(() {
    _resultado = '$totalKg kg de carne 🥩\n'
    '${(totalKg * 0.3).toStringAsFixed(1)} kg de acompanhamento 🫕\n'
    '${homens * 3 + mulheres * 3} unidades de bebida 🧋\n';
    });
  } 
  @override
  Widget build(BuildContext context){
    // Esqueleto visual da tela - como a tag <html>
    return Scaffold(
      backgroundColor: corFundo,
    // Local onde ficarão a maioria dos nossos elementos

    // Semelhante ao header
    appBar: AppBar(
      backgroundColor: corCard,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "🔥Calculadora de Churras",
        style:TextStyle(
          color: corSecundaria,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16,),
            // Aqui é onde estarão os nossos elementos/widgets

           Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: corCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: corBorda, width: 1),
            ),
            
            child: Text(
              "Informe o número de convidados:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: corTextoCinza,
                height: 1.5,
              ),
            ),
           ),

            SizedBox(height: 28),
            _buildCampo(
              controller: _mulheresController, 
            label: 'Quantidade de Mulheres', 
            icone: Icons.person,
            ),
            SizedBox(height: 16,),
            _buildCampo(
              controller: _homensController, 
            label: 'Quantidade de Homens', 
            icone: Icons.person_outline,
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrimaria,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)
                ),
                elevation: 6,
                shadowColor: corPrimaria.withOpacity(0.5),
              ),
              child: Text(
                "Calcular",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(height: 36),
            if(_resultado.isNotEmpty)
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: corTexto,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: corPrimaria,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: corPrimaria.withOpacity(0.2),
                    blurRadius: 12,
                    offset: Offset( 0, 4),
                  ),
                ]
               ),
                       
            child:Column (children: [
              Text(
                'Você vai precisar de:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: corPrimaria,
                ),
              ),
              SizedBox(height: 12),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 2.0,
                  color: corBorda,
                ),
              ),
            ],),
            ),
            SizedBox(height: 16,),
            Text(
              '350g por homem . 300g por mulher',
              style: TextStyle(fontSize: 12, color: corTextoCinza),
              textAlign: TextAlign.center,
            ),
                  
          ],
        ),
      ),
    );
  }

Widget _buildCampo ({
  required TextEditingController controller,
  required String label,
  required IconData icone,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    style: TextStyle(color: corTexto, fontSize: 16),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: corTextoCinza),
      prefixIcon: Icon(icone, color: corPrimaria),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: corBorda, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: corPrimaria, width: 2),
      ),
      filled: true,
      fillColor: corCard,
    ),
  );
}
}

