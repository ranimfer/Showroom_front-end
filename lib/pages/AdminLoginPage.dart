import 'package:flutter/material.dart';
import 'AdminDashboardPage.dart';
import '../widgets/footer.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Vérification simple
      if (_emailController.text.trim() == 'admin@example.com' &&
          _passwordController.text == 'admin123') {
        // ✅ Connexion réussie
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Connexion réussie admin ✅")),
        );

        // Rediriger vers AdminDashboardPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AdminDashboardPage()),
        );

        _emailController.clear();
        _passwordController.clear();
      } else {
        // ❌ Mauvais identifiants
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Identifiants incorrects ❌")),
        );
      }
    }
  }

  void _forgotPassword() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Réinitialisation du mot de passe"),
        content: const Text(
            "Un lien de réinitialisation sera envoyé à l'email de l'admin."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🛍️ MyShowroom',
      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blueGrey[900],),
      body: SingleChildScrollView(
        key: const ValueKey("admin-login"),
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Connexion Admin',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                value!.isEmpty ? 'Veuillez entrer votre email' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
                validator: (value) => value!.length < 6
                    ? 'Le mot de passe doit contenir au moins 6 caractères'
                    : null,
              ),
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
                icon: const Icon(Icons.lock_open),
                label: const Text('Connexion'),
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
              ),
           //   Footer(onPageSelected: _onItemTapped),
            ],

          ),

        ),

      ),

    );
  }
}

