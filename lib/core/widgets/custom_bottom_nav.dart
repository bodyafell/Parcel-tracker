import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.darkNav,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(index: 0, icon: Icons.inventory_2_outlined, label: 'Посилки'),
          _buildItem(index: 1, icon: Icons.location_on_outlined, label: 'Відділення'),
          _buildItem(index: 2, icon: Icons.person_outline, label: 'Профіль'),
        ],
      ),
    );
  }

  Widget _buildItem({required int index, required IconData icon, required String label}) {
    final bool isSelected = currentIndex == index;
    final Color itemColor = isSelected ? AppColors.primaryLime : Colors.white70;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: itemColor, size: 22),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: itemColor,
            ),
          ),
        ],
      ),
    );
  }
}