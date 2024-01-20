import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/providers/authentication_provider.dart';
import '../../services/auth_service.dart';
import '../task_list_screen.dart';

class LoginTab extends StatelessWidget {
  final AuthService authService;

  const LoginTab({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<AuthenticationProvider>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: provider.emailControllerL,
            decoration: const InputDecoration(labelText: 'Correo electrónico'),
          ),
          TextField(
            controller: provider.passwordControllerL,
            decoration: const InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await authService.signIn(
                  email: provider.emailControllerL.text.trim(),
                  password: provider.passwordControllerL.text.trim(),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskListScreen(),
                  ),
                );
              } catch (e) {}
            },
            child: const Text('Iniciar Sesión'),
          ),
        ],
      ),
    );
  }
}
