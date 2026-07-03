import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, backgroundColor: Color(0xFF1B3670),
              child: Text('CP', style: TextStyle(fontSize: 28, color: Colors.white))),
            const SizedBox(height: 12),
            const Text('Cliente Prymera', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('DNI: *****1234', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            _card(Icons.person, 'Datos personales', 'Nombres, direccion, telefono'),
            _card(Icons.shield, 'Seguridad', 'Cambiar contrasena, huella digital'),
            _card(Icons.notifications, 'Notificaciones', 'Alertas, promociones, estados'),
            _card(Icons.info, 'Acerca de', 'Version 1.0.0'),
          ],
        ),
      ),
    );
  }

  Widget _card(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(leading: Icon(icon, color: const Color(0xFF1B3670)), title: Text(title), subtitle: Text(subtitle)),
    );
  }
}
