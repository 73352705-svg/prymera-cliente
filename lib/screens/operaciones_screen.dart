import 'package:flutter/material.dart';

class OperacionesScreen extends StatelessWidget {
  const OperacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ops = [
      {'tipo': 'Pago de cuota', 'monto': 450.0, 'fecha': '28/06/2026', 'estado': 'Confirmada'},
      {'tipo': 'Transferencia', 'monto': 200.0, 'fecha': '25/06/2026', 'estado': 'Confirmada'},
      {'tipo': 'Pago de cuota', 'monto': 450.0, 'fecha': '28/05/2026', 'estado': 'Confirmada'},
      {'tipo': 'Pago de cuota', 'monto': 450.0, 'fecha': '28/04/2026', 'estado': 'Confirmada'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Operaciones')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Expanded(child: _actionCard('Pagar cuota', Icons.payments, () {})),
              const SizedBox(width: 12),
              Expanded(child: _actionCard('Transferir', Icons.swap_horiz, () {})),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Ultimos movimientos', style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: ops.length,
              itemBuilder: (_, i) {
                final o = ops[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF1B3670).withValues(alpha: 0.1),
                    child: const Icon(Icons.swap_horiz, color: Color(0xFF1B3670)),
                  ),
                  title: Text(o['tipo'] as String),
                  subtitle: Text(o['fecha'] as String),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('S/ ${o['monto']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(o['estado'] as String, style: const TextStyle(fontSize: 11, color: Colors.green)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionCard(String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4)],
        ),
        child: Column(
          children: [
            Icon(icon, size: 36, color: const Color(0xFF1B3670)),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
