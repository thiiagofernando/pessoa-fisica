import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Informe o CPF',
                  suffixIcon: Icon(Icons.keyboard),
                ),
              ),
              const TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Informe a Data de Nascimento',
                  suffixIcon: Icon(Icons.calendar_month),
                ),
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
                onPressed: () {
                  print("Consultar");
                },
                child: const Text("CONSULTAR"),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "1 CPF favorito",
                style: TextStyle(
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
                  children: const [
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
}
