import "package:flutter/material.dart";

class StatelessToStatefull extends StatelessWidget {
  StatelessToStatefull({super.key});
  //controller for textformfield
  TextEditingController _passwordController = TextEditingController();

  //value for counter app
  ValueNotifier<int> _count = ValueNotifier<int>(0);
  //value for toggle eye in password
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("Build the whole widget ");
    return Scaffold(
      appBar: AppBar(title: Text("Build stateless as a statefull widget ")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: _toggle,
            builder: (BuildContext context, value, child) {
              return TextFormField(
                controller: _passwordController,

                obscureText: value,
                decoration: InputDecoration(
                  hint: Text("password"),
                  suffix: InkWell(
                    onTap: () {
                      _toggle.value = !_toggle
                          .value; //value represent the toggle of the password
                    },
                    child: value
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 3, color: Colors.black),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: _count,
            builder: (BuildContext context, value, child) {
              return Text(
                'Count ${value}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count.value++;
          print(_count);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
