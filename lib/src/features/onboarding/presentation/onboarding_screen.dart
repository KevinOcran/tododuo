import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../domain/entities/user_role.dart';
import 'onboarding_view_model.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(onboardingViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Complete Your Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select Your Role',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoleButton(
                    role: UserRole.buyer,
                    isSelected: viewModel.selectedRole == UserRole.buyer,
                    onPressed: () => viewModel.selectRole(UserRole.buyer),
                  ),
                  RoleButton(
                    role: UserRole.seller,
                    isSelected: viewModel.selectedRole == UserRole.seller,
                    onPressed: () => viewModel.selectRole(UserRole.seller),
                  ),
                  RoleButton(
                    role: UserRole.dispatcher,
                    isSelected: viewModel.selectedRole == UserRole.dispatcher,
                    onPressed: () => viewModel.selectRole(UserRole.dispatcher),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              if (viewModel.selectedRole != null)
                ..._buildRoleSpecificFields(viewModel),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: viewModel.selectedRole == null || viewModel.isLoading
                    ? null
                    : () async {
                        await viewModel.completeOnboarding();
                        if (mounted) {
                          context.go('/home');
                        }
                      },
                child: viewModel.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Complete Onboarding'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildRoleSpecificFields(OnboardingViewModel viewModel) {
    switch (viewModel.selectedRole!) {
      case UserRole.buyer:
        return [
          TextField(
            controller: viewModel.nameController,
            decoration: const InputDecoration(labelText: 'Full Name'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: viewModel.phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
          ),
        ];
      case UserRole.seller:
        return [
          TextField(
            controller: viewModel.storeNameController,
            decoration: const InputDecoration(labelText: 'Store Name'),
          ),
        ];
      case UserRole.dispatcher:
        return [
          TextField(
            controller: viewModel.vehicleNumberPlateController,
            decoration: const InputDecoration(
              labelText: 'Vehicle Plate Number',
            ),
          ),
        ];
    }
  }
}

class RoleButton extends StatelessWidget {
  final UserRole role;
  final bool isSelected;
  final VoidCallback onPressed;

  const RoleButton({
    super.key,
    required this.role,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Theme.of(context).primaryColor
            : Colors.grey,
      ),
      child: Text(role.toString().split('.').last),
    );
  }
}
