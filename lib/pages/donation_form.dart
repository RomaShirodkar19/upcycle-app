// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mpl_lab/pages/Home_sceen.dart';


// class DonationFormPage extends StatefulWidget {
//   final String thriftStoreId;
  
//   const DonationFormPage({Key? key, required this.thriftStoreId}) : super(key: key);

//   @override
//   _DonationFormPageState createState() => _DonationFormPageState();
// }

// class _DonationFormPageState extends State<DonationFormPage> {
//    final _formKey = GlobalKey<FormState>();
//   String _name = '', _email = '', _address = '', _imageUrl = '', _condition = 'Good', _age = '';
//   final List<String> _conditions = ['Like New', 'Good', 'Fair', 'Poor'];

//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       await FirebaseFirestore.instance.collection('donation_requests').add({
//         'name': _name,
//         'email': _email,
//         'address': _address,
//         'imageUrl': _imageUrl,
//         'condition': _condition,
//         'age': _age,
//         'timestamp': FieldValue.serverTimestamp(),
//         'thriftStoreId': widget.thriftStoreId,
//         'status': 'Pending', // Initial status
//         'statusUpdatedAt': FieldValue.serverTimestamp(), // Track when status was last changed
//       });
      
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Donation request submitted! We will contact you soon.')),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFEAE2C7),
//       appBar: AppBar(
//         title: Text('Donation Request', style: TextStyle(color: Colors.white)),
//         backgroundColor: Color(0xFF183E19),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildTextField('Full Name', (value) => _name = value, Icons.person),
//               SizedBox(height: 15),
//               _buildTextField('Email', (value) => _email = value, Icons.email),
//               SizedBox(height: 15),
//               _buildTextField('Address', (value) => _address = value, Icons.home),
//               SizedBox(height: 15),
//               _buildTextField('Item Image URL', (value) => _imageUrl = value, Icons.image),
//               SizedBox(height: 15),
              
//               DropdownButtonFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Item Condition',
//                   prefixIcon: Icon(Icons.assessment, color: Color(0xFF183E19)),
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xFF183E19)),
//                   ),
//                 ),
//                 value: _condition,
//                 items: _conditions.map((condition) {
//                   return DropdownMenuItem(
//                     value: condition,
//                     child: Text(condition),
//                   );
//                 }).toList(),
//                 onChanged: (value) => setState(() => _condition = value.toString()),
//               ),
//               SizedBox(height: 15),
              
//               _buildTextField('How old is the item? (e.g., "2 years")', 
//                   (value) => _age = value, Icons.calendar_today),
//               SizedBox(height: 30),
              
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF183E19),
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   ),
//                   onPressed: _submitForm,
//                   child: Text('SUBMIT', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, Function(String) onSaved, IconData icon) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Color(0xFF183E19)),
//         prefixIcon: Icon(icon, color: Color(0xFF183E19)),
//         border: OutlineInputBorder(),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Color(0xFF183E19)),
//         ),
//       ),
//       validator: (value) => value!.isEmpty ? 'This field is required' : null,
//       onSaved: (value) => onSaved(value!),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mpl_lab/pages/Home_sceen.dart';

// class DonationFormPage extends StatefulWidget {
//   final String thriftStoreId;
  
//   const DonationFormPage({Key? key, required this.thriftStoreId}) : super(key: key);

//   @override
//   _DonationFormPageState createState() => _DonationFormPageState();
// }

// class _DonationFormPageState extends State<DonationFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '', _email = '', _address = '', _imageUrl = '', _condition = 'Good', _age = '';
//   final List<String> _conditions = ['Like New', 'Good', 'Fair', 'Poor'];
//   bool _isSubmitting = false;

//   Future<void> _submitForm() async {
//     if (!_formKey.currentState!.validate()) return;
//     if (widget.thriftStoreId.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: No thrift store specified')),
//       );
//       return;
//     }

//     setState(() => _isSubmitting = true);
    
//     try {
//       await FirebaseFirestore.instance.collection('donation_requests').add({
//         'name': _name,
//         'email': _email,
//         'address': _address,
//         'imageUrl': _imageUrl,
//         'condition': _condition,
//         'age': _age,
//         'timestamp': FieldValue.serverTimestamp(),
//         'thriftStoreId': widget.thriftStoreId,
//         'status': 'Pending',
//         'statusUpdatedAt': FieldValue.serverTimestamp(),
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Donation request submitted successfully!')),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error submitting form: ${e.toString()}')),
//       );
//     } finally {
//       if (mounted) setState(() => _isSubmitting = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFEAE2C7),
//       appBar: AppBar(
//         title: Text('Donation Request', style: TextStyle(color: Colors.white)),
//         backgroundColor: Color(0xFF183E19),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (widget.thriftStoreId.isEmpty)
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 15),
//                   child: Text(
//                     'Warning: No thrift store specified',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),

//               _buildTextField('Full Name', (value) => _name = value, Icons.person),
//               SizedBox(height: 15),
//               _buildTextField('Email', (value) => _email = value, Icons.email, isEmail: true),
//               SizedBox(height: 15),
//               _buildTextField('Address', (value) => _address = value, Icons.home),
//               SizedBox(height: 15),
//               _buildTextField('Item Image URL', (value) => _imageUrl = value, Icons.image, isUrl: true),
//               SizedBox(height: 15),
              
//               DropdownButtonFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Item Condition',
//                   prefixIcon: Icon(Icons.assessment, color: Color(0xFF183E19)),
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xFF183E19)),
//                   ),
//                 ),
//                 value: _condition,
//                 items: _conditions.map((condition) {
//                   return DropdownMenuItem(
//                     value: condition,
//                     child: Text(condition),
//                   );
//                 }).toList(),
//                 onChanged: (value) => setState(() => _condition = value.toString()),
//               ),
//               SizedBox(height: 15),
              
//               _buildTextField('How old is the item? (e.g., "2 years")', 
//                   (value) => _age = value, Icons.calendar_today),
//               SizedBox(height: 30),
              
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF183E19),
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                     disabledBackgroundColor: Colors.grey,
//                   ),
//                   onPressed: _isSubmitting ? null : _submitForm,
//                   child: _isSubmitting
//                       ? CircularProgressIndicator(color: Colors.white)
//                       : Text('SUBMIT', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, Function(String) onSaved, IconData icon, 
//       {bool isEmail = false, bool isUrl = false}) {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Color(0xFF183E19)),
//         prefixIcon: Icon(icon, color: Color(0xFF183E19)),
//         border: OutlineInputBorder(),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Color(0xFF183E19)),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) return 'This field is required';
//         if (isEmail && !value.contains('@')) return 'Enter a valid email';
//         if (isUrl && !value.startsWith('http')) return 'Enter a valid URL';
//         return null;
//       },
//       onSaved: (value) => onSaved(value!),
//     );
//   }
// }

///////////////////////////////////////////////////////////////////
///


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mpl_lab/pages/Home_sceen.dart';

// class DonationFormPage extends StatefulWidget {
//   final String thriftStoreId;
  
//   const DonationFormPage({Key? key, required this.thriftStoreId}) : super(key: key);

//   @override
//   _DonationFormPageState createState() => _DonationFormPageState();
// }

// class _DonationFormPageState extends State<DonationFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _imageUrlController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   String _condition = 'Good';
//   final List<String> _conditions = ['Like New', 'Good', 'Fair', 'Poor'];
//   bool _isSubmitting = false;

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _addressController.dispose();
//     _imageUrlController.dispose();
//     _ageController.dispose();
//     super.dispose();
//   }

//   Future<void> _submitForm() async {
//     if (!_formKey.currentState!.validate()) return;
    
//     setState(() => _isSubmitting = true);
    
//     try {
//       // Create a complete data map
//       final donationData = {
//         'name': _nameController.text.trim(),
//         'email': _emailController.text.trim(),
//         'address': _addressController.text.trim(),
//         'imageUrl': _imageUrlController.text.trim(),
//         'condition': _condition,
//         'age': _ageController.text.trim(),
//         'thriftStoreId': widget.thriftStoreId,
//         'status': 'Pending',
//         'statusUpdatedAt': FieldValue.serverTimestamp(),
//         'timestamp': FieldValue.serverTimestamp(),
//       };

//       // Debug print to verify all data
//       debugPrint('Submitting donation data: $donationData');

//       await FirebaseFirestore.instance.collection('donation_requests').add(donationData);

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Donation submitted successfully!')),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Submission failed: ${e.toString()}')),
//       );
//     } finally {
//       if (mounted) setState(() => _isSubmitting = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFEAE2C7),
//       appBar: AppBar(
//         title: const Text('Donation Request', style: TextStyle(color: Colors.white)),
//         backgroundColor: const Color(0xFF183E19),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Donating to store ID: ${widget.thriftStoreId}',
//                 style: TextStyle(color: Colors.grey[600], fontSize: 12),
//               ),
//               const SizedBox(height: 10),
              
//               _buildTextField('Full Name', _nameController, Icons.person),
//               const SizedBox(height: 15),
//               _buildTextField('Email', _emailController, Icons.email, isEmail: true),
//               const SizedBox(height: 15),
//               _buildTextField('Address', _addressController, Icons.home),
//               const SizedBox(height: 15),
//               _buildTextField('Item Image URL', _imageUrlController, Icons.image, isUrl: true),
//               const SizedBox(height: 15),
              
//               DropdownButtonFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Item Condition',
//                   prefixIcon: const Icon(Icons.assessment, color: Color(0xFF183E19)),
//                   border: OutlineInputBorder(),
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xFF183E19)),
//                   ),
//                 ),
//                 value: _condition,
//                 items: _conditions.map((condition) {
//                   return DropdownMenuItem(
//                     value: condition,
//                     child: Text(condition),
//                   );
//                 }).toList(),
//                 onChanged: (value) => setState(() => _condition = value.toString()),
//               ),
//               const SizedBox(height: 15),
              
//               _buildTextField('How old is the item? (e.g., "2 years")', 
//                   _ageController, Icons.calendar_today),
//               const SizedBox(height: 30),
              
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF183E19),
//                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                     disabledBackgroundColor: Colors.grey,
//                   ),
//                   onPressed: _isSubmitting ? null : _submitForm,
//                   child: _isSubmitting
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text('SUBMIT', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     String label, 
//     TextEditingController controller, 
//     IconData icon, {
//     bool isEmail = false, 
//     bool isUrl = false,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Color(0xFF183E19)),
//         prefixIcon: Icon(icon, color: const Color(0xFF183E19)),
//         border: OutlineInputBorder(),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: Color(0xFF183E19)),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) return 'This field is required';
//         if (isEmail && !value.contains('@')) return 'Enter a valid email';
//         if (isUrl && !value.startsWith('http')) return 'Enter a valid URL';
//         return null;
//       },
//     );
//   }
// }

/////////////////////////////////////////////////
///
///


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mpl_lab/pages/Home_sceen.dart';

class DonationFormPage extends StatefulWidget {
  final String thriftStoreId;
  
  const DonationFormPage({Key? key, required this.thriftStoreId}) : super(key: key);

  @override
  _DonationFormPageState createState() => _DonationFormPageState();
}

class _DonationFormPageState extends State<DonationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _condition = 'Good';
  final List<String> _conditions = ['Like New', 'Good', 'Fair', 'Poor'];
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _imageUrlController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isSubmitting = true);
    
    try {
      // Validate thriftStoreId before submission
      if (widget.thriftStoreId.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: Thrift Store ID is missing!')),
        );
        setState(() => _isSubmitting = false);
        return;
      }

      // Create a complete data map
      final donationData = {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'address': _addressController.text.trim(),
        'imageUrl': _imageUrlController.text.trim(),
        'condition': _condition,
        'age': _ageController.text.trim(),
        'thriftStoreId': widget.thriftStoreId,
        'status': 'Pending',
        'statusUpdatedAt': FieldValue.serverTimestamp(),
        'timestamp': FieldValue.serverTimestamp(),
      };

      // Extensive logging
      debugPrint('Thrift Store ID: ${widget.thriftStoreId}');
      debugPrint('Donation Data: $donationData');
      debugPrint('All Fields Filled: ${donationData.values.every((element) => element != null && element != '')}');

      // Add validation to ensure no null or empty values
      final validatedData = donationData.map((key, value) {
        return MapEntry(key, value ?? '');
      });

      await FirebaseFirestore.instance.collection('donation_requests').add(validatedData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Donation submitted successfully!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      debugPrint('Submission Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Submission failed: ${e.toString()}')),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE2C7),
      appBar: AppBar(
        title: const Text('Donation Request', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF183E19),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Donating to store ID: ${widget.thriftStoreId}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              const SizedBox(height: 10),
              
              _buildTextField('Full Name', _nameController, Icons.person),
              const SizedBox(height: 15),
              _buildTextField('Email', _emailController, Icons.email, isEmail: true),
              const SizedBox(height: 15),
              _buildTextField('Address', _addressController, Icons.home),
              const SizedBox(height: 15),
              _buildTextField('Item Image URL', _imageUrlController, Icons.image, isUrl: true),
              const SizedBox(height: 15),
              
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Item Condition',
                  prefixIcon: const Icon(Icons.assessment, color: Color(0xFF183E19)),
                  border: OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF183E19)),
                  ),
                ),
                value: _condition,
                items: _conditions.map((condition) {
                  return DropdownMenuItem(
                    value: condition,
                    child: Text(condition),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _condition = value.toString()),
              ),
              const SizedBox(height: 15),
              
              _buildTextField('How old is the item? (e.g., "2 years")', 
                  _ageController, Icons.calendar_today),
              const SizedBox(height: 30),
              
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF183E19),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    disabledBackgroundColor: Colors.grey,
                  ),
                  onPressed: _isSubmitting ? null : _submitForm,
                  child: _isSubmitting
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('SUBMIT', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label, 
    TextEditingController controller, 
    IconData icon, {
    bool isEmail = false, 
    bool isUrl = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF183E19)),
        prefixIcon: Icon(icon, color: const Color(0xFF183E19)),
        border: OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF183E19)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'This field is required';
        if (isEmail && !value.contains('@')) return 'Enter a valid email';
        if (isUrl && !value.startsWith('http')) return 'Enter a valid URL';
        return null;
      },
    );
  }
}