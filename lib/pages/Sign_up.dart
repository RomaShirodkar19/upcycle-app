
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:mpl_lab/pages/Home_sceen.dart';


// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _signUp() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       try {
//         UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );

//         if (userCredential.user != null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Account created successfully!'),
//               backgroundColor: Color(0xFF6B4226),
//             ),
//           );

//           // Navigate to HomeScreen after successful signup
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => HomeScreen()),
//           );
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Sign Up Failed: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EED7),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6B4226)),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const Text(
//                     'Create Account',
//                     style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF6B4226)),
//                   ),
//                   const SizedBox(height: 8),
//                   Text('Sign up to get started!', style: TextStyle(fontSize: 16, color: Colors.grey[600])),

//                   const SizedBox(height: 30),

//                   // Full Name Field
//                   TextFormField(
//                     controller: nameController,
//                     decoration: _inputDecoration('Full Name', 'Enter your full name', Icons.person_outline),
//                     validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
//                   ),

//                   const SizedBox(height: 16),

//                   // Email Field
//                   TextFormField(
//                     controller: emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: _inputDecoration('Email', 'Enter your email address', Icons.email_outlined),
//                     validator: (value) {
//                       if (value!.isEmpty) return 'Please enter your email';
//                       if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),

//                   const SizedBox(height: 16),

//                   // Password Field
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: !_isPasswordVisible,
//                     decoration: _passwordInputDecoration('Password', 'Create a password', _isPasswordVisible, () {
//                       setState(() {
//                         _isPasswordVisible = !_isPasswordVisible;
//                       });
//                     }),
//                     validator: (value) {
//                       if (value!.isEmpty) return 'Please create a password';
//                       if (value.length < 6) return 'Password must be at least 6 characters';
//                       return null;
//                     },
//                   ),

//                   const SizedBox(height: 16),

//                   // Confirm Password Field
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: !_isConfirmPasswordVisible,
//                     decoration: _passwordInputDecoration('Confirm Password', 'Confirm your password', _isConfirmPasswordVisible, () {
//                       setState(() {
//                         _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
//                       });
//                     }),
//                     validator: (value) {
//                       if (value!.isEmpty) return 'Please confirm your password';
//                       if (value != passwordController.text) return 'Passwords do not match';
//                       return null;
//                     },
//                   ),

//                   const SizedBox(height: 24),

//                   // Terms and conditions checkbox
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: true, 
//                         onChanged: (value) {},
//                         activeColor: const Color(0xFF6B4226),
//                       ),
//                       Expanded(
//                         child: Text(
//                           'I agree to the Terms and Conditions and Privacy Policy',
//                           style: TextStyle(color: Colors.grey[600], fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 24),

//                   // Sign Up Button
//                   ElevatedButton(
//                     onPressed: _signUp,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF6B4226),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: const Text(
//                       'Create Account',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),

//                   const SizedBox(height: 24),

//                   // Login Link
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('Already have an account?', style: TextStyle(color: Colors.grey[600])),
//                       TextButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text('Log In', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6B4226))),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   InputDecoration _inputDecoration(String label, String hint, IconData icon) {
//     return InputDecoration(
//       labelText: label,
//       hintText: hint,
//       prefixIcon: Icon(icon, color: Color(0xFF6B4226)),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: const EdgeInsets.symmetric(vertical: 16),
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//     );
//   }

//   InputDecoration _passwordInputDecoration(String label, String hint, bool isVisible, VoidCallback toggleVisibility) {
//     return InputDecoration(
//       labelText: label,
//       hintText: hint,
//       prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF6B4226)),
//       suffixIcon: IconButton(
//         icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility, color: Color(0xFF6B4226)),
//         onPressed: toggleVisibility,
//       ),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: const EdgeInsets.symmetric(vertical: 16),
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//     );
//   }
// }


///////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mpl_lab/pages/Home_sceen.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;
//   String _selectedRole = "User"; // Default role

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> _signUp() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       try {
//         UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );

//         if (userCredential.user != null) {
//           // Store user details in Firestore
//           await _firestore.collection('users').doc(userCredential.user!.uid).set({
//             'uid': userCredential.user!.uid,  // Auto-generated UID
//             'name': nameController.text.trim(),
//             'email': emailController.text.trim(),
//             'role': _selectedRole,
//             'address': addressController.text.trim(),
//             'phone': phoneController.text.trim(),
//           });

//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Account created successfully!'),
//               backgroundColor: Color(0xFF6B4226),
//             ),
//           );

//           // Navigate to HomeScreen
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => HomeScreen()),
//           );
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Sign Up Failed: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EED7),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6B4226)),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const Text(
//                     'Create Account',
//                     style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF6B4226)),
//                   ),
//                   const SizedBox(height: 8),
//                   Text('Sign up to get started!', style: TextStyle(fontSize: 16, color: Colors.grey[600])),

//                   const SizedBox(height: 30),

//                   // Full Name Field
//                   TextFormField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: 'Full Name'),
//                     validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
//                   ),

//                   const SizedBox(height: 16),

//                   // Email Field
//                   TextFormField(
//                     controller: emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: const InputDecoration(labelText: 'Email'),
//                     validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
//                   ),

//                   const SizedBox(height: 16),

//                   // Address Field
//                   TextFormField(
//                     controller: addressController,
//                     decoration: const InputDecoration(labelText: 'Address'),
//                     validator: (value) => value!.isEmpty ? 'Please enter your address' : null,
//                   ),

//                   const SizedBox(height: 16),

//                   // Phone Field
//                   TextFormField(
//                     controller: phoneController,
//                     keyboardType: TextInputType.phone,
//                     decoration: const InputDecoration(labelText: 'Phone Number'),
//                     validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
//                   ),

//                   const SizedBox(height: 16),

//                   // Password Field
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: !_isPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       suffixIcon: IconButton(
//                         icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (value) => (value!.length < 6) ? 'Password must be at least 6 characters' : null,
//                   ),

//                   const SizedBox(height: 16),

//                   // Confirm Password Field
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: !_isConfirmPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: 'Confirm Password',
//                       suffixIcon: IconButton(
//                         icon: Icon(_isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility),
//                         onPressed: () {
//                           setState(() {
//                             _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (value) => (value != passwordController.text) ? 'Passwords do not match' : null,
//                   ),

//                   const SizedBox(height: 16),

//                   // Role Selection
//                   DropdownButtonFormField<String>(
//                     value: _selectedRole,
//                     items: ['User', 'Thrift Store Owner']
//                         .map((role) => DropdownMenuItem(value: role, child: Text(role)))
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedRole = value!;
//                       });
//                     },
//                     decoration: const InputDecoration(labelText: 'Sign up as'),
//                   ),

//                   const SizedBox(height: 24),

//                   // Sign Up Button
//                   ElevatedButton(
//                     onPressed: _signUp,
//                     child: const Text('Create Account'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

///////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mpl_lab/pages/Home_sceen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _selectedRole = "User"; // Default role

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          // Store user details in Firestore
          await _firestore.collection('users').doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,  // Auto-generated UID
            'name': nameController.text.trim(),
            'email': emailController.text.trim(),
            'role': _selectedRole,
            'address': addressController.text.trim(),
            'phone': phoneController.text.trim(),
            'hasStore': false, // Automatically set hasStore to false for all new users
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: Color(0xFF6B4226),
            ),
          );

          // Navigate to HomeScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign Up Failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EED7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF6B4226)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF6B4226)),
                  ),
                  const SizedBox(height: 8),
                  Text('Sign up to get started!', style: TextStyle(fontSize: 16, color: Colors.grey[600])),

                  const SizedBox(height: 30),

                  // Full Name Field
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                  ),

                  const SizedBox(height: 16),

                  // Email Field
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
                  ),

                  const SizedBox(height: 16),

                  // Address Field
                  TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(labelText: 'Address'),
                    validator: (value) => value!.isEmpty ? 'Please enter your address' : null,
                  ),

                  const SizedBox(height: 16),

                  // Phone Field
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
                  ),

                  const SizedBox(height: 16),

                  // Password Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) => (value!.length < 6) ? 'Password must be at least 6 characters' : null,
                  ),

                  const SizedBox(height: 16),

                  // Confirm Password Field
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(_isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) => (value != passwordController.text) ? 'Passwords do not match' : null,
                  ),

                  const SizedBox(height: 16),

                  // Role Selection
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    items: ['User', 'Thrift Store Owner']
                        .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value!;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Sign up as'),
                  ),

                  const SizedBox(height: 24),

                  // Sign Up Button
                  ElevatedButton(
                    onPressed: _signUp,
                    child: const Text('Create Account'),
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