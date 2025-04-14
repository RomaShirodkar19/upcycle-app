// import 'package:flutter/material.dart';

// class BookDonationFormPage extends StatefulWidget {
//   @override
//   _BookDonationFormPageState createState() => _BookDonationFormPageState();
// }

// class _BookDonationFormPageState extends State<BookDonationFormPage> {
//   final _formKey = GlobalKey<FormState>();

//   // Form controllers
//   final _titleController = TextEditingController();
//   final _authorController = TextEditingController();
//   final _donorNameController = TextEditingController();

//   // Dropdown values
//   String _selectedCondition = 'Good';
//   String _selectedGenre = 'Fiction';

//   // Condition and genre options
//   final List<String> _conditionOptions = [
//     'Like New', 'Good', 'Acceptable', 'Poor'
//   ];

//   final List<String> _genreOptions = [
//     'Fiction', 'Non-Fiction', 'Science', 
//     'Technology', 'Self-Help', 'Children', 
//     'History', 'Biography', 'Art', 
//     'Programming', 'Classic', 'Other'
//   ];

//   // Custom date formatting method (similar to your existing method)
//   String _formatDate(DateTime date) {
//     final months = [
//       'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
//       'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
//     ];
//     return '${months[date.month - 1]} ${date.day}, ${date.year}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Donate a Book'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               // Book Title Input
//               TextFormField(
//                 controller: _titleController,
//                 decoration: InputDecoration(
//                   labelText: 'Book Title',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the book title';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),

//               // Author Input
//               TextFormField(
//                 controller: _authorController,
//                 decoration: InputDecoration(
//                   labelText: 'Author',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the author name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),

//               // Donor Name Input
//               TextFormField(
//                 controller: _donorNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Your Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),

//               // Condition Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'Book Condition',
//                   border: OutlineInputBorder(),
//                 ),
//                 value: _selectedCondition,
//                 items: _conditionOptions
//                     .map((condition) => DropdownMenuItem(
//                           value: condition,
//                           child: Text(condition),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedCondition = value!;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),

//               // Genre Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   labelText: 'Book Genre',
//                   border: OutlineInputBorder(),
//                 ),
//                 value: _selectedGenre,
//                 items: _genreOptions
//                     .map((genre) => DropdownMenuItem(
//                           value: genre,
//                           child: Text(genre),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedGenre = value!;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),

//               // Donation Submit Button
//               ElevatedButton(
//                 onPressed: _submitDonation,
//                 child: Text('Donate Book'),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _submitDonation() {
//     if (_formKey.currentState!.validate()) {
//       // Create a new book donation entry
//       final newBook = {
//         'title': _titleController.text,
//         'author': _authorController.text,
//         'condition': _selectedCondition,
//         'genre': _selectedGenre,
//         'donorName': _donorNameController.text,
//         'donationDate': DateTime.now(),
//         'coverImage': 'https://example.com/placeholder.jpg', // Placeholder image
//       };

//       // In a real app, you would:
//       // 1. Add the book to your database or backend
//       // 2. Possibly upload a cover image
//       // 3. Handle state management (e.g., Provider, Riverpod)

//       // For now, we'll show a success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Book Donation Submitted Successfully!'),
//           backgroundColor: Colors.green,
//         ),
//       );

//       // Clear the form
//       _titleController.clear();
//       _authorController.clear();
//       _donorNameController.clear();
//       setState(() {
//         _selectedCondition = 'Good';
//         _selectedGenre = 'Fiction';
//       });
//     }
//   }

//   @override
//   void dispose() {
//     // Clean up controllers
//     _titleController.dispose();
//     _authorController.dispose();
//     _donorNameController.dispose();
//     super.dispose();
//   }
// }

/////////////////////////////////////////////////////

// import 'package:flutter/material.dart';

// class BookDonationFormPage extends StatefulWidget {
//   @override
//   _BookDonationFormPageState createState() => _BookDonationFormPageState();
// }

// class _BookDonationFormPageState extends State<BookDonationFormPage> {
//   final _formKey = GlobalKey<FormState>();

//   // Color palette
//   final Color backgroundColor = Color.fromARGB(255, 234, 226, 199);
//   final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
//   final Color accentColor = Color.fromARGB(255, 76, 175, 80);

//   // Form controllers
//   final _titleController = TextEditingController();
//   final _authorController = TextEditingController();
//   final _donorNameController = TextEditingController();

//   // Dropdown values
//   String _selectedCondition = 'Good';
//   String _selectedGenre = 'Fiction';

//   // Condition and genre options
//   final List<String> _conditionOptions = [
//     'Like New', 'Good', 'Acceptable', 'Poor'
//   ];

//   final List<String> _genreOptions = [
//     'Fiction', 'Non-Fiction', 'Science', 
//     'Technology', 'Self-Help', 'Children', 
//     'History', 'Biography', 'Art', 
//     'Programming', 'Classic', 'Other'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         title: Text(
//           'Donate a Book', 
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Card(
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           color: Colors.white,
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: ListView(
//                 children: [
//                   // Book Title Input
//                   _buildTextFormField(
//                     controller: _titleController,
//                     labelText: 'Book Title',
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the book title';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 16),

//                   // Author Input
//                   _buildTextFormField(
//                     controller: _authorController,
//                     labelText: 'Author',
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the author name';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 16),

//                   // Donor Name Input
//                   _buildTextFormField(
//                     controller: _donorNameController,
//                     labelText: 'Your Name',
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 16),

//                   // Condition Dropdown
//                   _buildDropdownField(
//                     value: _selectedCondition,
//                     items: _conditionOptions,
//                     labelText: 'Book Condition',
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedCondition = value!;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),

//                   // Genre Dropdown
//                   _buildDropdownField(
//                     value: _selectedGenre,
//                     items: _genreOptions,
//                     labelText: 'Book Genre',
//                     onChanged: (value) {
//                       setState(() {
//                         _selectedGenre = value!;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 24),

//                   // Donation Submit Button
//                   ElevatedButton(
//                     onPressed: _submitDonation,
//                     child: Text(
//                       'Donate Book',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: primaryColor,
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper method to create consistent text form fields
//   Widget _buildTextFormField({
//     required TextEditingController controller,
//     required String labelText,
//     required String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(color: primaryColor),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: primaryColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: accentColor, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.red, width: 2),
//         ),
//       ),
//       validator: validator,
//     );
//   }

//   // Helper method to create consistent dropdown fields
//   Widget _buildDropdownField({
//     required String value,
//     required List<String> items,
//     required String labelText,
//     required void Function(String?)? onChanged,
//   }) {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(color: primaryColor),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: primaryColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: accentColor, width: 2),
//         ),
//       ),
//       value: value,
//       items: items
//           .map((item) => DropdownMenuItem(
//                 value: item,
//                 child: Text(item),
//               ))
//           .toList(),
//       onChanged: onChanged,
//     );
//   }

//   void _submitDonation() {
//     if (_formKey.currentState!.validate()) {
//       // Create a new book donation entry
//       final newBook = {
//         'title': _titleController.text,
//         'author': _authorController.text,
//         'condition': _selectedCondition,
//         'genre': _selectedGenre,
//         'donorName': _donorNameController.text,
//         'donationDate': DateTime.now(),
//         'coverImage': 'https://example.com/placeholder.jpg', // Placeholder image
//       };

//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Book Donation Submitted Successfully!'),
//           backgroundColor: accentColor,
//         ),
//       );

//       // Clear the form
//       _titleController.clear();
//       _authorController.clear();
//       _donorNameController.clear();
//       setState(() {
//         _selectedCondition = 'Good';
//         _selectedGenre = 'Fiction';
//       });
//     }
//   }

//   @override
//   void dispose() {
//     // Clean up controllers
//     _titleController.dispose();
//     _authorController.dispose();
//     _donorNameController.dispose();
//     super.dispose();
//   }
// }

////////////////////////////////////////////

// import 'package:flutter/material.dart';

// class BookDonationFormPage extends StatefulWidget {
//   @override
//   _BookDonationFormPageState createState() => _BookDonationFormPageState();
// }

// class _BookDonationFormPageState extends State<BookDonationFormPage> {
//   final _formKey = GlobalKey<FormState>();

//   // Color palette
//   final Color backgroundColor = Color.fromARGB(255, 234, 226, 199);
//   final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
//   final Color accentColor = Color.fromARGB(255, 76, 175, 80);

//   // Form controllers
//   final _titleController = TextEditingController();
//   final _authorController = TextEditingController();
//   final _isbnController = TextEditingController();
//   final _donorNameController = TextEditingController();
//   final _locationController = TextEditingController();
//   final _descriptionController = TextEditingController();

//   // Dropdown values
//   String _selectedCondition = 'Good';
//   String _selectedGenre = 'Fiction';
//   String _selectedGradeLevel = 'High School';
//   String _selectedContactMethod = 'In-app message';

//   // Options
//   final List<String> _conditionOptions = [
//     'New', 'Like New', 'Good', 'Fair', 'Poor'
//   ];

//   final List<String> _genreOptions = [
//     'Fiction', 'Non-Fiction', 'Textbook', 
//     'Science', 'History', 'Biography',
//     'Children', 'Art', 'Other'
//   ];

//   final List<String> _gradeLevelOptions = [
//     'Elementary', 'Middle School', 'High School', 'College', 'Any'
//   ];

//   final List<String> _contactMethodOptions = [
//     'In-app message', 'Email', 'Phone'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         title: Text(
//           'Donate a Book', 
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Card(
//             elevation: 5,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             color: Colors.white,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     // Book Title
//                     _buildTextFormField(
//                       controller: _titleController,
//                       labelText: 'Book Title*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),

//                     // Author
//                     _buildTextFormField(
//                       controller: _authorController,
//                       labelText: 'Author*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),

//                     // ISBN (optional)
//                     _buildTextFormField(
//                       controller: _isbnController,
//                       labelText: 'ISBN (optional)',
//                       validator: null,
//                     ),
//                     SizedBox(height: 16),

//                     // Description
//                     _buildTextFormField(
//                       controller: _descriptionController,
//                       labelText: 'Description*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Please describe the book' : null,
//                       maxLines: 3,
//                     ),
//                     SizedBox(height: 16),

//                     // Condition
//                     _buildDropdownField(
//                       value: _selectedCondition,
//                       items: _conditionOptions,
//                       labelText: 'Condition*',
//                       onChanged: (value) => setState(() => _selectedCondition = value!),
//                     ),
//                     SizedBox(height: 16),

//                     // Genre
//                     _buildDropdownField(
//                       value: _selectedGenre,
//                       items: _genreOptions,
//                       labelText: 'Genre*',
//                       onChanged: (value) => setState(() => _selectedGenre = value!),
//                     ),
//                     SizedBox(height: 16),

//                     // Grade Level
//                     _buildDropdownField(
//                       value: _selectedGradeLevel,
//                       items: _gradeLevelOptions,
//                       labelText: 'Suitable For*',
//                       onChanged: (value) => setState(() => _selectedGradeLevel = value!),
//                     ),
//                     SizedBox(height: 16),

//                     // Location
//                     _buildTextFormField(
//                       controller: _locationController,
//                       labelText: 'Your Location*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),

//                     // Contact Method
//                     _buildDropdownField(
//                       value: _selectedContactMethod,
//                       items: _contactMethodOptions,
//                       labelText: 'Contact Method*',
//                       onChanged: (value) => setState(() => _selectedContactMethod = value!),
//                     ),
//                     SizedBox(height: 24),

//                     // Donor Name
//                     _buildTextFormField(
//                       controller: _donorNameController,
//                       labelText: 'Your Name*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 24),

//                     // Submit Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: _submitDonation,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: primaryColor,
//                           foregroundColor: Colors.white,
//                           padding: EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Text(
//                           'Donate Book',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextFormField({
//     required TextEditingController controller,
//     required String labelText,
//     required String? Function(String?)? validator,
//     int maxLines = 1,
//   }) {
//     return TextFormField(
//       controller: controller,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(color: primaryColor),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: primaryColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: accentColor, width: 2),
//         ),
//       ),
//       validator: validator,
//     );
//   }

//   Widget _buildDropdownField({
//     required String value,
//     required List<String> items,
//     required String labelText,
//     required void Function(String?)? onChanged,
//   }) {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(color: primaryColor),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: primaryColor),
//         ),
//       ),
//       value: value,
//       items: items.map((item) => DropdownMenuItem(
//         value: item,
//         child: Text(item),
//       )).toList(),
//       onChanged: onChanged,
//     );
//   }

//   void _submitDonation() {
//     if (_formKey.currentState!.validate()) {
//       // Prepare book donation data
//       final bookDonation = {
//         'title': _titleController.text,
//         'author': _authorController.text,
//         'isbn': _isbnController.text.isEmpty ? null : _isbnController.text,
//         'description': _descriptionController.text,
//         'condition': _selectedCondition,
//         'genre': _selectedGenre,
//         'gradeLevel': _selectedGradeLevel,
//         'location': _locationController.text,
//         'contactMethod': _selectedContactMethod,
//         'donorName': _donorNameController.text,
//         'postedDate': DateTime.now(),
//         'status': 'available',
//       };

//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Book donation submitted!'),
//           backgroundColor: accentColor,
//           duration: Duration(seconds: 2),
//         ),
//       );

//       // Clear form
//       _clearForm();
//     }
//   }

//   void _clearForm() {
//     _titleController.clear();
//     _authorController.clear();
//     _isbnController.clear();
//     _descriptionController.clear();
//     _locationController.clear();
//     _donorNameController.clear();
//     setState(() {
//       _selectedCondition = 'Good';
//       _selectedGenre = 'Fiction';
//       _selectedGradeLevel = 'High School';
//       _selectedContactMethod = 'In-app message';
//     });
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _authorController.dispose();
//     _isbnController.dispose();
//     _descriptionController.dispose();
//     _locationController.dispose();
//     _donorNameController.dispose();
//     super.dispose();
//   }
// }


/////////////////////////////////////////////////////
///

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// class BookDonationFormPage extends StatefulWidget {
//   @override
//   _BookDonationFormPageState createState() => _BookDonationFormPageState();
// }

// class _BookDonationFormPageState extends State<BookDonationFormPage> {
//   final _formKey = GlobalKey<FormState>();

//   // Color palette
//   final Color backgroundColor = Color.fromARGB(255, 234, 226, 199);
//   final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
//   final Color accentColor = Color.fromARGB(255, 76, 175, 80);

//   // Form controllers
//   final _titleController = TextEditingController();
//   final _authorController = TextEditingController();
//   final _isbnController = TextEditingController();
//   final _donorNameController = TextEditingController();
//   final _locationController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();

//   // Dropdown values
//   String _selectedCondition = 'Good';
//   String _selectedGenre = 'Fiction';
//   String _selectedGradeLevel = 'High School';

//   // Options
//   final List<String> _conditionOptions = [
//     'New', 'Like New', 'Good', 'Fair', 'Poor'
//   ];

//   final List<String> _genreOptions = [
//     'Fiction', 'Non-Fiction', 'Textbook', 
//     'Science', 'History', 'Biography',
//     'Children', 'Art', 'Other'
//   ];

//   final List<String> _gradeLevelOptions = [
//     'Elementary', 'Middle School', 'High School', 'College', 'Any'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         title: Text(
//           'Donate a Book', 
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Card(
//             elevation: 5,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             color: Colors.white,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     // Book Title
//                     _buildTextFormField(
//                       controller: _titleController,
//                       labelText: 'Book Title*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),

//                     // Author
//                     _buildTextFormField(
//                       controller: _authorController,
//                       labelText: 'Author*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),

//                     // ISBN (optional)
//                     _buildTextFormField(
//                       controller: _isbnController,
//                       labelText: 'ISBN (optional)',
//                       validator: null,
//                     ),
//                     SizedBox(height: 16),

//                     // Description
//                     _buildTextFormField(
//                       controller: _descriptionController,
//                       labelText: 'Description*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Please describe the book' : null,
//                       maxLines: 3,
//                     ),
//                     SizedBox(height: 16),

//                     // Condition
//                     _buildDropdownField(
//                       value: _selectedCondition,
//                       items: _conditionOptions,
//                       labelText: 'Condition*',
//                       onChanged: (value) => setState(() => _selectedCondition = value!),
//                     ),
//                     SizedBox(height: 16),

//                     // Genre
//                     _buildDropdownField(
//                       value: _selectedGenre,
//                       items: _genreOptions,
//                       labelText: 'Genre*',
//                       onChanged: (value) => setState(() => _selectedGenre = value!),
//                     ),
//                     SizedBox(height: 16),

//                     // Grade Level
//                     _buildDropdownField(
//                       value: _selectedGradeLevel,
//                       items: _gradeLevelOptions,
//                       labelText: 'Suitable For*',
//                       onChanged: (value) => setState(() => _selectedGradeLevel = value!),
//                     ),
//                     SizedBox(height: 16),

//                     // Location
//                     _buildTextFormField(
//                       controller: _locationController,
//                       labelText: 'Your Location*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),

//                     // Donor Name
//                     _buildTextFormField(
//                       controller: _donorNameController,
//                       labelText: 'Your Name*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),

//                     // Email
//                     _buildTextFormField(
//                       controller: _emailController,
//                       labelText: 'Email*',
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Required field';
//                         }
//                         if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                           return 'Enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),

//                     // Phone Number (now required)
//                     _buildTextFormField(
//                       controller: _phoneController,
//                       labelText: 'Phone Number*',
//                       keyboardType: TextInputType.phone,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Phone number is required';
//                         }
//                         if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
//                           return 'Enter a valid phone number (10-15 digits)';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 24),

//                     // Submit Button
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: _submitDonation,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: primaryColor,
//                           foregroundColor: Colors.white,
//                           padding: EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Text(
//                           'Donate Book',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextFormField({
//     required TextEditingController controller,
//     required String labelText,
//     required String? Function(String?)? validator,
//     TextInputType keyboardType = TextInputType.text,
//     int maxLines = 1,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(color: primaryColor),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: primaryColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: accentColor, width: 2),
//         ),
//       ),
//       validator: validator,
//     );
//   }

//   Widget _buildDropdownField({
//     required String value,
//     required List<String> items,
//     required String labelText,
//     required void Function(String?)? onChanged,
//   }) {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(color: primaryColor),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: primaryColor),
//         ),
//       ),
//       value: value,
//       items: items.map((item) => DropdownMenuItem(
//         value: item,
//         child: Text(item),
//       )).toList(),
//       onChanged: onChanged,
//     );
//   }

//   void _submitDonation() {
//     if (_formKey.currentState!.validate()) {
//       // Prepare book donation data
//       final bookDonation = {
//         'title': _titleController.text,
//         'author': _authorController.text,
//         'isbn': _isbnController.text.isEmpty ? null : _isbnController.text,
//         'description': _descriptionController.text,
//         'condition': _selectedCondition,
//         'genre': _selectedGenre,
//         'gradeLevel': _selectedGradeLevel,
//         'location': _locationController.text,
//         'donorName': _donorNameController.text,
//         'donorEmail': _emailController.text,
//         'donorPhone': _phoneController.text,
//         'postedDate': DateTime.now(),
//         'status': 'available',
//       };

//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Book donation submitted!'),
//           backgroundColor: accentColor,
//           duration: Duration(seconds: 2),
//         ),
//       );

//       // Clear form
//       _clearForm();
//     }
//   }

//   void _clearForm() {
//     _titleController.clear();
//     _authorController.clear();
//     _isbnController.clear();
//     _descriptionController.clear();
//     _locationController.clear();
//     _donorNameController.clear();
//     _emailController.clear();
//     _phoneController.clear();
//     setState(() {
//       _selectedCondition = 'Good';
//       _selectedGenre = 'Fiction';
//       _selectedGradeLevel = 'High School';
//     });
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _authorController.dispose();
//     _isbnController.dispose();
//     _descriptionController.dispose();
//     _locationController.dispose();
//     _donorNameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }
// }


///////////////////////////////////////////////////////


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MaterialApp(home: BookDonationFormPage()));
// }

// class BookDonationFormPage extends StatefulWidget {
//   @override
//   _BookDonationFormPageState createState() => _BookDonationFormPageState();
// }

// class _BookDonationFormPageState extends State<BookDonationFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Color palette
//   final Color backgroundColor = Color.fromARGB(255, 234, 226, 199);
//   final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
//   final Color accentColor = Color.fromARGB(255, 76, 175, 80);

//   // Form controllers
//   final _titleController = TextEditingController();
//   final _authorController = TextEditingController();
//   final _isbnController = TextEditingController();
//   final _donorNameController = TextEditingController();
//   final _locationController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();

//   // Dropdown values
//   String _selectedCondition = 'Good';
//   String _selectedGenre = 'Fiction';
//   String _selectedGradeLevel = 'High School';

//   // Options
//   final List<String> _conditionOptions = ['New', 'Like New', 'Good', 'Fair', 'Poor'];
//   final List<String> _genreOptions = [
//     'Fiction', 'Non-Fiction', 'Textbook', 
//     'Science', 'History', 'Biography',
//     'Children', 'Art', 'Other'
//   ];
//   final List<String> _gradeLevelOptions = [
//     'Elementary', 'Middle School', 'High School', 'College', 'Any'
//   ];

//   Future<void> _submitDonation() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _firestore.collection('donated_books').add({
//           'title': _titleController.text,
//           'author': _authorController.text,
//           'isbn': _isbnController.text.isEmpty ? "" : _isbnController.text,
//           'description': _descriptionController.text,
//           'condition': _selectedCondition,
//           'genre': _selectedGenre,
//           'gradeLevel': _selectedGradeLevel,
//           'location': _locationController.text,
//           'donorName': _donorNameController.text,
//           'donorEmail': _emailController.text,
//           'donorPhone': _phoneController.text,
//           'postedDate': FieldValue.serverTimestamp(),
//           'status': 'Available',
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Book donated successfully!'),
//             backgroundColor: Colors.green,
//           ),
//         );
        
//         _clearForm();
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error submitting: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         title: Text('Donate a Book', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Card(
//             elevation: 5,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             color: Colors.white,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     _buildTextFormField(
//                       controller: _titleController,
//                       labelText: 'Book Title*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextFormField(
//                       controller: _authorController,
//                       labelText: 'Author*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextFormField(
//                       controller: _isbnController,
//                       labelText: 'ISBN (optional)',
//                       validator: null,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextFormField(
//                       controller: _descriptionController,
//                       labelText: 'Description*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Please describe the book' : null,
//                       maxLines: 3,
//                     ),
//                     SizedBox(height: 16),
//                     _buildDropdownField(
//                       value: _selectedCondition,
//                       items: _conditionOptions,
//                       labelText: 'Condition*',
//                       onChanged: (value) => setState(() => _selectedCondition = value!),
//                     ),
//                     SizedBox(height: 16),
//                     _buildDropdownField(
//                       value: _selectedGenre,
//                       items: _genreOptions,
//                       labelText: 'Genre*',
//                       onChanged: (value) => setState(() => _selectedGenre = value!),
//                     ),
//                     SizedBox(height: 16),
//                     _buildDropdownField(
//                       value: _selectedGradeLevel,
//                       items: _gradeLevelOptions,
//                       labelText: 'Suitable For*',
//                       onChanged: (value) => setState(() => _selectedGradeLevel = value!),
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextFormField(
//                       controller: _locationController,
//                       labelText: 'Your Location*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextFormField(
//                       controller: _donorNameController,
//                       labelText: 'Your Name*',
//                       validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextFormField(
//                       controller: _emailController,
//                       labelText: 'Email*',
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) return 'Required field';
//                         if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                           return 'Enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     _buildTextFormField(
//                       controller: _phoneController,
//                       labelText: 'Phone Number*',
//                       keyboardType: TextInputType.phone,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) return 'Phone number is required';
//                         if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
//                           return 'Enter a valid phone number (10-15 digits)';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 24),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: _submitDonation,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: primaryColor,
//                           foregroundColor: Colors.white,
//                           padding: EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Text('Donate Book', style: TextStyle(fontSize: 18)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextFormField({
//     required TextEditingController controller,
//     required String labelText,
//     required String? Function(String?)? validator,
//     TextInputType keyboardType = TextInputType.text,
//     int maxLines = 1,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(color: primaryColor),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: primaryColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: accentColor, width: 2),
//         ),
//       ),
//       validator: validator,
//     );
//   }

//   Widget _buildDropdownField({
//     required String value,
//     required List<String> items,
//     required String labelText,
//     required void Function(String?)? onChanged,
//   }) {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(color: primaryColor),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: primaryColor),
//         ),
//       ),
//       value: value,
//       items: items.map((item) => DropdownMenuItem(
//         value: item,
//         child: Text(item),
//       )).toList(),
//       onChanged: onChanged,
//     );
//   }

//   void _clearForm() {
//     _titleController.clear();
//     _authorController.clear();
//     _isbnController.clear();
//     _descriptionController.clear();
//     _locationController.clear();
//     _donorNameController.clear();
//     _emailController.clear();
//     _phoneController.clear();
//     setState(() {
//       _selectedCondition = 'Good';
//       _selectedGenre = 'Fiction';
//       _selectedGradeLevel = 'High School';
//     });
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _authorController.dispose();
//     _isbnController.dispose();
//     _descriptionController.dispose();
//     _locationController.dispose();
//     _donorNameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: BookDonationFormPage()));
}

class BookDonationFormPage extends StatefulWidget {
  @override
  _BookDonationFormPageState createState() => _BookDonationFormPageState();
}

class _BookDonationFormPageState extends State<BookDonationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Color palette
  final Color backgroundColor = Color.fromARGB(255, 234, 226, 199);
  final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
  final Color accentColor = Color.fromARGB(255, 76, 175, 80);

  // Form controllers
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _isbnController = TextEditingController();
  final _donorNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _imageUrlController = TextEditingController();

  // Dropdown values
  String _selectedCondition = 'Good';
  String _selectedGenre = 'Fiction';
  String _selectedGradeLevel = 'High School';

  // Options
  final List<String> _conditionOptions = ['New', 'Like New', 'Good', 'Fair', 'Poor'];
  final List<String> _genreOptions = [
    'Fiction', 'Non-Fiction', 'Textbook', 
    'Science', 'History', 'Biography',
    'Children', 'Art', 'Other'
  ];
  final List<String> _gradeLevelOptions = [
    'Elementary', 'Middle School', 'High School', 'College', 'Any'
  ];

  Future<void> _submitDonation() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _firestore.collection('donated_books').add({
          'title': _titleController.text,
          'author': _authorController.text,
          'isbn': _isbnController.text.isEmpty ? "" : _isbnController.text,
          'description': _descriptionController.text,
          'condition': _selectedCondition,
          'genre': _selectedGenre,
          'gradeLevel': _selectedGradeLevel,
          'location': _locationController.text,
          'donorName': _donorNameController.text,
          'donorEmail': _emailController.text,
          'donorPhone': _phoneController.text,
          'imageUrl': _imageUrlController.text.isNotEmpty ? _imageUrlController.text : null,
          'postedDate': FieldValue.serverTimestamp(),
          'status': 'Available',
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Book donated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        
        _clearForm();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error submitting: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Donate a Book', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextFormField(
                      controller: _titleController,
                      labelText: 'Book Title*',
                      validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: _authorController,
                      labelText: 'Author*',
                      validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: _isbnController,
                      labelText: 'ISBN (optional)',
                      validator: null,
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: _imageUrlController,
                      labelText: 'Book Image URL*',
                      validator: null,
                      keyboardType: TextInputType.url,
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: _descriptionController,
                      labelText: 'Description*',
                      validator: (value) => value?.isEmpty ?? true ? 'Please describe the book' : null,
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),
                    _buildDropdownField(
                      value: _selectedCondition,
                      items: _conditionOptions,
                      labelText: 'Condition*',
                      onChanged: (value) => setState(() => _selectedCondition = value!),
                    ),
                    SizedBox(height: 16),
                    _buildDropdownField(
                      value: _selectedGenre,
                      items: _genreOptions,
                      labelText: 'Genre*',
                      onChanged: (value) => setState(() => _selectedGenre = value!),
                    ),
                    SizedBox(height: 16),
                    _buildDropdownField(
                      value: _selectedGradeLevel,
                      items: _gradeLevelOptions,
                      labelText: 'Suitable For*',
                      onChanged: (value) => setState(() => _selectedGradeLevel = value!),
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: _locationController,
                      labelText: 'Your Location*',
                      validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: _donorNameController,
                      labelText: 'Your Name*',
                      validator: (value) => value?.isEmpty ?? true ? 'Required field' : null,
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: _emailController,
                      labelText: 'Email*',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required field';
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: _phoneController,
                      labelText: 'Phone Number*',
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Phone number is required';
                        if (!RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
                          return 'Enter a valid phone number (10-15 digits)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitDonation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text('Donate Book', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: accentColor, width: 2),
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildDropdownField({
    required String value,
    required List<String> items,
    required String labelText,
    required void Function(String?)? onChanged,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      value: value,
      items: items.map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      )).toList(),
      onChanged: onChanged,
    );
  }

  void _clearForm() {
    _titleController.clear();
    _authorController.clear();
    _isbnController.clear();
    _imageUrlController.clear();
    _descriptionController.clear();
    _locationController.clear();
    _donorNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    setState(() {
      _selectedCondition = 'Good';
      _selectedGenre = 'Fiction';
      _selectedGradeLevel = 'High School';
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _isbnController.dispose();
    _imageUrlController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _donorNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}