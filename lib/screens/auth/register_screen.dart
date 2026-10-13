import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/primary_button.dart';
import '../home/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Реєстрація',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.textMain),
              ),
              const SizedBox(height: 4),
              const Text(
                'Створіть профіль для швидкого старту',
                style: TextStyle(color: AppColors.textMuted, fontSize: 14),
              ),
              const SizedBox(height: 28),
              const CustomTextField(
                label: "Ім'я та прізвище",
                initialValue: 'Богдан Фель',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Підтвердження пароля',
                initialValue: '••••••••••••',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                suffix: Icon(Icons.visibility_outlined, color: AppColors.textMuted, size: 20),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLime,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.check, size: 16, color: Colors.black),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Я погоджуюся з ',
                        style: TextStyle(fontSize: 12, color: AppColors.textMuted),
                        children: [
                          TextSpan(
                            text: 'Умовами надання послуг',
                            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textMain),
                          ),
                          TextSpan(text: ' та '),
                          TextSpan(
                            text: 'Політикою конфіденційності',
                            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textMain),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: 'Зареєструватися',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Вже є профіль? ', style: TextStyle(color: AppColors.textMuted)),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text('Увійти', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}