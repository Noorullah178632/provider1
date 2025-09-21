import 'package:flutter/material.dart';

class SelectedFavoriteScreen extends StatelessWidget {
  List<int> selectedItems;
  SelectedFavoriteScreen({required this.selectedItems});

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
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedItems.length,
              itemBuilder: (BuildContext context, index) {
                int item = selectedItems[index];
                return ListTile(
                  leading: Text(
                    "item$item",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  trailing: Icon(Icons.favorite, color: Colors.red),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
