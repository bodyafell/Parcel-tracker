import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/carrier_logo.dart';
import '../../models/parcel.dart';

class ParcelDetailsScreen extends StatelessWidget {
  final Parcel parcel;

  const ParcelDetailsScreen({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Деталі відправлення', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CarrierLogo(code: parcel.logoCode),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(parcel.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(parcel.trackingNumber, style: const TextStyle(color: AppColors.textMuted)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6FDE8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('ПОТОЧНИЙ СТАТУС', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54)),
                      SizedBox(height: 4),
                      Text('Очікує у відділенні №12', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      SizedBox(height: 2),
                      Text('Термін безкоштовного зберігання до 21.10', style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLime,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.share_outlined, size: 18),
                    label: const Text('Поділитися', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.statusRed),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.delete_outline, size: 18, color: AppColors.statusRed),
                    label: const Text('Видалити', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.statusRed)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text('Маршрут відправлення', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildTimelineItem(
            isFirst: true,
            title: 'Прибуло у відділення',
            subtitle: 'Київ, Відділення №12 (вул. Хрещатик, 15)',
            time: 'Сьогодні, 11:45',
            isActive: true,
          ),
          _buildTimelineItem(
            title: 'Відправлено за маршрутом',
            subtitle: 'Транзитний термінал Київ-Центр',
            time: 'Вчора, 20:15',
            isActive: false,
          ),
          _buildTimelineItem(
            title: 'Прийнято у сортувальному центрі',
            subtitle: 'Сортувальний центр Львів',
            time: '14 Жовт., 18:30',
            isActive: false,
          ),
          _buildTimelineItem(
            isLast: true,
            title: 'Оформлено замовлення',
            subtitle: 'Відправник: ТОВ Спорт-Маркет',
            time: '14 Жовт., 14:10',
            isActive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required String time,
    required bool isActive,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primaryLime : Colors.black87,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 54,
                color: Colors.black12,
              ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(time, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                ],
              ),
              const SizedBox(height: 3),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}