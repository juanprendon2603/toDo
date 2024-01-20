import 'package:flutter/material.dart';
import 'package:to_do/screens/authentication/sign_up_tab.dart';
import '../../services/auth_service.dart';
import 'login_tab.dart'; // Asegúrate de ajustar según la ubicación real de tus archivos

class AuthenticationScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDO App'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Iniciar Sesión'),
              Tab(text: 'Registrarse'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginTab(authService: _authService),
            SignUpTab(authService: _authService),
          ],
        ),
      ),
    );
  }
}
