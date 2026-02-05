import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import '../main.dart';
import '../const/colors.dart';
import 'sign_up_screen.dart';
import 'home_screen.dart';
import '../widgets/bus_widg.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback? onRegisterTap;

  const SignInScreen({
    super.key,
    this.onRegisterTap,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Molimo unesite email i lozinku (kartu)."),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      var response = await client.modules.auth.email.authenticate(
        email,
        password,
      );

      if (response.success) {
        await sessionManager.initialize();

        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Greška pri ulasku u bus: ${response.failReason}"),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Problem sa konekcijom: $e")),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const AnimatedBusBackground(),
          Center(
            child: SingleChildScrollView(
              child: Opacity(
                opacity: 0.96,
                child: BusWidget(
                  topText: '493 LOGIN',
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Mladenovac - Beograd",
                        style: AppFonts.subtitle(
                          context,
                        ).copyWith(color: AppColors.lightGrey),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        style: AppFonts.chatText(context),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: AppFonts.chatText(
                            context,
                          ).copyWith(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: AppColors.darkBlue,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.darkBlue,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fillColor: AppColors.lightGrey,
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        style: AppFonts.chatText(context),
                        decoration: InputDecoration(
                          labelText: 'Lozinka (Karta)',
                          labelStyle: AppFonts.chatText(
                            context,
                          ).copyWith(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(
                            Icons.confirmation_number,
                            color: AppColors.darkBlue,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.darkBlue,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fillColor: AppColors.lightGrey,
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red,
                            foregroundColor: AppColors.lightYellow,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _isLoading ? null : _handleSignIn,
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text("KRENI", style: AppFonts.button(context)),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Nemaš nalog? Registruj se ovde.",
                          style: AppFonts.chatText(
                            context,
                          ).copyWith(color: AppColors.lightGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
