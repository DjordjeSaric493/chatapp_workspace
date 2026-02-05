import 'package:flutter/material.dart';
import '../const/colors.dart';

class BusWidget extends StatelessWidget {
  final Widget child;
  final String topText;
  final double? width;
  final double? busFontSize;
  const BusWidget({
    super.key,
    required this.child,
    required this.topText,
    this.width,
    this.busFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final busWidth = width ?? (screenWidth > 400 ? 400.0 : screenWidth * 0.95);
    return Material(
      color: Colors.transparent,
      child: Container(
        width: busWidth,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bus line display (top stripe)
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                topText,
                style: TextStyle(
                  color: AppColors.lightYellow,
                  fontWeight: FontWeight.bold,
                  fontSize: busFontSize ?? 18,
                  letterSpacing: 2.5,
                ),
              ),
            ),
            const SizedBox(height: 18),
            child,
            const SizedBox(height: 18),
            // Bus maska (bottom stripe)
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                ),
                // Farovi
                Positioned(
                  left: 0,
                  child: Container(
                    width: 40,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.lightYellow,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.black.withOpacity(0.1),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.lightYellow,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.black.withOpacity(0.1),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                // Centrirana slika (logo, maskota, ili prazno mesto)
                Center(
                  child: Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.lightGrey,
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.directions_bus,
                      size: 32,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
