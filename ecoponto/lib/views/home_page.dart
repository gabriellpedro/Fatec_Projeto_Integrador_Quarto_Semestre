import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/themes.dart';
import 'package:flutter_ecommerce/controllers/itembag_controller.dart';
import 'package:flutter_ecommerce/controllers/product_controller.dart';
import 'package:flutter_ecommerce/providers/balance_provider.dart';
import 'package:flutter_ecommerce/providers/material_api.dart';
import 'package:flutter_ecommerce/views/user/ecopontos_page.dart';
import 'package:flutter_ecommerce/views/user/profile_page.dart';
import 'package:flutter_ecommerce/widgets/ads_banner_widget.dart';
import 'package:flutter_ecommerce/widgets/card_widget.dart';
import 'package:flutter_ecommerce/widgets/chip_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'detail_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'cart_page.dart';
import 'map_page.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final materialsAsyncValue = ref.watch(materialProvider);
    final currentIndex = ref.watch(currentIndexProvider);

    final itemBag = ref.watch(itemBagProvider);
    final materialNotifier = ref.watch(materialNotifierProvider.notifier);

    void _onItemTapped(int index) {
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MapPage()),
        );
      } else if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserProfilePage()),
        );
      } else {
        ref.read(currentIndexProvider.notifier).state = index;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: SvgPicture.asset(
          'assets/general/store_brand_white.svg',
          color: kWhiteColor,
          width: 180,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Badge(
              label: Text(itemBag.length.toString()),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.local_mall,
                  size: 24,
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.radio_button_on_outlined),
                title: Text('Locais de EcoPonto'),
                subtitle: Text('Clique aqui para consultar os locais de Ecoponto'),
                trailing: Icon(Icons.arrow_right_sharp),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EcoPontoLocation(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: currentIndex == 0
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const AdsBannerWidget(),
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: const [
                          ChipWidget(chipLabel: 'Todos'),
                          ChipWidget(chipLabel: 'Vidro'),
                          ChipWidget(chipLabel: 'Metal'),
                          ChipWidget(chipLabel: 'Plástico'),
                        ],
                      ),
                    ),
                    const Gap(12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Materiais', style: AppTheme.kHeadingOne),
                        Text(
                          'Ver todos',
                          style: AppTheme.kSeeAllText,
                        ),
                      ],
                    ),
                    materialsAsyncValue.when(
                      data: (materials) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          materialNotifier.setMaterials(materials);
                        });
                        if (materials.isEmpty) {
                          return const Center(
                            child: Text('No materials available'),
                          );
                        }
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              width: double.infinity,
                              height: 300,
                              child: ListView.builder(
                                padding: const EdgeInsets.all(4),
                                itemCount: materials.length < 4 ? materials.length : 4,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    ProductCardWidget(productIndex: index),
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Todos os Materiais', style: AppTheme.kHeadingOne),
                                Text(
                                  'Ver todos',
                                  style: AppTheme.kSeeAllText,
                                ),
                              ],
                            ),
                            MasonryGridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: materials.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(getIndex: index),
                                  ),
                                ),
                                child: SizedBox(
                                  height: 250,
                                  child: ProductCardWidget(productIndex: index),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      loading: () => Column(
                        children: [
                          const CircularProgressIndicator(),
                          MasonryGridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4, // Display 4 loading placeholders
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) => Container(
                              height: 250,
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      error: (error, stackTrace) => Text('Error: $error'),
                    ),
                  ],
                ),
              ),
            )
          : Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Ecopontos',
            activeIcon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notificações',
            activeIcon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
