// import 'package:flutter/material.dart';

// class StoreDashboard extends StatelessWidget {
//   final Color creamColor = Colors.brown[50]!; // Light cream color
//   final Color darkGreenColor = Colors.green[900]!; // Dark green color
  
//   final List<Map<String, dynamic>> requests = [
//     {
//       "address": "Anand Nagar, Thane",
//       "age": "2",
//       "condition": "Good",
//       "email": "bailurkar.bhakti@gmail.com",
//       "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfI2eoQ4fGsbLdDoVNCg1qb3X",
//       "name": "Bhakti Bailurkar",
//       "status": "Pending",
//       "date": "Mar 25, 2025",
//       "time": "5:41 AM",
//       "thriftStoreId": "H7Gu7GtotRXVBellKo60Lk8uhYc2",
//     },
//     {
//       "address": "Sector 15, Navi Mumbai",
//       "age": "1",
//       "condition": "Like New",
//       "email": "example@email.com",
//       "imageUrl": "https://example.com/image2.jpg",
//       "name": "Sample Donor",
//       "status": "Approved",
//       "date": "Mar 26, 2025",
//       "time": "10:15 AM",
//       "thriftStoreId": "H7Gu7GtotRXVBellKo60Lk8uhYc2",
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: creamColor,
//       appBar: AppBar(
//         title: Text(
//           'Donation Requests',
//           style: TextStyle(color: creamColor),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: darkGreenColor,
//         iconTheme: IconThemeData(color: creamColor),
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(16),
//         itemCount: requests.length,
//         itemBuilder: (context, index) {
//           final request = requests[index];
//           return _buildRequestCard(request, context);
//         },
//       ),
//     );
//   }

//   Widget _buildRequestCard(Map<String, dynamic> request, BuildContext context) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       color: Colors.white,
//       elevation: 2,
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.network(
//                     request['imageUrl'],
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       width: 80,
//                       height: 80,
//                       color: creamColor,
//                       child: Icon(Icons.image, color: darkGreenColor),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         request['name'],
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: darkGreenColor,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         request['email'],
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Row(
//                         children: [
//                           Icon(Icons.location_on, size: 16, color: darkGreenColor),
//                           SizedBox(width: 4),
//                           Text(
//                             request['address'],
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: darkGreenColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Chip(
//                   backgroundColor: _getStatusColor(request['status']).withOpacity(0.2),
//                   label: Text(
//                     request['status'],
//                     style: TextStyle(
//                       color: _getStatusColor(request['status']),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Divider(height: 1, color: creamColor),
//             SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.access_time, size: 16, color: darkGreenColor),
//                     SizedBox(width: 4),
//                     Text(
//                       '${request['date']} at ${request['time']}',
//                       style: TextStyle(color: darkGreenColor),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.child_care, size: 16, color: darkGreenColor),
//                     SizedBox(width: 4),
//                     Text(
//                       '${request['age']} years',
//                       style: TextStyle(color: darkGreenColor),
//                     ),
//                     SizedBox(width: 16),
//                     Icon(Icons.assignment, size: 16, color: darkGreenColor),
//                     SizedBox(width: 4),
//                     Text(
//                       request['condition'],
//                       style: TextStyle(color: darkGreenColor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             if (request['status'] == 'Pending')
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Handle approve
//                       },
//                       child: Text('Approve'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: darkGreenColor,
//                         foregroundColor: creamColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {
//                         // Handle reject
//                       },
//                       child: Text(
//                         'Reject',
//                         style: TextStyle(color: darkGreenColor),
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: darkGreenColor),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Color _getStatusColor(String status) {
//     switch (status) {
//       case 'Approved':
//         return darkGreenColor;
//       case 'Rejected':
//         return Colors.red;
//       case 'Pending':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }
// }
///////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class StoreDashboard extends StatelessWidget {
//   final Color creamColor = Colors.brown[50]!;
//   final Color darkGreenColor = Colors.green[900]!;
//   final String currentStoreId; // Pass this from the previous screen

//   StoreDashboard({Key? key, required this.currentStoreId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: creamColor,
//       appBar: AppBar(
//         title: Text(
//           'Donation Requests',
//           style: TextStyle(color: creamColor),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: darkGreenColor,
//         iconTheme: IconThemeData(color: creamColor),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('donation_requests')
//             .where('thriftStoreId', isEqualTo: currentStoreId)
//             .orderBy('timestamp', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No donation requests yet'));
//           }

//           return ListView.builder(
//             padding: EdgeInsets.all(16),
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               final request = snapshot.data!.docs[index].data() as Map<String, dynamic>;
//               final documentId = snapshot.data!.docs[index].id;
//               return _buildRequestCard(request, documentId, context);
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildRequestCard(Map<String, dynamic> request, String documentId, BuildContext context) {
//     // Convert timestamp to readable format
//     final timestamp = request['timestamp'] as Timestamp;
//     final dateTime = timestamp.toDate();
//     final date = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//     final time = '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';

//     return Card(
//       margin: EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       color: Colors.white,
//       elevation: 2,
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.network(
//                     request['imageUrl'] ?? '',
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       width: 80,
//                       height: 80,
//                       color: creamColor,
//                       child: Icon(Icons.image, color: darkGreenColor),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         request['name'] ?? 'No name',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: darkGreenColor,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         request['email'] ?? 'No email',
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Row(
//                         children: [
//                           Icon(Icons.location_on, size: 16, color: darkGreenColor),
//                           SizedBox(width: 4),
//                           Text(
//                             request['address'] ?? 'No address',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: darkGreenColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Chip(
//                   backgroundColor: _getStatusColor(request['status']).withOpacity(0.2),
//                   label: Text(
//                     request['status'] ?? 'Pending',
//                     style: TextStyle(
//                       color: _getStatusColor(request['status']),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Divider(height: 1, color: creamColor),
//             SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.access_time, size: 16, color: darkGreenColor),
//                     SizedBox(width: 4),
//                     Text(
//                       '$date at $time',
//                       style: TextStyle(color: darkGreenColor),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.child_care, size: 16, color: darkGreenColor),
//                     SizedBox(width: 4),
//                     Text(
//                       '${request['age'] ?? 'N/A'} years',
//                       style: TextStyle(color: darkGreenColor),
//                     ),
//                     SizedBox(width: 16),
//                     Icon(Icons.assignment, size: 16, color: darkGreenColor),
//                     SizedBox(width: 4),
//                     Text(
//                       request['condition'] ?? 'N/A',
//                       style: TextStyle(color: darkGreenColor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             if (request['status'] == 'Pending')
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () => _updateRequestStatus(documentId, 'Approved'),
//                       child: Text('Approve'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: darkGreenColor,
//                         foregroundColor: creamColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () => _updateRequestStatus(documentId, 'Rejected'),
//                       child: Text(
//                         'Reject',
//                         style: TextStyle(color: darkGreenColor),
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: darkGreenColor),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _updateRequestStatus(String documentId, String newStatus) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('donation_requests')
//           .doc(documentId)
//           .update({
//             'status': newStatus,
//             'statusUpdatedAt': FieldValue.serverTimestamp(),
//           });
//     } catch (e) {
//       print('Error updating status: $e');
//       // You might want to show an error message to the user
//     }
//   }

//   Color _getStatusColor(String? status) {
//     switch (status) {
//       case 'Approved':
//         return darkGreenColor;
//       case 'Rejected':
//         return Colors.red;
//       case 'Pending':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }
// }

//////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Added this import

// class StoreDashboard extends StatelessWidget {
//   final Color creamColor = Colors.brown[50]!;
//   final Color darkGreenColor = Colors.green[900]!;
//   final String currentStoreId; // Keep the parameter

//   StoreDashboard({
//     Key? key,
//     required this.currentStoreId,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Get current user (store owner)
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       return Scaffold(
//         backgroundColor: creamColor,
//         body: Center(
//           child: Text(
//             'Please login to view donation requests',
//             style: TextStyle(color: darkGreenColor),
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: creamColor,
//       appBar: AppBar(
//         title: Text(
//           'Donation Requests',
//           style: TextStyle(color: creamColor),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: darkGreenColor,
//         iconTheme: IconThemeData(color: creamColor),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('donation_requests')
//             .where('thriftStoreId', isEqualTo: currentStoreId) // Use constructor parameter
//             .orderBy('timestamp', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No donation requests yet'));
//           }

//           return ListView.builder(
//             padding: EdgeInsets.all(16),
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               final request = snapshot.data!.docs[index].data() as Map<String, dynamic>;
//               final documentId = snapshot.data!.docs[index].id;
//               return _buildRequestCard(request, documentId, context);
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildRequestCard(Map<String, dynamic> request, String documentId, BuildContext context) {
//     // Convert timestamp to readable format
//     final timestamp = request['timestamp'] as Timestamp;
//     final dateTime = timestamp.toDate();
//     final date = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//     final time = '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';

//     return Card(
//       margin: EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       color: Colors.white,
//       elevation: 2,
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.network(
//                     request['imageUrl'] ?? '',
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       width: 80,
//                       height: 80,
//                       color: creamColor,
//                       child: Icon(Icons.image, color: darkGreenColor),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         request['name'] ?? 'No name',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: darkGreenColor,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         request['email'] ?? 'No email',
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Row(
//                         children: [
//                           Icon(Icons.location_on, size: 16, color: darkGreenColor),
//                           SizedBox(width: 4),
//                           Text(
//                             request['address'] ?? 'No address',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: darkGreenColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Chip(
//                   backgroundColor: _getStatusColor(request['status']).withOpacity(0.2),
//                   label: Text(
//                     request['status'] ?? 'Pending',
//                     style: TextStyle(
//                       color: _getStatusColor(request['status']),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Divider(height: 1, color: creamColor),
//             SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.access_time, size: 16, color: darkGreenColor),
//                     SizedBox(width: 4),
//                     Text(
//                       '$date at $time',
//                       style: TextStyle(color: darkGreenColor),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.child_care, size: 16, color: darkGreenColor),
//                     SizedBox(width: 4),
//                     Text(
//                       '${request['age'] ?? 'N/A'} years',
//                       style: TextStyle(color: darkGreenColor),
//                     ),
//                     SizedBox(width: 16),
//                     Icon(Icons.assignment, size: 16, color: darkGreenColor),
//                     SizedBox(width: 4),
//                     Text(
//                       request['condition'] ?? 'N/A',
//                       style: TextStyle(color: darkGreenColor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             if (request['status'] == 'Pending')
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () => _updateRequestStatus(documentId, 'Approved'),
//                       child: Text('Approve'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: darkGreenColor,
//                         foregroundColor: creamColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () => _updateRequestStatus(documentId, 'Rejected'),
//                       child: Text(
//                         'Reject',
//                         style: TextStyle(color: darkGreenColor),
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: darkGreenColor),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _updateRequestStatus(String documentId, String newStatus) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('donation_requests')
//           .doc(documentId)
//           .update({
//             'status': newStatus,
//             'statusUpdatedAt': FieldValue.serverTimestamp(),
//           });
//     } catch (e) {
//       print('Error updating status: $e');
//       // You might want to show an error message to the user
//     }
//   }

//   Color _getStatusColor(String? status) {
//     switch (status) {
//       case 'Approved':
//         return darkGreenColor;
//       case 'Rejected':
//         return Colors.red;
//       case 'Pending':
//         return Colors.orange;
//       default:
//         return Colors.grey;
//     }
//   }
// }

//////////////////////////
///


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoreDashboard extends StatelessWidget {
  final Color creamColor = Colors.brown[50]!;
  final Color darkGreenColor = Colors.green[900]!;
  final String currentStoreId;

  StoreDashboard({Key? key, required this.currentStoreId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Debugging: Check if Store ID is correct
    print("📌 Current Store ID: $currentStoreId");

    // Get current user
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        backgroundColor: creamColor,
        body: Center(
          child: Text(
            'Please login to view donation requests',
            style: TextStyle(color: darkGreenColor),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: creamColor,
      appBar: AppBar(
        title: Text('Donation Requests', style: TextStyle(color: creamColor)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: darkGreenColor,
        iconTheme: IconThemeData(color: creamColor),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('donation_requests')
            .where('thriftStoreId', isEqualTo: currentStoreId)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("❌ Firestore Error: ${snapshot.error}");
            return Center(child: Text('Error fetching data'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Ensure data exists
          final docs = snapshot.data?.docs ?? [];
          if (docs.isEmpty) {
            print("⚠️ No donation requests found!");
            return Center(child: Text('No donation requests yet'));
          }

          print("✅ Fetched ${docs.length} donation requests!");

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final requestData = docs[index].data() as Map<String, dynamic>? ?? {};
              final documentId = docs[index].id;
              print("🔹 Request ${index + 1}: ${requestData['name']} - ${requestData['status']}");
              return _buildRequestCard(requestData, documentId, context);
            },
          );
        },
      ),
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> request, String documentId, BuildContext context) {
    final timestamp = request['timestamp'] as Timestamp?;
    final dateTime = timestamp?.toDate();
    final date = dateTime != null ? '${dateTime.day}/${dateTime.month}/${dateTime.year}' : 'N/A';
    final time = dateTime != null ? '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}' : 'N/A';

    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    request['imageUrl'] ?? '',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 80,
                      height: 80,
                      color: creamColor,
                      child: Icon(Icons.image, color: darkGreenColor),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request['name'] ?? 'No name',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkGreenColor),
                      ),
                      SizedBox(height: 4),
                      Text(
                        request['email'] ?? 'No email',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: darkGreenColor),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              request['address'] ?? 'No address',
                              style: TextStyle(fontSize: 14, color: darkGreenColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Chip(
                  backgroundColor: _getStatusColor(request['status']).withOpacity(0.2),
                  label: Text(
                    request['status'] ?? 'Pending',
                    style: TextStyle(color: _getStatusColor(request['status']), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(height: 1, color: creamColor),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: darkGreenColor),
                    SizedBox(width: 4),
                    Text('$date at $time', style: TextStyle(color: darkGreenColor)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.child_care, size: 16, color: darkGreenColor),
                    SizedBox(width: 4),
                    Text('${request['age'] ?? 'N/A'} years', style: TextStyle(color: darkGreenColor)),
                    SizedBox(width: 16),
                    Icon(Icons.assignment, size: 16, color: darkGreenColor),
                    SizedBox(width: 4),
                    Text(request['condition'] ?? 'N/A', style: TextStyle(color: darkGreenColor)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            if (request['status'] == 'Pending')
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _updateRequestStatus(documentId, 'Approved'),
                      child: Text('Approve'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreenColor,
                        foregroundColor: creamColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _updateRequestStatus(documentId, 'Rejected'),
                      child: Text('Reject', style: TextStyle(color: darkGreenColor)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: darkGreenColor),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateRequestStatus(String documentId, String newStatus) async {
    try {
      await FirebaseFirestore.instance.collection('donation_requests').doc(documentId).update({
        'status': newStatus,
        'statusUpdatedAt': FieldValue.serverTimestamp(),
      });
      print("✅ Request $documentId updated to $newStatus");
    } catch (e) {
      print('❌ Error updating status: $e');
    }
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'Approved':
        return darkGreenColor;
      case 'Rejected':
        return Colors.red;
      case 'Pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
