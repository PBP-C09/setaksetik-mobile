import 'package:flutter/material.dart';
import 'package:setaksetikmobile/main.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:setaksetikmobile/screens/login.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF842323),
              child: Icon(
                Icons.person,
                size: 50,
                color: Color(0xFFF5F5DC),
              ),
            ),
            SizedBox(height: 20),
            _buildProfileInfo('Full Name', UserProfile.data["full_name"]),
            SizedBox(height: 10),
            _buildProfileInfo('Username', UserProfile.data["username"]),
            SizedBox(height: 10),
            _buildProfileInfo('Role', UserProfile.data["role"]),
            SizedBox(height: 40),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6D4C41),
              fontFamily: 'Raleway',
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF3E2723),
              fontFamily: 'Playfair Display',
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return ElevatedButton(
      onPressed: () async {
        final response = await request.logout(
          "http://127.0.0.1:8000/logout-mobile/");
        String message = response["message"];
        if (context.mounted) {
          if (response['status']) {
            String uname = response["username"];
            UserProfile.logout();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("$message Sampai jumpa, $uname."),
            ));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF842323),
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      ),
      child: Text(
        'Logout',
        style: TextStyle(
          color: Color(0xFFF5F5DC),
          fontFamily: 'Playfair Display',
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
