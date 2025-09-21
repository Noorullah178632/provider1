import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/prov/favorite_provider.dart';
import 'package:provider1/screens/favorite_app/selected_favorite_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite Screen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SelectedFavoriteScreen(
                    selectedItems: context
                        .read<FavoriteProvider>()
                        .selectedItems,
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
        ],
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, value, ind) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                onTap: () {
                  // Provider.of<FavoriteProvider>(context).addItem(value);
                  //both methods are same
                  context.read<FavoriteProvider>().addItem(index);
                },
                leading: Text(
                  "Item$index",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                trailing:
                    value.selectedItems.contains(
                      index,
                    ) //index: from build context and value : from the provider class
                    ? Icon(Icons.favorite, color: Colors.red)
                    : Icon(Icons.favorite_border_outlined),
              );
            },
          );
        },
      ),
    );
  }
}
