import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_clinic/features/doctors/application/states/doctor_state.dart';
import 'package:smart_clinic/features/doctors/data/doctor_repository.dart';

final doctorNotifierProvider =
    StateNotifierProvider<DoctorNotifier, DoctorState>((ref) {
      final doctorRepository = ref.watch(doctorRepositoryProvider);
      return DoctorNotifier(doctorRepository);
    });

class DoctorNotifier extends StateNotifier<DoctorState> {
  final DoctorRepository _doctorRepository;

  DoctorNotifier(this._doctorRepository) : super(const DoctorState.initial());

  Future<void> fetchDoctors({String? specialization}) async {
    state = const DoctorState.loading();
    try {
      final doctors = await _doctorRepository.getDoctors(
        specialization: specialization,
      );
      state = DoctorState.loaded(doctors: doctors);
    } catch (e) {
      state = DoctorState.error(message: e.toString());
    }
  }
}
