// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_courses/core/utils/validators.dart';
import 'package:online_courses/models/user_model.dart';
import 'package:online_courses/routes/app_routes.dart';
import 'package:online_courses/views/widgets/common/custom_button.dart';
import 'package:online_courses/views/widgets/common/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conPasswordController = TextEditingController();
  UserRole? _selectedRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _conPasswordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Vreate Account",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Start your learning journey",
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "Full Name",
                          prefixIxon: Icons.person_outline,
                          controller: _fullNameController,
                          validate: FormValidators.validateFullName,
                        ),
                        const SizedBox(height: 20),

                        CustomTextField(
                          label: "Email",
                          prefixIxon: Icons.email_outlined,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validate: FormValidators.validateEmail,
                        ),
                        const SizedBox(height: 20),

                        CustomTextField(
                          label: "Password",
                          prefixIxon: Icons.lock_outline,
                          controller: _passwordController,
                          validate: FormValidators.validatePassword,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),

                        CustomTextField(
                          label: "Confirm Password",
                          prefixIxon: Icons.lock_outline,
                          controller: _conPasswordController,
                          obscureText: true,
                          validate:
                              (value) => FormValidators.validateConfirmPassword(
                                value,
                                _passwordController.text,
                              ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<UserRole>(
                    value: _selectedRole,
                    decoration: InputDecoration(
                      labelText: "Role",
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    items:
                        UserRole.values.map((role) {
                          return DropdownMenuItem(
                            value: role,
                            child: Text(
                              role.toString().split('.').last.capitalize!,
                            ),
                          );
                        }).toList(),
                    onChanged: (UserRole? value) {
                      setState(() {
                        _selectedRole = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(text: "Register", onPressed: _handleRegister),
                  const SizedBox(height: 26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () =>Get.back(),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate() && _selectedRole != null) {
      if (_selectedRole == UserRole.teacher) {
        Get.offAllNamed(AppRoutes.teacherHome);
      } else {
        Get.offAllNamed(AppRoutes.main);
      }
    } else if (_selectedRole != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a role"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
