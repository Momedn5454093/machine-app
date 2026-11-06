import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF247CFF), Color(0xFF1B59C1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is Success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login Successful!')),
                      );
                    } else if (state is Error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<LoginCubit>();
                    return Column(
                      children: [
                        const Icon(
                          Icons.analytics_rounded,
                          size: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'RetenScope',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Customer Retention & Churn Prediction',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Form(
                            key: cubit.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome Back',
                                  style: TextStyles.font24BlackBold,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Sign in to your RetenScope account',
                                  style: TextStyles.font13GrayRegular,
                                ),
                                const SizedBox(height: 24),
                                AppTextFormField(
                                  hintText: 'Email Address',
                                  controller: cubit.emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                AppTextFormField(
                                  hintText: 'Password',
                                  isObscureText: true,
                                  controller: cubit.passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid password';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 24),
                                state is Loading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : AppTextButton(
                                        onPressed: () {
                                          if (cubit.formKey.currentState!
                                              .validate()) {
                                            cubit.emitLoginStates();
                                          }
                                        },
                                        buttonText: 'Login to Dashboard',
                                        textStyle: TextStyles.font16WhiteMedium,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
