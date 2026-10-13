import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/primary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Відновлення пароля',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.textMain),
              ),
              const SizedBox(height: 4),
              const Text(
                'Перевірте свою електронну пошту',
                style: TextStyle(color: AppColors.textMuted, fontSize: 14),
              ),
              const SizedBox(height: 28),
              const CustomTextField(
                label: 'Email',
                initialValue: 'bohdanfel@gmail.com',
                prefixIcon: Icons.mail_outline,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Код відновлення',
                initialValue: '567946',
                prefixIcon: Icons.lock_outline,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Скинути пароль',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Пароль успішно відновлено')),
                  );
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}