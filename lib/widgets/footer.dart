import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final Function(int) onPageSelected;

  const Footer({Key? key, required this.onPageSelected}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "© 2025 MyShowroom",
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => _launchURL('https://facebook.com'),
                icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
              ),
              IconButton(
                onPressed: () => _launchURL('https://twitter.com'),
                icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
              ),
              IconButton(
                onPressed: () => _launchURL('https://linkedin.com'),
                icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
              ),
              IconButton(
                onPressed: () => _launchURL('https://instagram.com'),
                icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => onPageSelected(0),
                child: const Text("Accueil", style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => onPageSelected(2),
                child: const Text("À propos", style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => onPageSelected(3),
                child: const Text("Contact", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
