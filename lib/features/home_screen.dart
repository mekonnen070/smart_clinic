import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/features/appointments/application/notifiers/appointment_notifier.dart';
import 'package:smart_clinic/features/appointments/application/states/appointment_state.dart';
import 'package:smart_clinic/features/widgets/theme_icon_widget.dart';

// Placeholder for BookAppointmentScreen route name
const String bookAppointmentRoute = '/book-appointment';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch appointments when the screen is initialized
    // Use WidgetsBinding.instance.addPostFrameCallback to ensure ref is available
    // and notifier is called after the first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check if appointments are already loaded or loading to avoid redundant calls
      final currentState = ref.read(appointmentNotifierProvider);
      if (currentState is AppointmentInitial ||
          currentState is AppointmentError) {
        ref.read(appointmentNotifierProvider.notifier).fetchAppointments();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appointmentState = ref.watch(appointmentNotifierProvider);

    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Appointments'),
          actions: [
            IconButton(
              icon: const Icon(Icons.person_outline), // Profile icon
              tooltip: 'Profile',
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed('/profile'); // Navigate to ProfileScreen
              },
            ),
            ThemeIconWidget(brightness: Theme.of(context).brightness),
          ],
        ),
        body: SafeArea(
          child: Center(child: _buildAppointmentList(appointmentState)),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(
              context,
            ).pushNamed('/book-appointment'); // Updated navigation
          },
          icon: const Icon(Icons.add),
          label: const Text('Book Appointment'),
        ),
      ),
    );
  }

  Widget _buildAppointmentList(AppointmentState state) {
    // Using the if/else if pattern for state handling
    if (state is AppointmentLoading || state is AppointmentInitial) {
      return const CircularProgressIndicator();
    } else if (state is AppointmentLoaded) {
      if (state.appointments.isEmpty) {
        return const Text('You have no upcoming or past appointments.');
      }
      // Display list of appointments
      return ListView.builder(
        itemCount: state.appointments.length,
        itemBuilder: (context, index) {
          final appointment = state.appointments[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                'Dr. ${appointment.doctor.name} (${appointment.doctor.specialization})',
              ),
              subtitle: Text(
                'Reason: ${appointment.reason}\nStatus: ${appointment.status}',
              ),
              trailing: Text(
                // Format DateTime to a more readable string, requires 'intl' package
                // DateFormat.yMMMd().add_jm().format(appointment.dateTime),
                appointment.dateTime.toLocal().toString().substring(
                  0,
                  16,
                ), // Simple formatting
              ),
              isThreeLine: true,
              // onTap: () {
              //   // Navigate to appointment detail screen (TODO)
              // },
            ),
          );
        },
      );
    } else if (state is AppointmentError) {
      return Text('Error fetching appointments: ${state.message}');
    } else if (state is AppointmentBooking ||
        state is AppointmentBookingSuccess ||
        state is AppointmentBookingError) {
      // If we want to show a specific UI during/after booking before list refresh
      // For now, assuming fetchAppointments() is called after booking, so list will update.
      // Could return a specific message or loading indicator here too.
      // As fetchAppointments is called, it will transition to AppointmentLoading.
      return const CircularProgressIndicator(); // Or specific message
    }
    return const Text(
      'Welcome! Fetching your appointments...',
    ); // Default fallback
  }
}
