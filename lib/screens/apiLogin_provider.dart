import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/prov/login_api_provider.dart';

class ApiloginProvider extends StatelessWidget {
  const ApiloginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    LoginApiProvider provider = Provider.of<LoginApiProvider>(context);

    print("build the whole widget");
    return Scaffold(
      appBar: AppBar(title: const Text("API Login Using Provider")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email field
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Password field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Login button
            InkWell(
              onTap: () {
                provider
                    .loginApi(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    )
                    .then((value) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Successfully Login")),
                      );
                    });
                emailController.clear();
                passwordController.clear();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: Center(
                  child: provider.loading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Login"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//https://app.reqres.in/api/login/