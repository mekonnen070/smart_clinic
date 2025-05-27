import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_clinic/features/appointments/application/notifiers/appointment_notifier.dart';
import 'package:smart_clinic/features/appointments/application/states/appointment_state.dart';
import 'package:smart_clinic/features/doctors/application/notifiers/doctor_notifier.dart';
import 'package:smart_clinic/features/doctors/application/states/doctor_state.dart';
import 'package:smart_clinic/features/doctors/domain/doctor.dart';
import 'package:smart_clinic/features/doctors/domain/doctor_slot.dart';

class BookAppointmentScreen extends ConsumerStatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  ConsumerState<BookAppointmentScreen> createState() =>
      _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends ConsumerState<BookAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();

  Doctor? _selectedDoctor;
  DoctorSlot? _selectedSlot;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final doctorState = ref.read(doctorNotifierProvider);
      if (doctorState is DoctorInitial || doctorState is DoctorError) {
        ref.read(doctorNotifierProvider.notifier).fetchDoctors();
      }
    });
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  void _resetSelections() {
    setState(() {
      _selectedDoctor = null;
      _selectedSlot = null;
      _reasonController.clear();
    });
  }

  void _onBookAppointment() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedDoctor != null && _selectedSlot != null) {
        ref
            .read(appointmentNotifierProvider.notifier)
            .bookAppointment(
              doctorId: _selectedDoctor!.doctorSpecificId,
              slotId: _selectedSlot!.id,
              reason: _reasonController.text.trim(),
            );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a doctor and a time slot.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final doctorState = ref.watch(doctorNotifierProvider);
    final appointmentBookingState = ref.watch(appointmentNotifierProvider);

    ref.listen<AppointmentState>(appointmentNotifierProvider, (previous, next) {
      if (next is AppointmentBookingSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Appointment booked successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(); // Go back to home screen
      } else if (next is AppointmentBookingError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Booking failed: ${next.message}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Book New Appointment')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TODO: Add specialization filter dropdown if desired
              // This would call ref.read(doctorNotifierProvider.notifier).fetchDoctors(specialization: newSpecialization);
              // For simplicity, we are not implementing the filter UI in this step.
              const Text(
                '1. Select a Doctor:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildDoctorList(doctorState),

              if (_selectedDoctor != null) ...[
                const SizedBox(height: 24),
                Text(
                  '2. Select an Available Slot for Dr. ${_selectedDoctor!.name}:',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                _buildSlotList(_selectedDoctor!),
              ],

              if (_selectedDoctor != null && _selectedSlot != null) ...[
                const SizedBox(height: 24),
                const Text(
                  '3. Reason for Appointment:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _reasonController,
                  decoration: const InputDecoration(
                    labelText: 'Reason (e.g., "Annual Checkup")',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a reason for your appointment.';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed:
                      appointmentBookingState is AppointmentBooking
                          ? null
                          : _onBookAppointment,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child:
                      appointmentBookingState is AppointmentBooking
                          ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                          : const Text(
                            'Confirm Booking',
                            style: TextStyle(fontSize: 16),
                          ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorList(DoctorState state) {
    if (state is DoctorLoading || state is DoctorInitial) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is DoctorLoaded) {
      if (state.doctors.isEmpty) {
        return const Center(child: Text('No doctors available at the moment.'));
      }
      return DropdownButtonFormField<Doctor>(
        decoration: const InputDecoration(
          labelText: 'Select Doctor',
          border: OutlineInputBorder(),
        ),
        value: _selectedDoctor,
        hint: const Text('Choose a doctor'),
        isExpanded: true,
        items:
            state.doctors.map((doctor) {
              return DropdownMenuItem<Doctor>(
                value: doctor,
                child: Text('Dr. ${doctor.name} (${doctor.specialization})'),
              );
            }).toList(),
        onChanged: (Doctor? doctor) {
          setState(() {
            _selectedDoctor = doctor;
            _selectedSlot = null; // Reset slot when doctor changes
          });
        },
        validator: (value) => value == null ? 'Please select a doctor.' : null,
      );
    } else if (state is DoctorError) {
      return Center(child: Text('Error fetching doctors: ${state.message}'));
    }
    return const Center(child: Text('Please wait...'));
  }

  Widget _buildSlotList(Doctor doctor) {
    final availableSlots =
        doctor.slots.where((slot) => !slot.isBooked).toList();

    if (availableSlots.isEmpty) {
      return const Text(
        'No available slots for this doctor. Please try another doctor or check back later.',
      );
    }

    // Group slots by day for better readability
    Map<String, List<DoctorSlot>> slotsByDay = {};
    for (var slot in availableSlots) {
      slotsByDay.putIfAbsent(slot.day, () => []).add(slot);
    }

    // Ensure consistent order of days (e.g., MONDAY, TUESDAY...)
    final sortedDays =
        slotsByDay.keys.toList()..sort((a, b) {
          const dayOrder = {
            "MONDAY": 1,
            "TUESDAY": 2,
            "WEDNESDAY": 3,
            "THURSDAY": 4,
            "FRIDAY": 5,
            "SATURDAY": 6,
            "SUNDAY": 7,
          };
          return (dayOrder[a] ?? 8).compareTo(dayOrder[b] ?? 8);
        });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          sortedDays.map((day) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
                  child: Text(
                    day,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children:
                      slotsByDay[day]!.map((slot) {
                        final isSelected = _selectedSlot == slot;
                        return ChoiceChip(
                          label: Text(slot.slotTime),
                          selected: isSelected,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedSlot = selected ? slot : null;
                            });
                          },
                          selectedColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            color:
                                isSelected
                                    ? Colors.white
                                    : Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.color,
                          ),
                        );
                      }).toList(),
                ),
              ],
            );
          }).toList(),
    );
  }
}
