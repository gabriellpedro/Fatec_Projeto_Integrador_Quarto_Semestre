import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/themes.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ecoponto',
                    style: AppTheme.kBigTitle,
                  ),
                  const Gap(8),
                  Text(
                    'Ajude o planeta e a si próprio no processo',
                    style: AppTheme.kBodyText.copyWith(color: kWhiteColor),
                  ),
                  const Gap(4),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kWhiteColor,
                      foregroundColor: kSecondaryColor,
                    ),
                    onPressed: () {},
                    child: const Text('Reciclar'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/general/background_home.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
