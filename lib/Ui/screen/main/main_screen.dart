import 'package:frontend/product/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../../product/widgets/category_card.dart';
import '../chat/chat_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> tasks = [];

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C2C2C),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFF2C2C2C),
        title: const Text('Mobil Proje', style: TextStyle(color: Colors.white)),
      ),
      drawer: CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white60,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ChatScreen(sessionTitle: '')),
          );

          if (result != null) {
            _addTask(result.toString());
          }
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CategoryCard(
                    title: 'Population',
                    chatNumber: 'Sohbet 1',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ChatScreen(sessionTitle: 'Population'),
                        ),
                      );
                    },
                  ),
                  CategoryCard(
                    title: 'Alternatives to an alarm clock',
                    chatNumber: 'Sohbet 2',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatScreen(
                              sessionTitle: 'Alternatives to an alarm clock'),
                        ),
                      );
                    },
                  ),
                  ...tasks.asMap().entries.map((entry) {
                    int index = entry.key;
                    String task = entry.value;
                    return CategoryCard(
                      title: task,
                      chatNumber: 'Sohbet ${index + 3}',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(sessionTitle: task),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned backButton(BuildContext context) {
    return Positioned(
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
