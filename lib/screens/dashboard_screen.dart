import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prymera — App Cliente'), actions: [
        IconButton(icon: const Icon(Icons.logout), onPressed: () => context.go('/login')),
      ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(gradient: LinearGradient(
                colors: [Color(0xFF242F7B), Color(0xFF3569AD)],
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.account_circle, size: 56, color: Colors.white),
                  SizedBox(height: 8),
                  Text('Bienvenido', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  Text('Cliente Prymera', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ListTile(leading: const Icon(Icons.dashboard), title: const Text('Dashboard'), onTap: () => context.pop()),
            ListTile(leading: const Icon(Icons.account_balance), title: const Text('Mis Creditos'), onTap: () => context.push('/creditos')),
            ListTile(leading: const Icon(Icons.credit_card), title: const Text('Mis Tarjetas'), onTap: () => context.push('/tarjetas')),
            ListTile(leading: const Icon(Icons.swap_horiz), title: const Text('Operaciones'), onTap: () => context.push('/operaciones')),
            ListTile(leading: const Icon(Icons.person), title: const Text('Perfil'), onTap: () => context.push('/perfil')),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumen de cuentas', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            _buildCard(context, Icons.account_balance, 'Cuenta de Ahorros', 'S/ 12,450.00', const Color(0xFF2E7D32)),
            const SizedBox(height: 12),
            _buildCard(context, Icons.credit_card, 'Tarjeta de Credito', 'S/ 3,200.00 usados', const Color(0xFFF57C00)),
            const SizedBox(height: 12),
            _buildCard(context, Icons.monetization_on, 'Prestamo Vigente', 'S/ 8,500.00 saldo', const Color(0xFF1976D2)),
            const SizedBox(height: 24),
            Text('Acciones rapidas', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildAction(context, Icons.payments, 'Pagar\nCuota', () => context.push('/operaciones')),
                const SizedBox(width: 12),
                _buildAction(context, Icons.history, 'Ultimos\nMovimientos', () => context.push('/operaciones')),
                const SizedBox(width: 12),
                _buildAction(context, Icons.description, 'Estado de\nCuenta', () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String title, String amount, Color color) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withValues(alpha: 0.15), child: Icon(icon, color: color)),
        title: Text(title),
        trailing: Text(amount, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4)],
          ),
          child: Column(
            children: [
              Icon(icon, size: 32, color: const Color(0xFF1B3670)),
              const SizedBox(height: 8),
              Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
