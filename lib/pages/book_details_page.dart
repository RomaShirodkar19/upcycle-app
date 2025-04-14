// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class BookDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> book;

//   const BookDetailsPage({Key? key, required this.book}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
//     final Color secondaryColor = Colors.white;

//     // Parse the posted date
//     final postedDate = book['postedDate'] is Timestamp 
//         ? (book['postedDate'] as Timestamp).toDate() 
//         : DateTime.now();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book Details',
//              style:  TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//              ),),
//         backgroundColor: primaryColor,
//         foregroundColor: secondaryColor,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Book Cover Placeholder
//               Center(
//                 child: Container(
//                   width: 200,
//                   height: 300,
//                   decoration: BoxDecoration(
//                     color: primaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: primaryColor.withOpacity(0.2),
//                       width: 2,
//                     ),
//                   ),
//                   child: Icon(
//                     Icons.book,
//                     size: 100,
//                     color: primaryColor.withOpacity(0.5),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Book Title
//               Text(
//                 book['title'] ?? 'No Title',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor,
//                 ),
//               ),
//               SizedBox(height: 10),

//               // Author Information
//               Text(
//                 'Author: ${book['author'] ?? 'Unknown'}',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: primaryColor.withOpacity(0.8),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Donation Details Section
//               Text(
//                 'Donation Details',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor,
//                 ),
//               ),
//               Divider(color: primaryColor),
              
//               // Detailed Book Information
//               _buildDetailRow(
//                 icon: Icons.category,
//                 label: 'Genre',
//                 value: book['genre'] ?? 'Not Specified',
//                 primaryColor: primaryColor,
//               ),
//               _buildDetailRow(
//                 icon: Icons.language,
//                 label: 'Condition',
//                 value: book['condition'] ?? 'Not Specified',
//                 primaryColor: primaryColor,
//               ),
//               _buildDetailRow(
//                 icon: Icons.calendar_today,
//                 label: 'Posted On',
//                 value: postedDate.toLocal().toString().split(' ')[0],
//                 primaryColor: primaryColor,
//               ),

//               // Description Section
//               SizedBox(height: 20),
//               Text(
//                 'Description',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor,
//                 ),
//               ),
//               Divider(color: primaryColor),
//               Text(
//                 book['description'] ?? 'No description available',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: primaryColor.withOpacity(0.7),
//                 ),
//               ),

//               // Contact Information (if available)
//               if (book['contact'] != null) ...[
//                 SizedBox(height: 20),
//                 Text(
//                   'Contact Information',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: primaryColor,
//                   ),
//                 ),
//                 Divider(color: primaryColor),
//                 _buildDetailRow(
//                   icon: Icons.phone,
//                   label: 'Phone',
//                   value: book['contact'] ?? 'Not Provided',
//                   primaryColor: primaryColor,
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper method to build consistent detail rows
//   Widget _buildDetailRow({
//     required IconData icon,
//     required String label,
//     required String value,
//     required Color primaryColor,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             color: primaryColor.withOpacity(0.7),
//           ),
//           SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor,
//                 ),
//               ),
//               Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: primaryColor.withOpacity(0.8),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


/////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class BookDetailsPage extends StatefulWidget {
//   final String bookId; // Add this to pass the book document ID

//   const BookDetailsPage({Key? key, required this.bookId}) : super(key: key);

//   @override
//   _BookDetailsPageState createState() => _BookDetailsPageState();
// }

// class _BookDetailsPageState extends State<BookDetailsPage> {
//   // Store the book data
//   Map<String, dynamic>? _bookData;
//   bool _isLoading = true;
//   String? _error;

//   @override
//   void initState() {
//     super.initState();
//     _fetchBookDetails();
//   }

//   Future<void> _fetchBookDetails() async {
//     try {
//       // Fetch the specific book document from Firestore
//       final docSnapshot = await FirebaseFirestore.instance
//           .collection('books') // Replace with your actual collection name
//           .doc(widget.bookId)
//           .get();

//       // Check if the document exists
//       if (docSnapshot.exists) {
//         setState(() {
//           _bookData = docSnapshot.data();
//           _isLoading = false;
//         });
//         print("Fetched Book Data: $_bookData");
//       } else {
//         setState(() {
//           _error = 'Book not found';
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _error = 'Error fetching book details: ${e.toString()}';
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
//     final Color secondaryColor = Colors.white;

//     // Show loading indicator while fetching data
//     if (_isLoading) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Book Details'),
//           backgroundColor: primaryColor,
//         ),
//         body: Center(
//           child: CircularProgressIndicator(color: primaryColor),
//         ),
//       );
//     }

//     // Show error if there was a problem fetching data
//     if (_error != null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error'),
//           backgroundColor: primaryColor,
//         ),
//         body: Center(
//           child: Text(
//             _error!,
//             style: TextStyle(color: Colors.red),
//           ),
//         ),
//       );
//     }

//     // Ensure book data is not null
//     if (_bookData == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Book Details'),
//           backgroundColor: primaryColor,
//         ),
//         body: Center(
//           child: Text('No book data available'),
//         ),
//       );
//     }

//     // Parse the posted date
//     final postedDate = _bookData!['postedDate'] is Timestamp 
//         ? (_bookData!['postedDate'] as Timestamp).toDate() 
//         : DateTime.now();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book Details',
//              style:  TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//              ),),
//         backgroundColor: primaryColor,
//         foregroundColor: secondaryColor,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Book Cover Placeholder
//               Center(
//                 child: Container(
//                   width: 200,
//                   height: 300,
//                   decoration: BoxDecoration(
//                     color: primaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: primaryColor.withOpacity(0.2),
//                       width: 2,
//                     ),
//                   ),
//                   child: _bookData!['imageUrl'] != null && _bookData!['imageUrl'].isNotEmpty
//                       ? Image.network(
//                           _bookData!['imageUrl'],
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Icon(
//                               Icons.book,
//                               size: 100,
//                               color: primaryColor.withOpacity(0.5),
//                             );
//                           },
//                         )
//                       : Icon(
//                           Icons.book,
//                           size: 100,
//                           color: primaryColor.withOpacity(0.5),
//                         ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Book Title
//               Text(
//                 _bookData!['title'] ?? 'No Title',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor,
//                 ),
//               ),
//               SizedBox(height: 10),

//               // Author Information
//               Text(
//                 'Author: ${_bookData!['author'] ?? 'Unknown'}',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: primaryColor.withOpacity(0.8),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Donation Details Section
//               Text(
//                 'Donation Details',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor,
//                 ),
//               ),
//               Divider(color: primaryColor),
              
//               // Detailed Book Information
//               _buildDetailRow(
//                 icon: Icons.category,
//                 label: 'Genre',
//                 value: _bookData!['genre'] ?? 'Not Specified',
//                 primaryColor: primaryColor,
//               ),
//               _buildDetailRow(
//                 icon: Icons.language,
//                 label: 'Condition',
//                 value: _bookData!['condition'] ?? 'Not Specified',
//                 primaryColor: primaryColor,
//               ),
//               _buildDetailRow(
//                 icon: Icons.calendar_today,
//                 label: 'Posted On',
//                 value: postedDate.toLocal().toString().split(' ')[0],
//                 primaryColor: primaryColor,
//               ),
//               _buildDetailRow(
//                 icon: Icons.location_on,
//                 label: 'Location',
//                 value: _bookData!['location'] ?? 'Not Specified',
//                 primaryColor: primaryColor,
//               ),

//               // Description Section
//               SizedBox(height: 20),
//               Text(
//                 'Description',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor,
//                 ),
//               ),
//               Divider(color: primaryColor),
//               Text(
//                 _bookData!['description'] ?? 'No description available',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: primaryColor.withOpacity(0.7),
//                 ),
//               ),

//               // Donor Information Section
//               SizedBox(height: 20),
//               Text(
//                 'Donor Information',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor,
//                 ),
//               ),
//               Divider(color: primaryColor),
//               _buildDetailRow(
//                 icon: Icons.person,
//                 label: 'Donor Name',
//                 value: _bookData!['donorName'] ?? 'Not Provided',
//                 primaryColor: primaryColor,
//               ),
//               _buildDetailRow(
//                 icon: Icons.phone,
//                 label: 'Phone',
//                 value: _bookData!['donorPhone'] ?? 'Not Provided',
//                 primaryColor: primaryColor,
//               ),
//               _buildDetailRow(
//                 icon: Icons.email,
//                 label: 'Email',
//                 value: _bookData!['donorEmail'] ?? 'Not Provided',
//                 primaryColor: primaryColor,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper method to build consistent detail rows
//   Widget _buildDetailRow({
//     required IconData icon,
//     required String label,
//     required String value,
//     required Color primaryColor,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             color: primaryColor.withOpacity(0.7),
//           ),
//           SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor,
//                 ),
//               ),
//               Text(
//                 value,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: primaryColor.withOpacity(0.8),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookDetailsPage extends StatefulWidget {
  final String bookId;

  const BookDetailsPage({super.key, required this.bookId});

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  DocumentSnapshot? book;

  @override
  void initState() {
    super.initState();
    fetchBookDetails();
  }

  void fetchBookDetails() async {
    try {
      var doc = await FirebaseFirestore.instance.collection('donated_books').doc(widget.bookId).get();
      if (doc.exists) {
        setState(() {
          book = doc;
        });
      }
    } catch (e) {
      print("Error fetching book details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Details")),
      body: book == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book!['title'] ?? "No Title",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text("Author: ${book!['author'] ?? "Unknown"}", style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text("Condition: ${book!['condition'] ?? "Not specified"}", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  Text("Description: ${book!['description'] ?? "No description"}"),
                  const SizedBox(height: 20),
                  Text("Donor: ${book!['donor_email'] ?? "No email"}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
    );
  }
}
