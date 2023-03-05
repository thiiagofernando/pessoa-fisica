import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pessoa Física',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      home: MyHomePage(title: 'Pessoa Física'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dataSelecionar = TextEditingController();
  final cpfCtrl = TextEditingController();
  bool exibir = false;
  String labelConsulta = '0 CPF favorito';
  bool habilitarBotaoConsulta = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        backgroundColor: const Color.fromARGB(255, 2, 31, 77),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: cpfCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Informe o CPF',
                  suffixIcon: Icon(Icons.keyboard),
                ),
                onChanged: (value) {
                  if (dataSelecionar.text.trim().isNotEmpty && cpfCtrl.text.trim().length == 11) {
                    setState(() {
                      habilitarBotaoConsulta = true;
                    });
                  } else {
                    setState(() {
                      habilitarBotaoConsulta = false;
                    });
                  }
                },
                onEditingComplete: () {
                  if (cpfCtrl.text.trim().length < 11 || cpfCtrl.text.trim().length > 11) {
                    Get.snackbar(
                      'Atenção',
                      'Informe um numero de CPF com 11 dígitos e uma Data',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 8),
                    );
                  }
                },
              ),
              TextField(
                readOnly: true,
                controller: dataSelecionar,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'Informe a Data de Nascimento',
                  suffixIcon: Icon(Icons.calendar_month),
                ),
                onTap: () async {
                  var selecionarData = await pickedDate();
                  if (selecionarData != null && cpfCtrl.text.trim().length == 11) {
                    String dataFormatada = DateFormat('dd/MM/yyyy').format(selecionarData);
                    setState(() {
                      dataSelecionar.text = dataFormatada.toString();
                      habilitarBotaoConsulta = true;
                    });
                  } else {
                    if (cpfCtrl.text.trim().length < 11 || cpfCtrl.text.trim().length > 11) {
                      Get.snackbar(
                        'Atenção',
                        'Informe um numero de CPF com 11 dígitos e uma Data',
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 8),
                      );
                    }
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 2, 31, 77),
                  padding: const EdgeInsets.only(right: 114, left: 114),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: habilitarBotaoConsulta
                    ? () {
                        setState(() {
                          labelConsulta = '1 CPF favorito';
                          exibir = true;
                        });
                      }
                    : null,
                child: const Text("CONSULTAR"),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                labelConsulta,
                style: const TextStyle(
                  color: Color.fromARGB(255, 2, 31, 77),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                color: const Color.fromARGB(255, 214, 213, 213),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: !exibir
                      ? const []
                      : const [
                          ListTile(
                            leading: Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 39,
                            ),
                            title: Text("Fulano de Tal da Silva"),
                            subtitle: Text("02/10/2022 12:23:10"),
                          ),
                        ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 9, 101, 175),
              ),
              child: Center(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Consulta CPF"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on),
              title: const Text("Consulta Restituição"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.gps_fixed),
              title: const Text("Outros Serviços"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Unidades RFB"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Sobre"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> pickedDate() async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );
  }
}
