

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mpl_lab/pages/create_store.dart';
// import 'package:mpl_lab/pages/login_page.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Map<String, dynamic>? userDetails;
//   bool isLoading = true;
  
//   final Color primaryColor = const Color.fromARGB(255, 24, 62, 25);
//   final Color secondaryColor = const Color.fromARGB(255, 234, 226, 199);

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }

//   Future<void> _fetchUserData() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       DocumentSnapshot userDoc =
//           await _firestore.collection('users').doc(user.uid).get();
//       if (userDoc.exists) {
//         setState(() {
//           userDetails = userDoc.data() as Map<String, dynamic>;
//           isLoading = false;
//         });
//       }
//     }
//   }

//   // Add this method to update user data when returning from CreateStorePage
//   Future<void> _updateUserData() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       DocumentSnapshot userDoc =
//           await _firestore.collection('users').doc(user.uid).get();
//       if (userDoc.exists) {
//         setState(() {
//           userDetails = userDoc.data() as Map<String, dynamic>;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor,
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         elevation: 0,
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.edit, color: Colors.white),
//             onPressed: () {
//               // Edit profile action
//             },
//           ),
//         ],
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(
//                 color: primaryColor,
//               ),
//             )
//           : userDetails == null
//               ? Center(
//                   child: Text(
//                     'User not found',
//                     style: TextStyle(
//                       color: primaryColor,
//                       fontSize: 18,
//                     ),
//                   ),
//                 )
//               : _buildProfileContent(),
//     );
//   }

//   Widget _buildProfileContent() {
//     bool isStoreOwner = userDetails?['role'] == 'Thrift Store Owner';
//     bool hasStore = userDetails?['hasStore'] ?? false;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(height: 20),
//           CircleAvatar(
//             radius: 60,
//             backgroundColor: primaryColor.withOpacity(0.2),
//             child: Text(
//               (userDetails?['name'] ?? 'User')[0].toUpperCase(),
//               style: TextStyle(
//                 fontSize: 48,
//                 fontWeight: FontWeight.bold,
//                 color: primaryColor,
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),
//           Text(
//             userDetails?['name'] ?? 'No Name',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: primaryColor,
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             userDetails?['role'] ?? 'User',
//             style: TextStyle(
//               fontSize: 16,
//               color: primaryColor.withOpacity(0.7),
//             ),
//           ),
//           const SizedBox(height: 30),
//           _buildInfoCard(
//             icon: Icons.email,
//             title: 'Email',
//             content: userDetails?['email'] ?? 'No Email',
//           ),
//           _buildInfoCard(
//             icon: Icons.phone,
//             title: 'Phone',
//             content: userDetails?['phone'] ?? 'No Phone',
//           ),
//           _buildInfoCard(
//             icon: Icons.location_on,
//             title: 'Address',
//             content: userDetails?['address'] ?? 'No Address',
//           ),
//           const SizedBox(height: 30),
//           if (isStoreOwner)
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               decoration: BoxDecoration(
//                 color: primaryColor.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.store,
//                     size: 40,
//                     color: primaryColor,
//                   ),
//                   const SizedBox(height: 12),
//                   Text(
//                     'Thrift Store Management',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: primaryColor,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   hasStore
//                       ? ElevatedButton.icon(
//                           icon: const Icon(Icons.dashboard),
//                           label: const Text('Store Dashboard'),
//                           onPressed: () {
//                             // Navigate to store dashboard
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: primaryColor,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 24,
//                               vertical: 12,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                         )
//                       : ElevatedButton.icon(
//                           icon: const Icon(Icons.add_business),
//                           label: const Text('Create Store'),
//                           onPressed: () async {
//                             String ownerId = _auth.currentUser?.uid ?? '';
//                             if (ownerId.isNotEmpty) {
//                               // Navigate to create store and wait for result
//                               final result = await Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => CreateStorePage(ownerId: ownerId)
//                                 ),
//                               );
                              
//                               // If store was created successfully, update the UI
//                               if (result == true) {
//                                 await _updateUserData();
//                               }
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text('Error: User not logged in'))
//                               );
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: primaryColor,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 24,
//                               vertical: 12,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                         ),
//                 ],
//               ),
//             ),
//           const SizedBox(height: 30),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton.icon(
//               icon: const Icon(Icons.logout),
//               label: const Text('Logout'),
//               onPressed: () async {
//                 await _auth.signOut();
//                 Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => const LoginPage()),
//                 (route) => false,
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red[400],
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 40),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoCard({
//     required IconData icon,
//     required String title,
//     required String content,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: primaryColor.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(
//               icon,
//               color: primaryColor,
//               size: 24,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: primaryColor.withOpacity(0.6),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   content,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: primaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////
///
///

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mpl_lab/pages/create_store.dart';
import 'package:mpl_lab/pages/login_page.dart';
import 'package:mpl_lab/pages/store_dashboard.dart';  // Add this import

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? userDetails;
  bool isLoading = true;
  
  final Color primaryColor = const Color.fromARGB(255, 24, 62, 25);
  final Color secondaryColor = const Color.fromARGB(255, 234, 226, 199);

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          userDetails = userDoc.data() as Map<String, dynamic>;
          isLoading = false;
        });
      }
    }
  }

  Future<void> _updateUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          userDetails = userDoc.data() as Map<String, dynamic>;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Edit profile action
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : userDetails == null
              ? Center(
                  child: Text(
                    'User not found',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
                )
              : _buildProfileContent(),
    );
  }

  Widget _buildProfileContent() {
    bool isStoreOwner = userDetails?['role'] == 'Thrift Store Owner';
    bool hasStore = userDetails?['hasStore'] ?? false;
    String storeId = userDetails?['storeId'] ?? '';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundColor: primaryColor.withOpacity(0.2),
            child: Text(
              (userDetails?['name'] ?? 'User')[0].toUpperCase(),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            userDetails?['name'] ?? 'No Name',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            userDetails?['role'] ?? 'User',
            style: TextStyle(
              fontSize: 16,
              color: primaryColor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 30),
          _buildInfoCard(
            icon: Icons.email,
            title: 'Email',
            content: userDetails?['email'] ?? 'No Email',
          ),
          _buildInfoCard(
            icon: Icons.phone,
            title: 'Phone',
            content: userDetails?['phone'] ?? 'No Phone',
          ),
          _buildInfoCard(
            icon: Icons.location_on,
            title: 'Address',
            content: userDetails?['address'] ?? 'No Address',
          ),
          const SizedBox(height: 30),
          if (isStoreOwner)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.store,
                    size: 40,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Thrift Store Management',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (hasStore) ...[
                    ElevatedButton.icon(
                      icon: const Icon(Icons.dashboard),
                      label: const Text('Store Dashboard'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoreDashboard(
                              currentStoreId: userDetails?['storeId'] ?? _auth.currentUser?.uid ?? '',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  ElevatedButton.icon(
                    icon: Icon(hasStore ? Icons.edit : Icons.add_business),
                    label: Text(hasStore ? 'Edit Store' : 'Create Store'),
                    onPressed: () async {
                      String ownerId = _auth.currentUser?.uid ?? '';
                      if (ownerId.isNotEmpty) {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateStorePage(ownerId: ownerId)
                          ),
                        );
                        
                        if (result == true) {
                          await _updateUserData();
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Error: User not logged in'))
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: hasStore ? Colors.orange[400] : primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: primaryColor.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}