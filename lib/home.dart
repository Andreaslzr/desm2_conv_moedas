import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int ? selectOption1;
int ? selectOption2;
class RadioButton1 extends StatefulWidget {
  const RadioButton1({super.key});

  @override
  State<RadioButton1> createState() => _RadioButton1State();
}

class _RadioButton1State extends State<RadioButton1> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile<int>(
          title: Text("Real"),
          value: 1,
          groupValue: selectOption1,
          onChanged: (value){
            setState(() {
              selectOption1 = value;      
            });
          },
        ),
        RadioListTile<int>(
          title: Text("Dolar"),
          value: 2,
          groupValue: selectOption1,
          onChanged: (value){
            setState(() {
              selectOption1 = value; 
            });
          },
        ),
        RadioListTile<int>(
          title: Text("Euro"),
          value: 3,
          groupValue: selectOption1,
          onChanged: (value){
            setState(() {
              selectOption1 = value;
            });
          },
        ),
        //Text("Radio button opção $selectOption1"),

      ],
    );
  }
}

class RadioButton2 extends StatefulWidget {
  const RadioButton2({super.key});

  @override
  State<RadioButton2> createState() => _RadioButton2State();
}

class _RadioButton2State extends State<RadioButton2> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile<int>(
          title: Text("Real"),
          value: 1,
          groupValue: selectOption2,
          onChanged: (value){
            setState(() {
              selectOption2 = value;      
            });
          },
        ),
        RadioListTile<int>(
          title: Text("Dolar"),
          value: 2,
          groupValue: selectOption2,
          onChanged: (value){
            setState(() {
              selectOption2 = value; 
            });
          },
        ),
        RadioListTile<int>(
          title: Text("Euro"),
          value: 3,
          groupValue: selectOption2,
          onChanged: (value){
            setState(() {
              selectOption2 = value;
            });
          },
        ),
        //Text("Radio button opção $selectOption1"),

      ],
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   TextEditingController vi = TextEditingController();
  String preco = "";
  double? valor;
  double vi2=0;
  _consultaBitcoin() async{
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> dados = json.decode(response.body);
    setState(() {
      preco = dados["BRL"]["buy"].toString();
    });
    print("Resultado api ${response.statusCode.toString()}");
    print("Valores Bitcoin ${dados}");
    print("Valor do Bitcoin em R\$ ${preco}");
  }
  _converte() {
    setState(() {
      if (selectOption1==1) {
        if(selectOption2==1) {
          valor = double.parse(vi.text)*1 ;
        }
    };
    if (selectOption1==1) {
        if(selectOption2==2) {
          valor = double.parse(vi.text)*0.20 ;
        }
    };
    if (selectOption1==1) {
        if(selectOption2==3) {
          valor = double.parse(vi.text)*0.18 ;
        }
    };
    if (selectOption1==2) {
        if(selectOption2==1) {
          valor = double.parse(vi.text)*4.99;
        }
    };
    if (selectOption1==2) {
        if(selectOption2==2) {
          valor = double.parse(vi.text)*1;
        }
    };
    if (selectOption1==2) {
        if(selectOption2==3) {
          valor = double.parse(vi.text)*0.92;
        }
    };
    if (selectOption1==3) {
        if(selectOption2==1) {
          valor = double.parse(vi.text)*5.43;
        }
    };
    if (selectOption1==3) {
        if(selectOption2==2) {
          valor = double.parse(vi.text)*1.09;
        }
    };
    if (selectOption1==3) {
        if(selectOption2==3) {
          valor = double.parse(vi.text)*1;
        }
    };
    });
      
    
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App consulta preço bitcoin"),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(width: 250, height: 150, color: Colors.amber,child: Image.asset("imagens/bitcoin.png"),),
            Text("Valor Bitcoin R\$: ${preco}",style: TextStyle(fontSize: 20),),
            ElevatedButton(onPressed: _consultaBitcoin, child: Text("Verificar")),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite o valor"),
              controller: vi,
            ),
            Text("Selecione a moeda"),
            RadioButton1(),
            Text("Selecione para qual moeda quer converter"),
            RadioButton2(),
            ElevatedButton(onPressed: _converte, child: Text("converter")),
            Text("Valor: ${valor}"),
            
            
          ],
        ),
      ),
    );
  }
}
