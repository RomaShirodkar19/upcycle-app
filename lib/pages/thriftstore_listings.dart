// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mpl_lab/pages/thriftstore_details.dart';

// class ThriftStoreListings extends StatefulWidget {
//   const ThriftStoreListings({super.key});

//   @override
//   State<ThriftStoreListings> createState() => _ThriftStoreListingsState();
// }

// class _ThriftStoreListingsState extends State<ThriftStoreListings> {
//   // Define our colors
//   static const Color primaryColor = Color.fromARGB(255, 24, 62, 25);
//   static const Color secondaryColor = Color.fromARGB(255, 233, 237, 231);
//   static const Color accentColor = Color.fromARGB(255, 76, 115, 77);
  
//   int _selectedIndex = 0;
//   String _searchText = '';
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Filter stores based on search text
//   void _runFilter(String enteredKeyword) {
//     setState(() {
//       _searchText = enteredKeyword;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Thrift Stores',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         backgroundColor: primaryColor,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               // Filter functionality
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.favorite_border),
//             onPressed: () {
//               // Favorites functionality
//             },
//           ),
//         ],
//       ),
//       backgroundColor: secondaryColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Search bar section with curved design
//           Container(
//             decoration: BoxDecoration(
//               color: primaryColor,
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(25),
//                 bottomRight: Radius.circular(25),
//               ),
//             ),
//             padding: const EdgeInsets.fromLTRB(16, 5, 16, 30),
//             child: TextField(
//               onChanged: (value) => _runFilter(value),
//               decoration: InputDecoration(
//                 hintText: 'Search for thrift stores by name...',
//                 prefixIcon: const Icon(Icons.search, color: accentColor),
//                 suffixIcon: _searchText.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear, color: accentColor),
//                         onPressed: () {
//                           setState(() {
//                             _searchText = '';
//                             FocusScope.of(context).unfocus();
//                           });
//                         },
//                       )
//                     : const Icon(Icons.mic, color: accentColor),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.white,
//                 contentPadding: const EdgeInsets.symmetric(vertical: 12),
//               ),
//             ),
//           ),
          
//           // Main content
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     StreamBuilder<QuerySnapshot>(
//                       stream: _searchText.isEmpty
//                           ? _firestore.collection('thriftstore').snapshots()
//                           : _firestore.collection('thriftstore')
//                               .where('name', isGreaterThanOrEqualTo: _searchText)
//                               .where('name', isLessThan: _searchText + 'z')
//                               .snapshots(),
//                       builder: (context, snapshot) {
//                         if (!snapshot.hasData) {
//                           return const Text(
//                             'Loading...',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: primaryColor,
//                             ),
//                           );
//                         }
//                         return Text(
//                           _searchText.isEmpty
//                               ? 'Nearby Thrift Stores'
//                               : '${snapshot.data!.docs.length} Results Found',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: primaryColor,
//                           ),
//                         );
//                       },
//                     ),
//                     TextButton.icon(
//                       icon: const Icon(Icons.sort, size: 16, color: accentColor),
//                       label: const Text(
//                         'Sort',
//                         style: TextStyle(color: accentColor),
//                       ),
//                       onPressed: () {
//                         // Sort functionality
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
          
//           // Store listings from Firestore
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _searchText.isEmpty
//                   ? _firestore.collection('thriftstore').snapshots()
//                   : _firestore.collection('thriftstore')
//                       .where('name', isGreaterThanOrEqualTo: _searchText)
//                       .where('name', isLessThan: _searchText + 'z')
//                       .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
                
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }
                
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.search_off,
//                           size: 60,
//                           color: Colors.grey[400],
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'No thrift stores found',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           _searchText.isEmpty
//                               ? 'No stores available'
//                               : 'Try a different search term',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey[500],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
                
//                 return ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final store = snapshot.data!.docs[index];
//                     final storeData = store.data() as Map<String, dynamic>;
                    
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 1,
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: ListTile(
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 8),
//                         leading: Container(
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: accentColor.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: const Icon(
//                             Icons.store,
//                             color: primaryColor,
//                             size: 26,
//                           ),
//                         ),
//                         title: Text(
//                           storeData['name'] ?? 'No Name',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox(height: 4),
//                             Text(
//                               storeData['address'] ?? 'No Address',
//                               style: TextStyle(
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               children: [
//                                 // Display star ratings - fixed at 4 stars
//                                 ...List.generate(5, (i) {
//                                   return Icon(
//                                     Icons.star,
//                                     size: 14,
//                                     color: i < 4 // Always show 4 stars
//                                         ? const Color(0xFFFFB900)
//                                         : Colors.grey[300],
//                                   );
//                                 }),
//                                 const SizedBox(width: 4),
//                                 const Text(
//                                   '4.0', // Fixed rating
//                                   style: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 6, vertical: 2),
//                                   decoration: BoxDecoration(
//                                     color: Colors.green[100], // Always open
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: const Text(
//                                     'Open Now', // Always open
//                                     style: TextStyle(
//                                       color: Color.fromARGB(255, 48, 205, 55),
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         trailing: Container(
//                           decoration: BoxDecoration(
//                             color: primaryColor.withOpacity(0.1),
//                             shape: BoxShape.circle,
//                           ),
//                           child: IconButton(
//                             icon: const Icon(
//                               Icons.arrow_forward_ios,
//                               color: primaryColor,
//                               size: 16,
//                             ),
//                             onPressed: () {
//                               // Navigate to Thrift Store Details Screen
//                                Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ThriftStoreDetailsPage(storeData: storeData,
//                                    documentId: storeData['id'] ?? storeSnapshot.id,),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: primaryColor,
//         child: const Icon(Icons.map_outlined),
//         onPressed: () {
//           // Show stores on map
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: const Color.fromARGB(255, 24, 62, 25),
//         unselectedItemColor: Colors.grey,
//         currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
          
//           if (index == 1) { // Clothes
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const ThriftStoreListings()),
//             );
//           } else if (index == 2) { // Books
//             // Navigate to books page
//           } else if (index == 3) { // My Items
//             // Navigate to my items page
//           }
//         },
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
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mpl_lab/pages/thriftstore_details.dart';

class ThriftStoreListings extends StatefulWidget {
  const ThriftStoreListings({super.key});

  @override
  State<ThriftStoreListings> createState() => _ThriftStoreListingsState();
}

class _ThriftStoreListingsState extends State<ThriftStoreListings> {
  static const Color primaryColor = Color.fromARGB(255, 24, 62, 25);
  static const Color secondaryColor = Color.fromARGB(255, 233, 237, 231);
  static const Color accentColor = Color.fromARGB(255, 76, 115, 77);
  
  int _selectedIndex = 0;
  String _searchText = '';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Filter stores based on search text
  void _runFilter(String enteredKeyword) {
    setState(() {
      _searchText = enteredKeyword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thrift Stores',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Filter functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Favorites functionality
            },
          ),
        ],
      ),
      backgroundColor: secondaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar section with curved design
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 30),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                hintText: 'Search for thrift stores by name...',
                prefixIcon: const Icon(Icons.search, color: accentColor),
                suffixIcon: _searchText.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: accentColor),
                        onPressed: () {
                          setState(() {
                            _searchText = '';
                            FocusScope.of(context).unfocus();
                          });
                        },
                      )
                    : const Icon(Icons.mic, color: accentColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: _searchText.isEmpty
                          ? _firestore.collection('thriftstore').snapshots()
                          : _firestore.collection('thriftstore')
                              .where('name', isGreaterThanOrEqualTo: _searchText)
                              .where('name', isLessThan: _searchText + 'z')
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text(
                            'Loading...',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          );
                        }
                        return Text(
                          _searchText.isEmpty
                              ? 'Nearby Thrift Stores'
                              : '${snapshot.data!.docs.length} Results Found',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        );
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.sort, size: 16, color: accentColor),
                      label: const Text(
                        'Sort',
                        style: TextStyle(color: accentColor),
                      ),
                      onPressed: () {
                        // Sort functionality
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          
          // Store listings from Firestore
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _searchText.isEmpty
                  ? _firestore.collection('thriftstore').snapshots()
                  : _firestore.collection('thriftstore')
                      .where('name', isGreaterThanOrEqualTo: _searchText)
                      .where('name', isLessThan: _searchText + 'z')
                      .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 60,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No thrift stores found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _searchText.isEmpty
                              ? 'No stores available'
                              : 'Try a different search term',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final storeDoc = snapshot.data!.docs[index];
                    final storeData = storeDoc.data() as Map<String, dynamic>;
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.store,
                            color: primaryColor,
                            size: 26,
                          ),
                        ),
                        title: Text(
                          storeData['name'] ?? 'No Name',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Text(
                              storeData['address'] ?? 'No Address',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                // Display star ratings - fixed at 4 stars
                                ...List.generate(5, (i) {
                                  return Icon(
                                    Icons.star,
                                    size: 14,
                                    color: i < 4 // Always show 4 stars
                                        ? const Color(0xFFFFB900)
                                        : Colors.grey[300],
                                  );
                                }),
                                const SizedBox(width: 4),
                                const Text(
                                  '4.0', // Fixed rating
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.green[100], // Always open
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'Open Now', // Always open
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 48, 205, 55),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: primaryColor,
                              size: 16,
                            ),
                            onPressed: () {
                              // Navigate to Thrift Store Details Screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ThriftStoreDetailsPage(
                                    storeData: storeData,
                                    documentId: storeDoc.id, // Using the Firestore document ID
                                  ),
                                ),
                              );
                            },
                          ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Icon(Icons.map_outlined),
        onPressed: () {
          // Show stores on map
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 24, 62, 25),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          
          if (index == 1) { // Clothes
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ThriftStoreListings()),
            );
          } else if (index == 2) { // Books
            // Navigate to books page
          } else if (index == 3) { // My Items
            // Navigate to my items page
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checkroom),
            label: 'Clothes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'My Items',
          ),
        ],
      ),
    );
  }
}