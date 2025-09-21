import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/prov/another_provider.dart';

class SliderScreen extends StatelessWidget {
  SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider Bar")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Consumer<SliderClass>(
            builder: (context, provider, child) => Slider(
              value: provider.value,
              onChanged: (v) {
                provider.setValue(v);
              },
            ),
          ),
          SizedBox(height: 15),
          Consumer<SliderClass>(
            builder: (context, provider, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue.withOpacity(provider.value),
                      height: 100,
                      child: Text("Container 1"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green.withOpacity(provider.value),
                      height: 100,
                      child: Text("Container 2"),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
