import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/carrier_logo.dart';
import '../../core/widgets/primary_button.dart';

class AddParcelSheet extends StatefulWidget {
  const AddParcelSheet({super.key});

  @override
  State<AddParcelSheet> createState() => _AddParcelSheetState();
}

class _AddParcelSheetState extends State<AddParcelSheet> {
  int _selectedCarrier = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Додати відправлення',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.cancel, color: Colors.black26),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Трек-номер (ТТН)', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.inputBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.inventory_2_outlined, color: AppColors.textMuted, size: 20),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '20450098342751',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code_scanner, size: 18, color: Colors.black),
                  label: const Text('Сканувати', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text('Користувацька назва', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.inputBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.edit_outlined, color: AppColors.textMuted, size: 20),
                hintText: 'Наприклад: Нові кросівки Nike',
                hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['+ Взуття', '+ Подарунок', '+ Одяг', '+ Косметика'].map((tag) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.inputBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(tag, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 18),
          const Text('Служба доставки', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildCarrierOption(0, 'Нова\nПошта', 'NP'),
              const SizedBox(width: 10),
              _buildCarrierOption(1, 'Укрпо\nшта', 'UP'),
              const SizedBox(width: 10),
              _buildCarrierOption(2, 'Meest', 'MEEST'),
            ],
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            icon: Icons.save_alt,
            text: 'Зберегти відправлення',
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Відправлення додано!')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCarrierOption(int index, String title, String logoCode) {
    final bool isSelected = _selectedCarrier == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedCarrier = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.inputBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppColors.primaryLimeDark : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarrierLogo(code: logoCode, size: 30),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}