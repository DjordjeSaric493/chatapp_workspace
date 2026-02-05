import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/sign_up_viewmodel.dart';
import '../const/colors.dart';
import '../widgets/bus_widg.dart';

class SignUpScreen extends StatelessWidget {
  final Widget? child;
  const SignUpScreen({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.registrationSuccess) {
            return const Scaffold(
              body: Center(child: Text("Proverite email za verifikaciju!")),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  const AnimatedBusBackground(),
                  Center(
                    child: SingleChildScrollView(
                      child: Opacity(
                        opacity: 0.96,
                        child: BusSignUpCard(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class BusSignUpCard extends StatefulWidget {
  const BusSignUpCard({super.key});

  @override
  State<BusSignUpCard> createState() => _BusSignUpCardState();
}

class _BusSignUpCardState extends State<BusSignUpCard> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  String? _username, _email, _password;

  @override
  Widget build(BuildContext context) {
    return BusWidget(
      topText: '493  M L A D E N O V A C',
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Korisničko ime',
                prefixIcon: const Icon(Icons.person, color: AppColors.darkBlue),
                border: const OutlineInputBorder(),
                fillColor: AppColors.lightGrey,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
                ),
              ),
              onSaved: (v) => _username = v,
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email, color: AppColors.darkBlue),
                border: const OutlineInputBorder(),
                fillColor: AppColors.lightGrey,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (v) => _email = v,
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Lozinka',
                prefixIcon: const Icon(Icons.lock, color: AppColors.darkBlue),
                border: const OutlineInputBorder(),
                fillColor: AppColors.lightGrey,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkBlue, width: 2),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.darkBlue,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              obscureText: _obscurePassword,
              onSaved: (v) => _password = v,
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  foregroundColor: AppColors.lightYellow,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    final viewModel = Provider.of<SignUpViewModel>(
                      context,
                      listen: false,
                    );
                    bool uspeh = await viewModel.signUp(
                      _username!,
                      _email!,
                      _password!,
                    );
                    if (uspeh) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Karta izdata! Možete se ulogovati.'),
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Greška pri registraciji. Pokušajte ponovo.',
                          ),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Registruj se'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
