import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smart_clinic/features/auth/application/notifiers/auth_notifier.dart';
import 'package:smart_clinic/features/auth/application/states/auth_state.dart';
import 'package:smart_clinic/features/auth/domain/auth_user.dart'; // For date formatting

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    // Listen for side effects from profile updates or password changes
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      // Handle loading state specifically if a sub-operation was triggered
      if (previous is AuthLoading &&
          (next is Authenticated || next is AuthError)) {
        if (ModalRoute.of(context)?.isCurrent ?? false) {
          // Check if dialog is open
          // Potentially close any dialogs shown for loading, if any
        }
      }

      if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message), backgroundColor: Colors.red),
        );
      }
      // A general "Profile Updated" or "Password Changed" success message could be handled here
      // if AuthNotifier transitions to a specific success state or re-enters Authenticated
      // from a loading state after such an operation.
      // For example, if AuthNotifier sets a temporary success message in AuthAuthenticated state.
    });

    if (authState is Authenticated) {
      final user = authState.user;
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          actions: [
            TextButton(
              onPressed: () async {
                await authNotifier.logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            _buildProfileHeader(context, user),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Personal Information'),
            _buildInfoTile(Icons.email_outlined, 'Email', user.email),
            _buildInfoTile(Icons.phone_outlined, 'Phone', user.phone),
            _buildInfoTile(
              Icons.cake_outlined,
              'Date of Birth',
              DateFormat('MMMM d, yyyy').format(user.dateOfBirth),
            ),
            _buildInfoTile(Icons.wc_outlined, 'Gender', user.gender),
            _buildInfoTile(Icons.home_outlined, 'Address', user.address),
            _buildInfoTile(
              Icons.contact_phone_outlined,
              'Emergency Contact',
              user.emergencyContact,
            ),
            const Divider(height: 32),
            _buildSectionTitle(context, 'Account Actions'),
          ],
        ),
      );
    } else if (authState is AuthLoading || authState is AuthInitial) {
      return Scaffold(
        appBar: AppBar(title: const Text('My Profile')),
        body: const Center(child: CircularProgressIndicator()),
      );
    } else {
      // Should not happen if routed correctly (ProfileScreen usually accessed when authenticated)
      // but good to have a fallback.
      return Scaffold(
        appBar: AppBar(title: const Text('My Profile')),
        body: const Center(
          child: Text('Not authenticated or error loading profile.'),
        ),
        // Optionally, redirect to login:
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
        //   child: const Icon(Icons.login),
        // ),
      );
    }
  }

  Widget _buildProfileHeader(BuildContext context, AuthUser user) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
            style: TextStyle(
              fontSize: 40,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(user.name, style: Theme.of(context).textTheme.headlineSmall),
        Text(
          user.email, // Display email below name as sub-header
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
