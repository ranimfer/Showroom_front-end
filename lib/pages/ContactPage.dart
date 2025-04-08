import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  late GoogleMapController mapController;

  // Définir la localisation sur Google Maps
  static const LatLng _center = LatLng(36.8604, 10.1960); // Coordonnées de la localisation (Tunis)

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Affiche une alerte pour confirmer l'envoi du message
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Message envoyé"),
          content: const Text("Merci de nous avoir contactés."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            )
          ],
        ),
      );

      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey("contact"),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contactez-nous',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // Disposition de la page : Partie gauche (Map + Informations) et Partie droite (Formulaire)
          Row(
            children: [
              // Partie gauche : Google Maps et Informations
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: GoogleMap(
                        onMapCreated: (GoogleMapController controller) {
                          mapController = controller;
                        },
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 14.0,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId('location'),
                            position: _center,
                            infoWindow: const InfoWindow(title: 'Résidence Dar El Khir'),
                          ),
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Informations de contact (adresse, téléphone, email)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.location_on),
                          title: const Text('Adresse'),
                          subtitle: const Text('1er étage, Résidence Dar El Khir, Tunis 1053'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.phone),
                          title: const Text('Téléphone'),
                          subtitle: const Text('+216 26969308'),
                        ),
                        ListTile(
                          leading: const Icon(Icons.email),
                          title: const Text('E-mail'),
                          subtitle: const Text('contact@sotunec.com'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),

              // Partie droite : Formulaire de contact
              Expanded(
                flex: 1,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ÉCRIVEZ-NOUS',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),

                      // Champ de texte pour le nom
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Nom'),
                        validator: (value) => value!.isEmpty ? 'Veuillez entrer votre nom' : null,
                      ),
                      const SizedBox(height: 16),

                      // Champ de texte pour l'email
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) => value!.isEmpty ? 'Veuillez entrer votre email' : null,
                      ),
                      const SizedBox(height: 16),

                      // Champ de texte pour le téléphone
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Téléphone'),
                        validator: (value) => value!.isEmpty ? 'Veuillez entrer votre téléphone' : null,
                      ),
                      const SizedBox(height: 16),

                      // Champ de texte pour le message
                      TextFormField(
                        controller: _messageController,
                        maxLines: 4,
                        decoration: const InputDecoration(labelText: 'Message'),
                        validator: (value) => value!.isEmpty ? 'Veuillez écrire un message' : null,
                      ),
                      const SizedBox(height: 24),

                      // Bouton envoyer
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        ),
                        child: const Text('Envoyer'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
