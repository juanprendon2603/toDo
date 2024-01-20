import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/authentication_provider.dart';
import '../../services/auth_service.dart';
import '../task_list_screen.dart';

class SignUpTab extends StatelessWidget {
  final AuthService authService;

  const SignUpTab({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<AuthenticationProvider>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: provider.emailControllerS,
            decoration: const InputDecoration(labelText: 'Correo electrónico'),
          ),
          TextField(
            controller: provider.passwordControllerS,
            decoration: const InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await authService.signUp(
                  email: provider.emailControllerS.text.trim(),
                  password: provider.passwordControllerS.text.trim(),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskListScreen(),
                  ),
                );
              } catch (e) {
                print('Error al registrarse: $e');
              }
            },
            child: const Text('Registrarse'),
          ),
        ],
      ),
    );
  }
}
