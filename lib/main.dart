// Imports - material
import 'package:flutter/material.dart';

// Etapa 1 - Esqueleto da tela
// Objetivo: Entender a estrutura de um app Flutter

void main() => runApp(MaterialApp(
  home: ChurrascoApp(),
));

class ChurrascoApp extends StatelessWidget{

  String _resultado = "";
  void _calcular(){
    
  }
  @override
  Widget build(BuildContext context){
    // Esqueleto visual da tela - como a tag <html>
    return Scaffold(
    // Local onde ficarão a maioria dos nossos elementos

    // Semelhante ao header
    appBar: AppBar(
      title: Text("Calculadora de Churras"),
    ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Aqui é onde estarão os nossos elementos/widgets
            Text(
              "♨️Bem-vindo à Calculador de Churras!♨️",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 36),

             Text(
              "Informe o número de convidados:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            // Mullheres
            TextField(
              decoration: InputDecoration(
                labelText: "Quantidade de Mulheres:",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            // Homens
            TextField(
              decoration: InputDecoration(
                labelText: "Quantidade de Homens:",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: _calcular,
              child: Text("Calcular"),
            ),
            SizedBox(height: 36),
            Text(
              _resultado,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}