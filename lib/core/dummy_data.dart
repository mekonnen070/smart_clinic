import 'package:smart_clinic/features/appointments/domain/appointment.dart';
import 'package:smart_clinic/features/auth/domain/auth_user.dart';
import 'package:smart_clinic/features/doctors/domain/doctor.dart';
import 'package:smart_clinic/features/doctors/domain/doctor_info.dart';
import 'package:smart_clinic/features/doctors/domain/doctor_slot.dart';

// --- Dummy Auth User ---
final dummyAuthUser = AuthUser(
  userId: 'user-dummy-patient-001',
  patientSpecificId: 'patient-dummy-001',
  name: 'Demo Patient',
  email: 'patient@demo.com',
  phone: '0912345678',
  role: 'patient',
  dateOfBirth: DateTime(1990, 5, 15),
  gender: 'Female',
  address: '123 Demo St, Addis Ababa',
  emergencyContact: '0987654321',
);

// --- Dummy Doctors & Slots ---
final dummyDoctor1Slots = [
  DoctorSlot(
    id: 'slot-d1-001',
    day: 'MONDAY',
    slotTime: '10:00',
    isBooked: false,
  ),
  DoctorSlot(
    id: 'slot-d1-002',
    day: 'MONDAY',
    slotTime: '10:30',
    isBooked: true,
  ), // Booked
  DoctorSlot(
    id: 'slot-d1-003',
    day: 'TUESDAY',
    slotTime: '14:00',
    isBooked: false,
  ),
];

final dummyDoctor2Slots = [
  DoctorSlot(
    id: 'slot-d2-001',
    day: 'WEDNESDAY',
    slotTime: '09:00',
    isBooked: false,
  ),
  DoctorSlot(
    id: 'slot-d2-002',
    day: 'FRIDAY',
    slotTime: '11:00',
    isBooked: false,
  ),
  DoctorSlot(
    id: 'slot-d2-003',
    day: 'FRIDAY',
    slotTime: '11:30',
    isBooked: false,
  ),
];

final List<Doctor> dummyDoctors = [
  Doctor(
    userId: 'user-dummy-doc-001',
    doctorSpecificId: 'doc-001',
    name: 'Vita Demsis',
    email: 'dr.vita@clinic.com',
    phone: '0911223344',
    specialization: 'Cardiology',
    slots: dummyDoctor1Slots,
  ),
  Doctor(
    userId: 'user-dummy-doc-002',
    doctorSpecificId: 'doc-002',
    name: 'Abel Kassahun',
    email: 'dr.abel@clinic.com',
    phone: '0922334455',
    specialization: 'Pediatrics',
    slots: dummyDoctor2Slots,
  ),
  Doctor(
    userId: 'user-dummy-doc-003',
    doctorSpecificId: 'doc-003',
    name: 'Sara Tadesse',
    email: 'dr.sara@clinic.com',
    phone: '0933445566',
    specialization: 'General Medicine',
    slots: [
      // No specific slots, or few
      DoctorSlot(
        id: 'slot-d3-001',
        day: 'MONDAY',
        slotTime: '16:00',
        isBooked: false,
      ),
    ],
  ),
];

// --- Dummy Appointments ---
// For DoctorInfo, we create instances based on our dummyDoctors
final dummyDoctorInfo1 = DoctorInfo(
  doctorSpecificId: dummyDoctors[0].doctorSpecificId,
  name: dummyDoctors[0].name,
  email: dummyDoctors[0].email,
  phone: dummyDoctors[0].phone,
  specialization: dummyDoctors[0].specialization,
);

final dummyDoctorInfo2 = DoctorInfo(
  doctorSpecificId: dummyDoctors[1].doctorSpecificId,
  name: dummyDoctors[1].name,
  email: dummyDoctors[1].email,
  phone: dummyDoctors[1].phone,
  specialization: dummyDoctors[1].specialization,
);

List<Appointment> dummyAppointments = [
  Appointment(
    id: 'apt-001',
    dateTime: DateTime.now().subtract(const Duration(days: 7, hours: 2)),
    status: 'Completed',
    reason: 'Annual Checkup',
    doctor: dummyDoctorInfo1,
  ),
  Appointment(
    id: 'apt-002',
    dateTime: DateTime.now().add(const Duration(days: 3, hours: 4)),
    status: 'Confirmed',
    reason: 'Follow-up Consultation',
    doctor: dummyDoctorInfo2,
  ),
  Appointment(
    id: 'apt-003',
    dateTime: DateTime.now().subtract(const Duration(days: 30)),
    status: 'Completed',
    reason: 'Initial Consultation for Heart Palpitations',
    doctor: dummyDoctorInfo1,
  ),
];

// --- Dummy Medical Records (Simplified) ---
// If "records" means something like prescriptions or lab results,
// you'd define simplified models or use strings for now.
// Example: A list of strings for simplicity
const List<String> dummyMedicalRecordsSimple = [
  "Prescription: Amoxicillin (03/15/2025) - Dr. Vita Demsis",
  "Lab Result: Blood Panel Normal (03/10/2025)",
  "Prescription: Ibuprofen (02/20/2025) - Dr. Abel Kassahun",
];

// If you need a more structured mock for medical records based on backend's getMedicalHistory
// which returns prescriptions,
// you might create a simplified Prescription-like model here or just use Maps.
// For now, the simple string list above or just relying on appointment history might be enough for the demo.
