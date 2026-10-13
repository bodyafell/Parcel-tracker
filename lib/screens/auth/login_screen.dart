import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/primary_button.dart';
import '../home/home_screen.dart';
import 'forgot_password_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLime,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(Icons.inventory_2_outlined, size: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'ДеПосилка',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.textMain),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Усі твої посилки в одному місці',
                      style: TextStyle(fontSize: 14, color: AppColors.textMuted),
                    ),
                    const SizedBox(height: 40),
                    const CustomTextField(
                      label: 'Email',
                      initialValue: 'bohdanfel@gmail.com',
                      prefixIcon: Icons.mail_outline,
                    ),
                    const SizedBox(height: 16),
                    const CustomTextField(
                      label: 'Пароль',
                      initialValue: '••••••••••••',
                      prefixIcon: Icons.lock_outline,
                      obscureText: true,
                      suffix: Icon(Icons.visibility_outlined, color: AppColors.textMuted, size: 20),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
                          );
                        },
                        child: const Text(
                          'Забули пароль?',
                          style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    PrimaryButton(
                      text: 'Увійти',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.inputBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Немає акаунту? ', style: TextStyle(color: AppColors.textMuted)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const RegisterScreen()),
                              );
                            },
                            child: const Text(
                              'Створити акаунт',
                              style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textMain),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}