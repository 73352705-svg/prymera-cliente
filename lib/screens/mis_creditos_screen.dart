import 'package:flutter/material.dart';

class MisCreditosScreen extends StatelessWidget {
  const MisCreditosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final creditos = [
      {'producto': 'Microcredito Comercio', 'monto': 8500.0, 'saldo': 5200.0, 'estado': 'Vigente', 'cuotas': '18/24', 'tea': '28.5%'},
      {'producto': 'Credito Consumo', 'monto': 3000.0, 'saldo': 1200.0, 'estado': 'Vigente', 'cuotas': '8/12', 'tea': '32.0%'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Creditos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: creditos.length,
        itemBuilder: (_, i) {
          final c = creditos[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(c['producto'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Chip(label: Text(c['estado'] as String, style: const TextStyle(fontSize: 11, color: Colors.white)),
                      backgroundColor: const Color(0xFF2E7D32)),
                  ]),
                  const Divider(),
                  _row('Monto desembolsado', 'S/ ${c['monto']}'),
                  _row('Saldo actual', 'S/ ${c['saldo']}'),
                  _row('Cuotas', c['cuotas'] as String),
                  _row('TEA', c['tea'] as String),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      ]),
    );
  }
}
