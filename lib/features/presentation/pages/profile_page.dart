import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль', style: TextStyle(fontSize: 16)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFF9F9F9), // Белый фон AppBar
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF9F9F9), // Светло-серый фон
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildProfileHeader(),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 10),
            _buildProfileOption(Icons.account_balance_wallet, 'Кошелек', '247 700 000 сум'),
            const SizedBox(height: 8), // Промежуток между опциями
            _buildProfileOption(Icons.settings, 'Настройки', null),
            const SizedBox(height: 8),
            _buildProfileOption(Icons.support, 'Служба поддержки', null),
            const SizedBox(height: 8),
            _buildProfileOption(Icons.article, 'Условия использования', null),
            const SizedBox(height: 8),
            _buildProfileOption(Icons.info, 'О нас', null),
            const SizedBox(height: 10),
            _buildDivider(),
            const SizedBox(height: 10),
            _buildLogoutOption(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/person.jpeg'),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Kevin Lanceplaine',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '+998 99 123 45 57',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.grey),
            onPressed: () {
              // TODO: Add edit functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, String? trailing) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Icon(icon, color: Colors.purple, size: 28),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        trailing: trailing != null
            ? Text(
          trailing,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
            : const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          // TODO: Add navigation or functionality
        },
      ),
    );
  }

  Widget _buildLogoutOption() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: const Icon(Icons.logout, color: Colors.red, size: 28),
        title: const Text(
          'Выйти из аккаунта',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
        ),
        onTap: () {
          // TODO: Add logout functionality
        },
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade300,
    );
  }
}
