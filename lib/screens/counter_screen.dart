import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/prov/counter_provider.dart';
import 'package:provider1/prov/themeMode_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //it will listen to the changes and rebuild the whole widget , there are two way :
    //1:
    // final count = context.watch<Counter>().count;:if we use this line then the whole screen will rebuild not a specific one
    //2:
    final provider = Provider.of<ThememodeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Counter App using provider")),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(height: 40),
            ListTile(
              title: Text("Light Mode"),
              onTap: () {
                provider.changeThemeMode(ThemeMode.light);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Dark Mode"),
              onTap: () {
                provider.changeThemeMode(ThemeMode.dark);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("System Mode"),
              onTap: () {
                provider.changeThemeMode(ThemeMode.system);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(
              builder: (context, counter_value, child) {
                return Text(
                  "${counter_value.count}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //there are two way to get the value
          //1:
          context.read<Counter>().increment();
          //2:
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
