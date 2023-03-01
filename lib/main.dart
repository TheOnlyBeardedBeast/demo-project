import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Flutter',
                ),
                IconButton(
                    onPressed: () => print("Hello"),
                    icon: const Icon(Icons.favorite)),
              ],
            ),
            Column(children: [
              const Text("Renders everywhere"),
              if (Platform.isMacOS)
                const Text("This text is rendered only on a Mac."),
            ]),
            UserList(),
            cardWidget(context),
            const Counter(
              initialCount: 0,
            ),
          ],
        ),
      ),
    );
  }
}

var users = ["Peter", "Michael", "George", "Lucas", "Jack"];

class UserList extends StatelessWidget {
  final renderUsers = users.map((e) => "$e Human").toList();

  UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => Text(
          renderUsers[index],
          textAlign: TextAlign.center,
        ),
        itemCount: renderUsers.length,
      ),
    );
  }
}

Widget cardWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24), color: Colors.grey.shade300),
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1677599177535-237307c83dbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3732&q=80")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Card title",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Lorem ipsum dolor emet mir duffor.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        GestureDetector(
          onTap: () => print("clicked card button"),
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16)),
              child: const Text(
                "Button",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        )
      ],
    ),
  );
}

class Counter extends StatefulWidget {
  final int initialCount;
  const Counter({Key? key, required this.initialCount}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int counterState;

  @override
  void initState() {
    counterState = widget.initialCount;
    super.initState();
  }

  void increment() => setState(() {
        counterState++;
      });

  void decrement() => setState(() {
        counterState--;
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          color: Colors.greenAccent,
          onPressed: increment,
          child: const Text("+"),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            counterState.toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        MaterialButton(
          color: Colors.blueAccent,
          onPressed: decrement,
          child: const Text("-"),
        )
      ],
    );
  }
}
