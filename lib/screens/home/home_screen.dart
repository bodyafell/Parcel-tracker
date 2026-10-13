import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/carrier_logo.dart';
import '../../core/widgets/custom_bottom_nav.dart';
import '../../models/parcel.dart';
import '../profile/profile_screen.dart';
import 'add_parcel_sheet.dart';
import 'parcel_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedFilter = 0;
  int _currentNavIndex = 0;

  final List<Parcel> parcels = const [
    Parcel(
      title: 'Нові кросівки Nike',
      trackingNumber: '20450098342751',
      carrier: 'Нова Пошта',
      statusText: 'Готово до видачі',
      statusBg: AppColors.primaryLime,
      statusTextColor: Colors.black,
      dateText: 'Прибуло сьогодні',
      logoCode: 'NP',
    ),
    Parcel(
      title: 'Подарунок для мами',
      trackingNumber: '0503049182741',
      carrier: 'Укрпошта',
      statusText: 'В дорозі',
      statusBg: Color(0xFFFFF3CD),
      statusTextColor: Color(0xFF856404),
      dateText: 'Очікується 18 Жовт.',
      logoCode: 'UP',
    ),
    Parcel(
      title: 'Чохол для телефону',
      trackingNumber: 'MD78049175320',
      carrier: 'Meest Пошта',
      statusText: 'Доставлено',
      statusBg: Color(0xFFD4EDDA),
      statusTextColor: Color(0xFF155724),
      dateText: 'Отримано 12 Жовт.',
      logoCode: 'MEEST',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.viewInsetsOf(context).bottom > 0;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.fromLTRB(
                20,
                16,
                20,
                isKeyboardVisible ? 20 : 100,
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primaryLime,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.inventory_2_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Мої відправлення',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          color: AppColors.inputBg,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'БФ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: AppColors.inputBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: AppColors.textMuted),
                      hintText: 'Пошук за назвою або трек-номером...',
                      hintStyle: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip(0, 'Усі', '4'),
                      _buildFilterChip(1, 'В дорозі', '2'),
                      _buildFilterChip(2, 'Прибули', '1'),
                      _buildFilterChip(3, 'Архів', '1'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ...parcels.map((p) => _buildParcelCard(p)).toList(),
              ],
            ),
            if (!isKeyboardVisible)
              Positioned(
                bottom: 96,
                right: 20,
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.primaryLime,
                  elevation: 4,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const AddParcelSheet(),
                    );
                  },
                  child: const Icon(Icons.add, color: Colors.black, size: 28),
                ),
              ),
            if (!isKeyboardVisible)
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNav(
                  currentIndex: _currentNavIndex,
                  onTap: (i) {
                    if (i == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    } else {
                      setState(() => _currentNavIndex = i);
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(int index, String title, String count) {
    final bool isSelected = _selectedFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = index),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLime : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.4)
                    : AppColors.inputBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                count,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParcelCard(Parcel p) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ParcelDetailsScreen(parcel: p)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                _buildCarrierLogo(p.logoCode),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        p.trackingNumber,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: AppColors.textMuted),
              ],
            ),
            const Divider(height: 24, thickness: 0.8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: p.statusBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    p.statusText,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: p.statusTextColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      p.dateText,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarrierLogo(String code) {
    return CarrierLogo(code: code);
  }
}
