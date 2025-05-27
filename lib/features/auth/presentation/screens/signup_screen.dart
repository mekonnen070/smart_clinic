import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

// Adjust import paths based on your project structure
import '../../application/notifiers/auth_notifier.dart';
import '../../application/states/auth_state.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final phoneController = useTextEditingController();
    final dateOfBirthController = useTextEditingController();
    final addressController = useTextEditingController();
    final emergencyContactController = useTextEditingController();

    final obscurePassword = useState(true);
    final obscureConfirmPassword = useState(true);
    final selectedDate = useState<DateTime?>(null);
    final selectedGender = useState<String?>(null);

    final genderOptions = ['Male', 'Female', 'Other'];

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is Unauthenticated &&
          next.message == 'Registration successful. Please login.') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message!), backgroundColor: Colors.green),
        );
        // Optionally navigate back to login or clear fields
        Navigator.of(context).pop(); // Go back to login screen
      } else if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message), backgroundColor: Colors.red),
        );
      }
      // No explicit navigation for Authenticated state here, as registration
      // leads to Unauthenticated with a message to login.
    });

    final authState = ref.watch(authNotifierProvider);

    Future<void> pickDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate.value) {
        selectedDate.value = picked;
        dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Registration'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Create Your Account',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),

                _buildTextFormField(
                  controller: nameController,
                  labelText: 'Full Name',
                  icon: Icons.person_outline,
                  validator:
                      (val) =>
                          (val == null || val.trim().isEmpty)
                              ? 'Name is required'
                              : null,
                ),
                _buildTextFormField(
                  controller: emailController,
                  labelText: 'Email Address',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty)
                      return 'Email is required';
                    if (!RegExp(
                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(val.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                _buildTextFormField(
                  controller: passwordController,
                  labelText: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: obscurePassword.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed:
                        () => obscurePassword.value = !obscurePassword.value,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty)
                      return 'Password is required';
                    if (val.length < 6)
                      return 'Password must be at least 6 characters';
                    return null;
                  },
                ),
                _buildTextFormField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  icon: Icons.lock_outline,
                  obscureText: obscureConfirmPassword.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed:
                        () =>
                            obscureConfirmPassword.value =
                                !obscureConfirmPassword.value,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty)
                      return 'Confirm password is required';
                    if (val != passwordController.text)
                      return 'Passwords do not match';
                    return null;
                  },
                ),
                _buildTextFormField(
                  controller: phoneController,
                  labelText: 'Phone Number',
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator:
                      (val) =>
                          (val == null || val.trim().isEmpty)
                              ? 'Phone number is required'
                              : null,
                ),

                TextFormField(
                  controller: dateOfBirthController,
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                  ),
                  readOnly: true,
                  onTap: pickDate,
                  validator:
                      (val) =>
                          (val == null || val.isEmpty)
                              ? 'Date of birth is required'
                              : null,
                ),
                const SizedBox(height: 16.0),

                DropdownButtonFormField<String>(
                  value: selectedGender.value,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.wc_outlined),
                  ),
                  items:
                      genderOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged: (String? newValue) {
                    selectedGender.value = newValue;
                  },
                  validator: (val) => val == null ? 'Gender is required' : null,
                ),
                const SizedBox(height: 16.0),

                _buildTextFormField(
                  controller: addressController,
                  labelText: 'Address',
                  icon: Icons.home_outlined,
                  validator:
                      (val) =>
                          (val == null || val.trim().isEmpty)
                              ? 'Address is required'
                              : null,
                ),
                _buildTextFormField(
                  controller: emergencyContactController,
                  labelText: 'Emergency Contact Phone',
                  icon: Icons.contact_phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator:
                      (val) =>
                          (val == null || val.trim().isEmpty)
                              ? 'Emergency contact is required'
                              : null,
                ),

                const SizedBox(height: 24.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: const TextStyle(fontSize: 16.0),
                  ),
                  onPressed:
                      authState is AuthLoading
                          ? null
                          : () {
                            if (formKey.currentState?.validate() ?? false) {
                              if (selectedDate.value == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please select date of birth',
                                    ),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                                return;
                              }
                              if (selectedGender.value == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select gender'),
                                    backgroundColor: Colors.orange,
                                  ),
                                );
                                return;
                              }
                              FocusScope.of(context).unfocus();
                              ref
                                  .read(authNotifierProvider.notifier)
                                  .registerPatient(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                    phone: phoneController.text.trim(),
                                    dateOfBirth: selectedDate.value!,
                                    gender: selectedGender.value!,
                                    address: addressController.text.trim(),
                                    emergencyContact:
                                        emergencyContactController.text.trim(),
                                  );
                            }
                          },
                  child:
                      authState is AuthLoading
                          ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            ),
                          )
                          : const Text('Register'),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed:
                      authState is AuthLoading
                          ? null
                          : () {
                            Navigator.of(
                              context,
                            ).pop(); // Go back to Login Screen
                          },
                  child: const Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
          suffixIcon: suffixIcon,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
