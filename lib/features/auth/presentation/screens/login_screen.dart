import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/notifiers/auth_notifier.dart';
import '../../application/states/auth_state.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final obscurePassword = useState(true);

    // Listen to AuthState changes for side-effects
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is Authenticated) {
        // Navigate to home screen on successful authentication
        Navigator.of(context).pushReplacementNamed('/home');
      } else if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message), backgroundColor: Colors.red),
        );
      } else if (next is Unauthenticated) {
        if (next.message != null && next.message!.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.message!)));
        }
      }
      // No specific action for AuthInitial or AuthLoading in ref.listen here,
      // as those are usually handled by UI changes via ref.watch.
    });

    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Clinic - Patient Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
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
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                        r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(value.trim())) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed:
                            () =>
                                obscurePassword.value = !obscurePassword.value,
                      ),
                    ),
                    obscureText: obscurePassword.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      if (authState is! AuthLoading) {
                        if (formKey.currentState?.validate() ?? false) {
                          ref
                              .read(authNotifierProvider.notifier)
                              .login(
                                emailController.text.trim(),
                                passwordController.text,
                              );
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: const TextStyle(fontSize: 16.0),
                    ),
                    onPressed:
                        authState is AuthLoading
                            ? null // Disable button when loading
                            : () {
                              if (formKey.currentState?.validate() ?? false) {
                                FocusScope.of(
                                  context,
                                ).unfocus(); // Dismiss keyboard
                                ref
                                    .read(authNotifierProvider.notifier)
                                    .login(
                                      emailController.text.trim(),
                                      passwordController.text,
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
                            : const Text('Login'),
                  ),
                  const SizedBox(height: 16.0),
                  TextButton(
                    onPressed:
                        authState is AuthLoading
                            ? null
                            : () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                    child: const Text("Don't have an account? Sign Up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
