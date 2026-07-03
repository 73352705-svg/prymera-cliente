import 'package:flutter/material.dart';

class MisTarjetasScreen extends StatelessWidget {
  const MisTarjetasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tarjetas = [
      {'numero': '**** **** **** 4582', 'marca': 'Visa', 'linea': 5000.0, 'usado': 3200.0, 'corte': '15/06/2026', 'pago': '05/07/2026'},
      {'numero': '**** **** **** 1234', 'marca': 'Mastercard', 'linea': 8000.0, 'usado': 1500.0, 'corte': '20/06/2026', 'pago': '10/07/2026'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Tarjetas')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tarjetas.length,
        itemBuilder: (_, i) {
          final t = tarjetas[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(colors: [Color(0xFF1B3670), Color(0xFF3569AD)]),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(t['marca'] as String, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                    const Icon(Icons.credit_card, color: Colors.white),
                  ]),
                  const SizedBox(height: 20),
                  Text(t['numero'] as String, style: const TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 2)),
                  const SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Linea', style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 11)),
                      Text('S/ ${t['linea']}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ]),
                    Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text('Usado', style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 11)),
                      Text('S/ ${t['usado']}', style: const TextStyle(color: Color(0xFFFFCC00), fontWeight: FontWeight.bold)),
                    ]),
                  ]),
                  const Divider(color: Colors.white24),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Corte: ${t['corte']}', style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 11)),
                    Text('Pago: ${t['pago']}', style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 11)),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
