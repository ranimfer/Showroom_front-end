import 'package:flutter/material.dart';
import 'RegisterPage.dart'; // ou le bon chemin si dans un dossier

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Connexion réussie !")),
      );

      _emailController.clear();
      _passwordController.clear();
    }
  }

  void _forgotPassword() {
    // Ici on peut plus tard naviguer vers une page de reset
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Réinitialisation du mot de passe"),
        content: const Text("Un lien de réinitialisation sera envoyé à votre adresse email."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  void _goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegisterPage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey("login"),
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Connectez-vous',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => value!.isEmpty ? 'Veuillez entrer votre email' : null,
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
              validator: (value) => value!.length < 6 ? 'Le mot de passe doit contenir au moins 6 caractères' : null,
            ),

            // 👉 Lien mot de passe oublié
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _forgotPassword,
                child: const Text("Mot de passe oublié ?"),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: _login,
              icon: const Icon(Icons.login),
              label: const Text('Se connecter'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
            ),

            const SizedBox(height: 30),

            // 👉 Lien "S'inscrire"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Pas encore inscrit ? "),
                TextButton(
                  onPressed: _goToSignUp,
                  child: const Text("S'inscrire"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            //  Bouton Admin
            Center(
              child: TextButton.icon(
                icon: const Icon(Icons.admin_panel_settings),
                label: const Text("Connexion Admin"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AdminLoginPage()),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
