// import 'package:flutter/material.dart';
// import 'package:mpl_lab/pages/book_donation_form.dart';
// import 'package:mpl_lab/pages/thriftstore_listings.dart'; // Make sure to import your thrift store page

// class BookDonationListingPage extends StatefulWidget {
//   @override
//   _BookDonationListingPageState createState() => _BookDonationListingPageState();
// }

// class _BookDonationListingPageState extends State<BookDonationListingPage> {
//   // Define the color scheme
//   final Color primaryColor = Color.fromARGB(255, 24, 62, 25); // Dark green
//   final Color secondaryColor = Color.fromARGB(255, 234, 226, 199); // Light beige

//   // Empty list to start with
//   List<Map<String, dynamic>> books = [];
//   int _selectedIndex = 2; // Default to Books tab (index 2)

//   // Method to add a new book
//   void _addNewBook(Map<String, dynamic> newBook) {
//     setState(() {
//       books.insert(0, newBook); // Add to the top of the list
//     });
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     // Navigation logic based on index
//     if (index == 0) { // Home
//       Navigator.popUntil(context, (route) => route.isFirst);
//     } else if (index == 1) { // Clothes
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => ThriftStoreListings()),
//       );
//     } else if (index == 3) { // My Items
//       // Navigate to my items page when implemented
//       // Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => MyItemsPage()),
//       // );
//     }
//     // Index 2 is Books (current page), so no navigation needed
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('School Supplies Donation'),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//         foregroundColor: secondaryColor,
//       ),
//       backgroundColor: secondaryColor,
//       body: Column(
//         children: [
//           // Donation Call-to-Action Banner
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(16),
//             color: primaryColor.withOpacity(0.1),
//             child: Column(
//               children: [
//                 Text(
//                   'Donate Your School/College Supplies',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: primaryColor,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Help other students by donating books, stationery, and learning materials',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: primaryColor.withOpacity(0.8),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 12),
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Navigate to the donation form and wait for result
//                     final result = await Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => BookDonationFormPage(),
//                       ),
//                     );

//                     // If a new book is returned, add it to the list
//                     if (result != null && result is Map<String, dynamic>) {
//                       _addNewBook(result);
//                     }
//                   },
//                   child: Text('Donate Now'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor,
//                     foregroundColor: secondaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Conditional display based on book list
//           Expanded(
//             child: books.isEmpty
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.book_outlined,
//                           size: 80,
//                           color: primaryColor.withOpacity(0.3),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'No donations yet',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: primaryColor.withOpacity(0.7),
//                           ),
//                         ),
//                         Text(
//                           'Be the first to donate!',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: primaryColor.withOpacity(0.5),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : ListView.builder(
//                     padding: EdgeInsets.all(10),
//                     itemCount: books.length,
//                     itemBuilder: (context, index) {
//                       final book = books[index];
//                       return Card(
//                         elevation: 4,
//                         margin: EdgeInsets.symmetric(vertical: 8),
//                         color: secondaryColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           side: BorderSide(
//                             color: primaryColor.withOpacity(0.2),
//                             width: 1,
//                           ),
//                         ),
//                         child: ListTile(
//                           leading: Container(
//                             width: 60,
//                             height: 80,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(
//                                 color: primaryColor.withOpacity(0.3),
//                                 width: 1,
//                               ),
//                               image: DecorationImage(
//                                 image: NetworkImage(book['coverImage']),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           title: Text(
//                             book['title'],
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: primaryColor,
//                             ),
//                           ),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'by ${book['author']}',
//                                 style: TextStyle(
//                                   color: primaryColor.withOpacity(0.8),
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.person_outline,
//                                     size: 16,
//                                     color: primaryColor,
//                                   ),
//                                   SizedBox(width: 4),
//                                   Text(
//                                     book['donorName'],
//                                     style: TextStyle(
//                                       color: primaryColor.withOpacity(0.8),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.calendar_today,
//                                     size: 16,
//                                     color: primaryColor,
//                                   ),
//                                   SizedBox(width: 4),
//                                   Text(
//                                     _formatDate(book['donationDate']),
//                                     style: TextStyle(
//                                       color: primaryColor.withOpacity(0.8),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           trailing: Chip(
//                             label: Text(
//                               book['condition'],
//                               style: TextStyle(
//                                 color: primaryColor,
//                               ),
//                             ),
//                             backgroundColor: _getConditionColor(book['condition'])
//                                 .withOpacity(0.3),
//                             side: BorderSide(
//                               color: primaryColor.withOpacity(0.2),
//                             ),
//                           ),
//                           onTap: () {
//                             _showBookDetailsDialog(context, book);
//                           },
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: primaryColor,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.checkroom),
//             label: 'Clothes',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Books',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_bag_outlined),
//             label: 'My Items',
//           ),
//         ],
//       ),
//       // Removed the floatingActionButton from here
//     );
//   }

//   // Custom date formatting method
//   String _formatDate(DateTime date) {
//     final months = [
//       'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
//       'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
//     ];
//     return '${months[date.month - 1]} ${date.day}, ${date.year}';
//   }

//   Color _getConditionColor(String condition) {
//     switch (condition) {
//       case 'Like New':
//         return Colors.green;
//       case 'Good':
//         return Colors.blue;
//       case 'Acceptable':
//         return Colors.orange;
//       case 'Poor':
//         return Colors.red;
//       default:
//         return primaryColor;
//     }
//   }

//   void _showBookDetailsDialog(BuildContext context, Map<String, dynamic> book) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: secondaryColor,
//           title: Text(
//             book['title'],
//             style: TextStyle(color: primaryColor),
//           ),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 150,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: primaryColor.withOpacity(0.3),
//                         width: 1,
//                       ),
//                       image: DecorationImage(
//                         image: NetworkImage(book['coverImage']),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 _buildDetailRow('Author:', book['author']),
//                 _buildDetailRow('Genre:', book['genre']),
//                 _buildDetailRow('Condition:', book['condition']),
//                 _buildDetailRow('Donated by:', book['donorName']),
//                 _buildDetailRow('Donation Date:', _formatDate(book['donationDate'])),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text(
//                 'Close',
//                 style: TextStyle(color: primaryColor),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: RichText(
//         text: TextSpan(
//           style: TextStyle(
//             color: primaryColor.withOpacity(0.8),
//             fontSize: 14,
//           ),
//           children: [
//             TextSpan(
//               text: '$label ',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             TextSpan(text: value),
//           ],
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mpl_lab/pages/book_donation_form.dart';
// import 'package:mpl_lab/pages/thriftstore_listings.dart';

// class BookDonationListingPage extends StatefulWidget {
//   @override
//   _BookDonationListingPageState createState() => _BookDonationListingPageState();
// }

// class _BookDonationListingPageState extends State<BookDonationListingPage> {
//   final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
//   final Color secondaryColor = Color.fromARGB(255, 234, 226, 199);
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   int _selectedIndex = 2;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     if (index == 0) {
//       Navigator.popUntil(context, (route) => route.isFirst);
//     } else if (index == 1) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => ThriftStoreListings()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('School Supplies Donation'),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//         foregroundColor: secondaryColor,
//       ),
//       backgroundColor: secondaryColor,
//       body: Column(
//         children: [
//           // Donation Call-to-Action Banner
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(16),
//             color: primaryColor.withOpacity(0.1),
//             child: Column(
//               children: [
//                 Text(
//                   'Donate Your School/College Supplies',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: primaryColor,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Help other students by donating books, stationery, and learning materials',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: primaryColor.withOpacity(0.8),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 12),
//                 ElevatedButton(
//                   onPressed: () async {
//                     final result = await Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => BookDonationFormPage(),
//                       ),
//                     );
//                     if (result != null && result is bool && result) {
//                       // Refresh the list if a new book was added
//                       setState(() {});
//                     }
//                   },
//                   child: Text('Donate Now'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor,
//                     foregroundColor: secondaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Book List from Firestore
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore.collection('donated_books').snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error loading books'));
//                 }

//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.book_outlined,
//                           size: 80,
//                           color: primaryColor.withOpacity(0.3),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'No donations yet',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: primaryColor.withOpacity(0.7),
//                         ),
//                         Text(
//                           'Be the first to donate!',
//                           style: TextStyle(
//                           fontSize: 14,
//                           color: primaryColor.withOpacity(0.5),
//                         ),
//                       ],
//                     ),
//                   );
//                 }

//                 final books = snapshot.data!.docs;

//                 return ListView.builder(
//                   padding: EdgeInsets.all(10),
//                   itemCount: books.length,
//                   itemBuilder: (context, index) {
//                     final book = books[index].data() as Map<String, dynamic>;
//                     final docId = books[index].id;
//                     final postedDate = (book['postedDate'] as Timestamp).toDate();

//                     return Card(
//                       elevation: 4,
//                       margin: EdgeInsets.symmetric(vertical: 8),
//                       color: secondaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         side: BorderSide(
//                           color: primaryColor.withOpacity(0.2),
//                           width: 1,
//                         ),
//                       ),
//                       child: ListTile(
//                         leading: Container(
//                           width: 60,
//                           height: 80,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: primaryColor.withOpacity(0.3),
//                               width: 1,
//                             ),
//                             color: primaryColor.withOpacity(0.1),
//                             // Placeholder for book cover - you can implement actual image later
//                             child: Icon(Icons.book, color: primaryColor),
//                           ),
//                         ),
//                         title: Text(
//                           book['title'] ?? 'No Title',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: primaryColor,
//                           ),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'by ${book['author'] ?? 'Unknown'}',
//                               style: TextStyle(
//                                 color: primaryColor.withOpacity(0.8),
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.person_outline,
//                                   size: 16,
//                                   color: primaryColor,
//                                 ),
//                                 SizedBox(width: 4),
//                                 Text(
//                                   book['donorName'] ?? 'Anonymous',
//                                   style: TextStyle(
//                                     color: primaryColor.withOpacity(0.8),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.calendar_today,
//                                   size: 16,
//                                   color: primaryColor,
//                                 ),
//                                 SizedBox(width: 4),
//                                 Text(
//                                   _formatDate(postedDate),
//                                   style: TextStyle(
//                                     color: primaryColor.withOpacity(0.8),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         trailing: Chip(
//                           label: Text(
//                             book['condition'] ?? 'Unknown',
//                             style: TextStyle(
//                               color: primaryColor,
//                             ),
//                           ),
//                           backgroundColor: _getConditionColor(book['condition'] ?? '')
//                               .withOpacity(0.3),
//                           side: BorderSide(
//                             color: primaryColor.withOpacity(0.2),
//                           ),
//                         ),
//                         onTap: () {
//                           _showBookDetailsDialog(context, book, postedDate);
//                         },
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: primaryColor,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.checkroom),
//             label: 'Clothes',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Books',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_bag_outlined),
//             label: 'My Items',
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatDate(DateTime date) {
//     final months = [
//       'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
//       'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
//     ];
//     return '${months[date.month - 1]} ${date.day}, ${date.year}';
//   }

//   Color _getConditionColor(String condition) {
//     switch (condition) {
//       case 'Like New':
//         return Colors.green;
//       case 'Good':
//         return Colors.blue;
//       case 'Acceptable':
//         return Colors.orange;
//       case 'Poor':
//         return Colors.red;
//       default:
//         return primaryColor;
//     }
//   }

//   void _showBookDetailsDialog(BuildContext context, Map<String, dynamic> book, DateTime postedDate) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: secondaryColor,
//           title: Text(
//             book['title'] ?? 'No Title',
//             style: TextStyle(color: primaryColor),
//           ),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 150,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: primaryColor.withOpacity(0.3),
//                         width: 1,
//                       ),
//                       color: primaryColor.withOpacity(0.1),
//                       child: Icon(Icons.book, size: 60, color: primaryColor),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 _buildDetailRow('Author:', book['author'] ?? 'Unknown'),
//                 _buildDetailRow('Genre:', book['genre'] ?? 'Not specified'),
//                 _buildDetailRow('Condition:', book['condition'] ?? 'Unknown'),
//                 _buildDetailRow('Donated by:', book['donorName'] ?? 'Anonymous'),
//                 _buildDetailRow('Location:', book['location'] ?? 'Not specified'),
//                 _buildDetailRow('Status:', book['status'] ?? 'Unknown'),
//                 _buildDetailRow('Posted Date:', _formatDate(postedDate)),
//                 SizedBox(height: 10),
//                 Text(
//                   'Description:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: primaryColor,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   book['description'] ?? 'No description provided',
//                   style: TextStyle(
//                     color: primaryColor.withOpacity(0.8),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text(
//                 'Close',
//                 style: TextStyle(color: primaryColor),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: RichText(
//         text: TextSpan(
//           style: TextStyle(
//             color: primaryColor.withOpacity(0.8),
//             fontSize: 14,
//           ),
//           children: [
//             TextSpan(
//               text: '$label ',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             TextSpan(text: value),
//           ],
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////
///

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mpl_lab/pages/book_donation_form.dart';
// import 'package:mpl_lab/pages/thriftstore_listings.dart';

// class BookDonationListingPage extends StatefulWidget {
//   @override
//   _BookDonationListingPageState createState() => _BookDonationListingPageState();
// }

// class _BookDonationListingPageState extends State<BookDonationListingPage> {
//   final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
//   final Color secondaryColor = Color.fromARGB(255, 234, 226, 199);
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   int _selectedIndex = 2;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     if (index == 0) {
//       Navigator.popUntil(context, (route) => route.isFirst);
//     } else if (index == 1) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => ThriftStoreListings()),
//       );
//     }
//   }

//   void _showBookDetailsDialog(BuildContext context, Map<String, dynamic> book, DateTime postedDate) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(book['title'] ?? 'No Title'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Author: ${book['author'] ?? 'Unknown'}'),
//               SizedBox(height: 8),
//               Text('Description: ${book['description'] ?? 'No Description'}'),
//               SizedBox(height: 8),
//               Text('Posted on: ${postedDate.toLocal().toString().split(' ')[0]}'),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('School Supplies Donation'),
//         centerTitle: true,
//         backgroundColor: primaryColor,
//         foregroundColor: secondaryColor,
//       ),
//       backgroundColor: secondaryColor,
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(16),
//             color: primaryColor.withOpacity(0.1),
//             child: Column(
//               children: [
//                 Text(
//                   'Donate Your School/College Supplies',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: primaryColor,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Help other students by donating books, stationery, and learning materials',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: primaryColor.withOpacity(0.8),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 12),
//                 ElevatedButton(
//                   onPressed: () async {
//                     final result = await Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => BookDonationFormPage(),
//                       ),
//                     );
//                     if (result == true) {
//                       setState(() {});
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor,
//                     foregroundColor: secondaryColor,
//                   ),
//                   child: Text('Donate Now'),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore.collection('donated_books').snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error loading books'));
//                 }
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.book_outlined,
//                           size: 80,
//                           color: primaryColor.withOpacity(0.3),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'No donations yet',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: primaryColor.withOpacity(0.7),
//                           ),
//                         ),
//                         Text(
//                           'Be the first to donate!',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: primaryColor.withOpacity(0.5),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//                 final books = snapshot.data!.docs;
//                 return ListView.builder(
//                   padding: EdgeInsets.all(10),
//                   itemCount: books.length,
//                   itemBuilder: (context, index) {
//                     final book = books[index].data() as Map<String, dynamic>;
//                     final postedDate = book['postedDate'] is Timestamp ?
//                         (book['postedDate'] as Timestamp).toDate() : DateTime.now();
//                     return Card(
//                       elevation: 4,
//                       margin: EdgeInsets.symmetric(vertical: 8),
//                       color: secondaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         side: BorderSide(
//                           color: primaryColor.withOpacity(0.2),
//                           width: 1,
//                         ),
//                       ),
//                       child: ListTile(
//                         title: Text(
//                           book['title'] ?? 'No Title',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: primaryColor,
//                           ),
//                         ),
//                         subtitle: Text(
//                           'by ${book['author'] ?? 'Unknown'}',
//                           style: TextStyle(
//                             color: primaryColor.withOpacity(0.8),
//                           ),
//                         ),
//                         onTap: () {
//                           _showBookDetailsDialog(context, book, postedDate);
//                         },
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


/////////////////////////////////////////////////////


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mpl_lab/pages/book_donation_form.dart';
import 'package:mpl_lab/pages/book_details_page.dart';
import 'package:mpl_lab/pages/thriftstore_listings.dart';

class BookDonationListingPage extends StatefulWidget {
  @override
  _BookDonationListingPageState createState() => _BookDonationListingPageState();
}

class _BookDonationListingPageState extends State<BookDonationListingPage> {
  final Color primaryColor = Color.fromARGB(255, 24, 62, 25);
  final Color secondaryColor = Colors.white;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _selectedIndex = 2;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.popUntil(context, (route) => route.isFirst);
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ThriftStoreListings()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Supplies Donation'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
      ),
      backgroundColor: secondaryColor,
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search donated books...',
                prefixIcon: Icon(Icons.search, color: primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: primaryColor, width: 2),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          
          // Donation Info Card
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  'Donate Your School/College Supplies',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Help other students by donating books, stationery, and learning materials',
                  style: TextStyle(
                    fontSize: 14,
                    color: primaryColor.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookDonationFormPage(),
                      ),
                    );
                    if (result == true) {
                      setState(() {});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Donate Now'),
                ),
              ],
            ),
          ),
          
          // Donated Books Grid
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('donated_books').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error loading books'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book_outlined,
                          size: 80,
                          color: primaryColor.withOpacity(0.3),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No donations yet',
                          style: TextStyle(
                            fontSize: 18,
                            color: primaryColor.withOpacity(0.7),
                          ),
                        ),
                        Text(
                          'Be the first to donate!',
                          style: TextStyle(
                            fontSize: 14,
                            color: primaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                
                // Filter books based on search query
                final books = snapshot.data!.docs.where((doc) {
                  final book = doc.data() as Map<String, dynamic>;
                  final title = (book['title'] ?? '').toLowerCase();
                  final author = (book['author'] ?? '').toLowerCase();
                  return title.contains(_searchQuery) || author.contains(_searchQuery);
                }).toList();

                return GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index].data() as Map<String, dynamic>;
                    final postedDate = book['postedDate'] is Timestamp ?
                        (book['postedDate'] as Timestamp).toDate() : DateTime.now();
                    
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailsPage(book: book),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: primaryColor.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                ),
                                child: book['bookImageUrl'] != null && book['bookImageUrl'].isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        ),
                                        child: Image.network(
                                          book['bookImageUrl'],
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Center(
                                              child: Icon(
                                                Icons.book,
                                                size: 60,
                                                color: primaryColor.withOpacity(0.5),
                                              ),
                                            );
                                          },
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress.expectedTotalBytes != null
                                                    ? loadingProgress.cumulativeBytesLoaded /
                                                        loadingProgress.expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : Center(
                                        child: Icon(
                                          Icons.book,
                                          size: 60,
                                          color: primaryColor.withOpacity(0.5),
                                        ),
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book['title'] ?? 'No Title',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      fontSize: 16,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'by ${book['author'] ?? 'Unknown'}',
                                    style: TextStyle(
                                      color: primaryColor.withOpacity(0.8),
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Thrift Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Book Donation',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  final Map<String, dynamic> book;

  const BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
        backgroundColor: Color.fromARGB(255, 24, 62, 25),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book['bookImageUrl'] != null && book['bookImageUrl'].isNotEmpty)
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    book['bookImageUrl'],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 60,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              )
            else
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Icon(
                    Icons.book,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            SizedBox(height: 20),
            Text(
              book['title'] ?? 'No Title',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Author: ${book['author'] ?? 'Unknown'}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              book['description'] ?? 'No description available',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            if (book['condition'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Condition:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    book['condition'],
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}