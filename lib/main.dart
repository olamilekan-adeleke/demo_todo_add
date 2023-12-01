import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textEditingController = TextEditingController();

  // Step 1: Create your List
  List<String> userTodoList = [];

  //
  //
  //
  // Step 2: Add To list
  void addToTheList(String title) {
    userTodoList.add(title);
    setState(() {});
  }

  //
  //
  //
  // Step 3: Remove from List
  void removeItemFromList(String title) {
    userTodoList.remove(title);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Demo")),
      body: Container(
        child: userTodoList.isEmpty
            ? const Center(
                child: Text(
                  "Tap the floating action button below to \nadd a Todo",
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: userTodoList.length,
                itemBuilder: (context, index) {
                  final String currentTitle = userTodoList[index];

                  return ListTile(
                    dense: true,
                    minVerticalPadding: 2,
                    title: Text(currentTitle),
                    subtitle: const Text("Tap the delete icon to remove"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        removeItemFromList(currentTitle);
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Enter Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Get the String from the controller
                  final String title = textEditingController.text;
                  addToTheList(title);
                  Navigator.pop(context);
                  textEditingController.clear();
                },
                child: const Text("Add To List"),
              ),
            ),
            const SizedBox(height: 40),
          ]),
        );
      },
    );
  }
}
