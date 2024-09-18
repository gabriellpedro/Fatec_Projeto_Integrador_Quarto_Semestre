import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/providers/user_operation_provider.dart';
import 'package:flutter_ecommerce/providers/user_provider.dart';
import 'package:flutter_ecommerce/widgets/card_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);
    final userCostsAsyncValue = ref.watch(userOperationProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
        ),
        body: userAsyncValue.when(
          data: (user) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/1253/1253756.png'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user.email,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Recent Transactions',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        userCostsAsyncValue.when(
                          data: (userCosts) {
                            return ProfileCard(
                              currentTotal: userCosts.currentTotal,
                              totalEarned: userCosts.totalEarned,
                            );
                          },
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (error, stack) =>
                              Center(child: Text('Error: $error')),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ));
  }
}
