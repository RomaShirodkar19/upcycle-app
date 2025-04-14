import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyItemsPage extends StatelessWidget {
  final Color darkGreenColor = Colors.green[900]!;
  final Color creamColor = Colors.brown[50]!;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Scaffold(
        backgroundColor: creamColor,
        body: Center(child: Text('Please login to view your items', style: TextStyle(color: darkGreenColor))),
      );
    }

    return DefaultTabController(
      length: 2, // Two tabs: Donated Books & Donation Requests
      child: Scaffold(
        backgroundColor: creamColor,
        appBar: AppBar(
          title: Text('My Items', style: TextStyle(color: creamColor)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: darkGreenColor,
          iconTheme: IconThemeData(color: creamColor),
          bottom: TabBar(
            labelColor: creamColor,
            unselectedLabelColor: Colors.grey[300],
            indicatorColor: creamColor,
            tabs: [
              Tab(text: 'Donated Books'),
              Tab(text: 'Donation Requests'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDonatedBooks(user.email!), // First Tab
            _buildDonationRequests(user.email!), // Second Tab
          ],
        ),
      ),
    );
  }

  // Fetch Donated Books
  Widget _buildDonatedBooks(String userEmail) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('donated_books').where('donorEmail', isEqualTo: userEmail).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
        if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());

        if (snapshot.data!.docs.isEmpty) return Center(child: Text('No books donated yet'));

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final book = snapshot.data!.docs[index].data() as Map<String, dynamic>;
            return _buildBookCard(book);
          },
        );
      },
    );
  }

  // Fetch Donation Requests
  Widget _buildDonationRequests(String userEmail) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('donation_requests').where('email', isEqualTo: userEmail).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
        if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());

        if (snapshot.data!.docs.isEmpty) return Center(child: Text('No donation requests yet'));

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final request = snapshot.data!.docs[index].data() as Map<String, dynamic>;
            return _buildRequestCard(request);
          },
        );
      },
    );
  }

  // Card for Books
  Widget _buildBookCard(Map<String, dynamic> book) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                book['bookImageUrl'] ?? '',
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
                  Text(book['title'] ?? 'No title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkGreenColor)),
                  SizedBox(height: 4),
                  Text('Author: ${book['author'] ?? 'Unknown'}', style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 4),
                  Text('Condition: ${book['condition'] ?? 'Unknown'}', style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 4),
                  Text('Status: ${book['status'] ?? 'Available'}', style: TextStyle(fontWeight: FontWeight.bold, color: darkGreenColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card for Requests
  Widget _buildRequestCard(Map<String, dynamic> request) {
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
                      Text(request['name'] ?? 'No name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkGreenColor)),
                      SizedBox(height: 4),
                      Text('Address: ${request['address'] ?? 'Unknown'}', style: TextStyle(color: Colors.grey[600])),
                      SizedBox(height: 4),
                      Text('Status: ${request['status'] ?? 'Pending'}', style: TextStyle(fontWeight: FontWeight.bold, color: _getStatusColor(request['status']))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'Approved': return Colors.green;
      case 'Rejected': return Colors.red;
      case 'Pending': return Colors.orange;
      default: return Colors.grey;
    }
  }
}
