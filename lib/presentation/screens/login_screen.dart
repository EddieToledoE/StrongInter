import 'package:flutter/material.dart';
import 'package:stronginter/data/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido a Stronginter',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Continuar con Google'),
                onPressed: () async {
                  final user = await AuthService().signInWithGoogle();
                  if (user != null) {
                    // TODO: Navegar a pantalla principal
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Bienvenido, ${user.user!.displayName}'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error al iniciar sesión')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
