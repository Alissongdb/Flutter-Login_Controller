import 'package:flutter/material.dart';
import 'package:login/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController _controller = LoginController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: MediaQuery.of(context).size.height * 0.2),
            TextField(
              decoration: InputDecoration(
                label: Text('Login'),
              ),
              onChanged: _controller.setLogin,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text(
                  'Senha',
                ),
              ),
              onChanged: _controller.setPass,
              obscureText: true,
            ),
            SizedBox(
              height: 15,
            ),
            ValueListenableBuilder(
              valueListenable: _controller.inLoader,
              builder: (_, InLoader, __) => InLoader
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _controller.auth().then((result) {
                          if (result) {
                            print('Sucesso');
                          } else {
                            print('Falha');
                          }
                        });
                      },
                      child: Text('Login'),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
