// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController searchController = TextEditingController();
  
//   // Mock data for thrift stores
//   final List<Map<String, dynamic>> thriftStores = [
//     {
//       'name': 'Goodwill Boutique',
//       'distance': '0.8',
//       'rating': 4.5,
//       'image': 'lib/images/store1.png',
//       'address': '123 Main St, Anytown',
//       'isOpen': true,
//     },
//     {
//       'name': 'Second Chance Treasures',
//       'distance': '1.2',
//       'rating': 4.2,
//       'image': 'lib/images/store2.png',
//       'address': '456 Oak Ave, Anytown',
//       'isOpen': true,
//     },
//     {
//       'name': 'Vintage Finds',
//       'distance': '1.5',
//       'rating': 4.7,
//       'image': 'lib/images/store3.png',
//       'address': '789 Elm St, Anytown',
//       'isOpen': false,
//     },
//     {
//       'name': 'Charity Shop',
//       'distance': '2.3',
//       'rating': 3.9,
//       'image': 'lib/images/store4.png',
//       'address': '101 Pine Rd, Anytown',
//       'isOpen': true,
//     },
//     {
//       'name': 'Reuse Collective',
//       'distance': '2.7',
//       'rating': 4.3,
//       'image': 'lib/images/store5.png',
//       'address': '202 Cedar Ln, Anytown',
//       'isOpen': true,
//     },
//   ];

//   // Mock data for donated school books
//   final List<Map<String, dynamic>> donatedBooks = [
//     {
//       'title': 'Calculus for Beginners',
//       'subject': 'Mathematics',
//       'grade': 'College',
//       'donor': 'Michael S.',
//       'distance': '0.5',
//       'image': 'lib/images/book1.png',
//       'condition': 'Like New',
//     },
//     {
//       'title': 'Biology Textbook 10th Edition',
//       'subject': 'Science',
//       'grade': 'High School',
//       'donor': 'Sarah P.',
//       'distance': '1.2',
//       'image': 'lib/images/book2.png',
//       'condition': 'Good',
//     },
//     {
//       'title': 'Introduction to Literature',
//       'subject': 'English',
//       'grade': 'High School',
//       'donor': 'John D.',
//       'distance': '0.8',
//       'image': 'lib/images/book3.png',
//       'condition': 'Fair',
//     },
//     {
//       'title': 'World History: Modern Era',
//       'subject': 'History',
//       'grade': 'Middle School',
//       'donor': 'Emma K.',
//       'distance': '1.5',
//       'image': 'lib/images/book4.png',
//       'condition': 'Good',
//     },
//   ];

//   List<Map<String, dynamic>> filteredStores = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredStores = thriftStores;
//   }

//   void _filterStores(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         filteredStores = thriftStores;
//       } else {
//         filteredStores = thriftStores
//             .where((store) => store['name'].toLowerCase().contains(query.toLowerCase()) ||
//                    store['address'].toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EED7),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF6B4226),
//         elevation: 0,
//         title: const Text(
//           'UpCycle',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_outlined, color: Colors.white),
//             onPressed: () {
//               // Handle notifications
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.person_outline, color: Colors.white),
//             onPressed: () {
//               // Handle profile
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search and filter section
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: const BoxDecoration(
//                 color: Color(0xFF6B4226),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Location and refresh
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.location_on,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         'Current Location',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.9),
//                           fontSize: 14,
//                         ),
//                       ),
//                       const Icon(
//                         Icons.keyboard_arrow_down,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                       const Spacer(),
//                       InkWell(
//                         onTap: () {
//                           // Refresh location
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: const Icon(
//                             Icons.refresh,
//                             color: Colors.white,
//                             size: 18,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 16),
                  
//                   // Search bar
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 8,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       controller: searchController,
//                       onChanged: _filterStores,
//                       decoration: InputDecoration(
//                         hintText: 'Search thrift stores or donations',
//                         hintStyle: TextStyle(color: Colors.grey[400]),
//                         prefixIcon: const Icon(Icons.search, color: Color(0xFF6B4226)),
//                         border: InputBorder.none,
//                         contentPadding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                     ),
//                   ),
                  
//                   const SizedBox(height: 16),
                  
//                   // Filter options
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildFilterChip(label: 'Open Now', icon: Icons.access_time),
//                       _buildFilterChip(label: 'Top Rated', icon: Icons.star_outline),
//                       _buildFilterChip(label: 'Distance', icon: Icons.near_me_outlined),
//                       _buildFilterChip(label: 'More Filters', icon: Icons.tune),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
            
//             // Donated Books Section
//             Padding(
//               padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Recently Donated School Books',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF6B4226),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Navigate to all donations page
//                     },
//                     child: const Text(
//                       'See All',
//                       style: TextStyle(
//                         color: Color(0xFF6B4226),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             // Horizontal scrolling book donations
//             SizedBox(
//               height: 210,
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: donatedBooks.length,
//                 itemBuilder: (context, index) {
//                   final book = donatedBooks[index];
//                   return _buildBookCard(book);
//                 },
//               ),
//             ),

//             // "Donate a Book" button
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Navigate to donation form
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF6B4226),
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.book),
//                     SizedBox(width: 8),
//                     Text(
//                       'Donate a Book',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
            
//             // Thrift stores count
//             Padding(
//               padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '${filteredStores.length} Thrift Stores Nearby',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF6B4226),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       const Text(
//                         'Sort By: ',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       const Text(
//                         'Distance',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF6B4226),
//                         ),
//                       ),
//                       const Icon(
//                         Icons.keyboard_arrow_down,
//                         color: Color(0xFF6B4226),
//                         size: 18,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
            
//             // List of thrift stores
//             ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               itemCount: filteredStores.length > 3 ? 3 : filteredStores.length, // Show only top 3 stores
//               itemBuilder: (context, index) {
//                 final store = filteredStores[index];
//                 return _buildStoreCard(store);
//               },
//             ),
            
//             // View all stores button
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: OutlinedButton(
//                 onPressed: () {
//                   // Navigate to all stores
//                 },
//                 style: OutlinedButton.styleFrom(
//                   foregroundColor: const Color(0xFF6B4226),
//                   side: const BorderSide(color: Color(0xFF6B4226)),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   minimumSize: const Size(double.infinity, 50),
//                 ),
//                 child: const Text(
//                   'View All Thrift Stores',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: const Color(0xFF6B4226),
//         unselectedItemColor: Colors.grey,
//         currentIndex: 0,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.explore),
//             label: 'Explore',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_outline),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_bag_outlined),
//             label: 'My Items',
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Open donation options
//           _showDonationOptions(context);
//         },
//         backgroundColor: const Color(0xFF6B4226),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   void _showDonationOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'Donate Items',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF6B4226),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ListTile(
//                 leading: const CircleAvatar(
//                   backgroundColor: Color(0xFF6B4226),
//                   child: Icon(Icons.book, color: Colors.white),
//                 ),
//                 title: const Text('Donate School Books'),
//                 subtitle: const Text('Help students access educational materials'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   // Navigate to school book donation form
//                 },
//               ),
//               ListTile(
//                 leading: const CircleAvatar(
//                   backgroundColor: Color(0xFF6B4226),
//                   child: Icon(Icons.checkroom, color: Colors.white),
//                 ),
//                 title: const Text('Donate Clothing'),
//                 subtitle: const Text('Share pre-loved fashion items'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   // Navigate to clothing donation form
//                 },
//               ),
//               ListTile(
//                 leading: const CircleAvatar(
//                   backgroundColor: Color(0xFF6B4226),
//                   child: Icon(Icons.devices, color: Colors.white),
//                 ),
//                 title: const Text('Donate Electronics'),
//                 subtitle: const Text('Give a second life to your devices'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   // Navigate to electronics donation form
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildFilterChip({required String label, required IconData icon}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             color: Colors.white,
//             size: 16,
//           ),
//           const SizedBox(width: 4),
//           Text(
//             label,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBookCard(Map<String, dynamic> book) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.only(right: 12, bottom: 4, top: 4),
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
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Book image
//           Container(
//             height: 100,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//               image: DecorationImage(
//                 image: AssetImage(book['image']),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             alignment: Alignment.topRight,
//             child: Container(
//               margin: const EdgeInsets.all(8),
//               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: Text(
//                 book['condition'],
//                 style: const TextStyle(
//                   color: Color(0xFF6B4226),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 10,
//                 ),
//               ),
//             ),
//           ),
          
//           // Book details
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   book['title'],
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     color: Color(0xFF6B4226),
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
                
//                 const SizedBox(height: 4),
                
//                 Text(
//                   '${book['subject']} • ${book['grade']}',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 12,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
                
//                 const SizedBox(height: 8),
                
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.person,
//                           color: Colors.grey,
//                           size: 14,
//                         ),
//                         const SizedBox(width: 2),
//                         Text(
//                           book['donor'],
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.near_me,
//                           color: Color(0xFF6B4226),
//                           size: 14,
//                         ),
//                         const SizedBox(width: 2),
//                         Text(
//                           '${book['distance']} mi',
//                           style: const TextStyle(
//                             color: Color(0xFF6B4226),
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStoreCard(Map<String, dynamic> store) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
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
//       child: Column(
//         children: [
//           // Store image
//           Container(
//             height: 160,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//               image: DecorationImage(
//                 image: AssetImage(store['image']),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             alignment: Alignment.topRight,
//             child: Container(
//               margin: const EdgeInsets.all(12),
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(
//                     Icons.directions_walk,
//                     color: Color(0xFF6B4226),
//                     size: 16,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     '${store['distance']} mi',
//                     style: const TextStyle(
//                       color: Color(0xFF6B4226),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
          
//           // Store details
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         store['name'],
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           color: Color(0xFF6B4226),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                           size: 18,
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           '${store['rating']}',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
                
//                 const SizedBox(height: 8),
                
//                 // Address
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.location_on,
//                       color: Colors.grey,
//                       size: 16,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       store['address'],
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
                
//                 const SizedBox(height: 8),
                
//                 // Status and buttons
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: store['isOpen']
//                             ? Colors.green.withOpacity(0.1)
//                             : Colors.red.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: Text(
//                         store['isOpen'] ? 'Open Now' : 'Closed',
//                         style: TextStyle(
//                           color: store['isOpen'] ? Colors.green : Colors.red,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     OutlinedButton(
//                       onPressed: () {
//                         // Handle save
//                       },
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: const Color(0xFF6B4226),
//                         side: const BorderSide(color: Color(0xFF6B4226)),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                       ),
//                       child: const Text('Save'),
//                     ),
//                     const SizedBox(width: 8),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Handle directions
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF6B4226),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                       ),
//                       child: const Text('Directions'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:mpl_lab/pages/book_donation_listing_page.dart';
import 'package:mpl_lab/pages/my_items_page.dart';
import 'package:mpl_lab/pages/profile_page.dart';
import 'package:mpl_lab/pages/thriftstore_details.dart';
import 'package:mpl_lab/pages/thriftstore_listings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
   int _selectedIndex = 0;

  // Mock data for thrift stores
  final List<Map<String, dynamic>> thriftStores = [
    {
      'name': 'Goodwill Boutique',
      'distance': '0.8',
      'rating': 4.5,
      'image': 'lib/images/store1.png',
      'address': '123 Main St, Anytown',
      'isOpen': true,
    },
    {
      'name': 'Second Chance Treasures',
      'distance': '1.2',
      'rating': 4.2,
      'image': 'lib/images/store2.png',
      'address': '456 Oak Ave, Anytown',
      'isOpen': true,
    },
    {
      'name': 'Vintage Finds',
      'distance': '1.5',
      'rating': 4.7,
      'image': 'lib/images/store3.png',
      'address': '789 Elm St, Anytown',
      'isOpen': false,
    },
  ];

  // Mock data for donated school books
  final List<Map<String, dynamic>> donatedBooks = [
    {
      'title': 'Calculus for Beginners',
      'subject': 'Mathematics',
      'grade': 'College',
      'donor': 'Michael S.',
      'distance': '0.5',
      'image': 'lib/images/book1.png',
      'condition': 'Like New',
    },
    {
      'title': 'Biology Textbook 10th Edition',
      'subject': 'Science',
      'grade': 'High School',
      'donor': 'Sarah P.',
      'distance': '1.2',
      'image': 'lib/images/book2.png',
      'condition': 'Good',
    },
  ];

  List<Map<String, dynamic>> filteredStores = [];

  @override
  void initState() {
    super.initState();
    filteredStores = thriftStores;
  }

  void _filterStores(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredStores = thriftStores;
      } else {
        filteredStores = thriftStores
            .where((store) => store['name'].toLowerCase().contains(query.toLowerCase()) ||
                   store['address'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EED7),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 62, 25),
        elevation: 0,
        title: const Text(
          'UpCycle',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
            actions: [
        // Add profile icon button here
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: () {
            // Navigate to the profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 24, 62, 25),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location and refresh
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Current Location',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 18,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          // Refresh location
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Search bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: _filterStores,
                      decoration: InputDecoration(
                        hintText: 'Search thrift stores or donations',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 24, 62, 25)),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Thrift stores count
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Text(
                '${filteredStores.length} Thrift Stores Nearby',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 62, 25),
                ),
              ),
            ),
            
            // List of thrift stores
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: filteredStores.length > 3 ? 3 : filteredStores.length, // Show only top 3 stores
              itemBuilder: (context, index) {
                final store = filteredStores[index];
                return _buildStoreCard(store);
              },
            ),
            
            // View all stores button
            Padding(
              padding: const EdgeInsets.all(16),
              child: OutlinedButton(
                onPressed: () {
                  // Navigate to all stores
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThriftStoreListings()),
                   );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 24, 62, 25),
                  side: const BorderSide(color: Color.fromARGB(255, 24, 62, 25)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'View All Thrift Stores',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            // Donated Books Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recently Donated School Books',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 24, 62, 25),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to all donations page
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 24, 62, 25),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Horizontal scrolling book donations
            SizedBox(
              height: 210,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: donatedBooks.length,
                itemBuilder: (context, index) {
                  final book = donatedBooks[index];
                  return _buildBookCard(book);
                },
              ),
            ),

            // "Donate a Book" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to donation form

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 24, 62, 25),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book),
                    SizedBox(width: 8),
                    Text(
                      'Donate a Book',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
        
        // Navigation logic based on index
        if (index == 1) { // Clothes
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ThriftStoreListings()),
          );
        } else if (index == 2) { // Books
          // Navigate to books page 
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookDonationListingPage()),
            );
        } else if (index == 3) { // My Items
          // Navigate to my items page
          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyItemsPage()),
      );
        }
        // Index 0 is Home, so no navigation needed
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open donation options
          _showDonationOptions(context);
        },
        backgroundColor: const Color.fromARGB(255, 24, 62, 25),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDonationOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Donate Items',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 62, 25),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 24, 62, 25),
                  child: Icon(Icons.book, color: Colors.white),
                ),
                title: const Text('Donate School Books'),
                subtitle: const Text('Help students access educational materials'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to school book donation form
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 24, 62, 25),
                  child: Icon(Icons.checkroom, color: Colors.white),
                ),
                title: const Text('Donate Clothing'),
                subtitle: const Text('Share pre-loved fashion items'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to clothing donation form
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 24, 62, 25),
                  child: Icon(Icons.devices, color: Colors.white),
                ),
                title: const Text('Donate Electronics'),
                subtitle: const Text('Give a second life to your devices'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to electronics donation form
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBookCard(Map<String, dynamic> book) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12, bottom: 4, top: 4),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book image
          Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(book['image']),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                book['condition'],
                style: const TextStyle(
                  color: Color.fromARGB(255, 24, 62, 25),
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                ),
              ),
            ),
          ),
          
          // Book details
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color.fromARGB(255, 24, 62, 25),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 3),
                
                Text(
                  '${book['subject']} • ${book['grade']}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 6),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 12,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          book['donor'],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.near_me,
                          color: Color.fromARGB(255, 24, 62, 25),
                          size: 12,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${book['distance']} mi',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 24, 62, 25),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreCard(Map<String, dynamic> store) {

      return GestureDetector(
    onDoubleTap: () {
      // Navigate to the thrift store details page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ThriftStoreDetails(),
      //   ),
      // );
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Column(
        children: [
          // Store image
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(store['image']),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.directions_walk,
                    color: Color.fromARGB(255, 24, 62, 25),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${store['distance']} mi',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 24, 62, 25),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Store details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        store['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromARGB(255, 24, 62, 25),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${store['rating']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Address
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      store['address'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // Status and buttons
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: store['isOpen']
                            ? Colors.green.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        store['isOpen'] ? 'Open Now' : 'Closed',
                        style: TextStyle(
                          color: store['isOpen'] ? Colors.green : Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    // OutlinedButton(
                    //   onPressed: () {
                    //     // Handle save
                    //   },
                    //   style: OutlinedButton.styleFrom(
                    //     foregroundColor: const Color.fromARGB(255, 24, 62, 25),
                    //     side: const BorderSide(color: Color.fromARGB(255, 24, 62, 25)),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     padding: const EdgeInsets.symmetric(horizontal: 12),
                    //   ),
                    //   child: const Text('Save'),
                    // ),
                    const SizedBox(width: 8),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Handle directions
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: const Color.fromARGB(255, 24, 62, 25),
                    //     foregroundColor: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     padding: const EdgeInsets.symmetric(horizontal: 12),
                    //   ),
                    //   child: const Text('Directions'),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
    //return Container(
    //   margin: const EdgeInsets.only(bottom: 16),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(12),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black.withOpacity(0.05),
    //         blurRadius: 8,
    //         offset: const Offset(0, 2),
    //       ),
    //     ],
    //   ),
    //   child: Column(
    //     children: [
    //       // Store image
    //       Container(
    //         height: 160,
    //         decoration: BoxDecoration(
    //           borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
    //           image: DecorationImage(
    //             image: AssetImage(store['image']),
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         alignment: Alignment.topRight,
    //         child: Container(
    //           margin: const EdgeInsets.all(12),
    //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(8),
    //           ),
    //           child: Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               const Icon(
    //                 Icons.directions_walk,
    //                 color: Color.fromARGB(255, 24, 62, 25),
    //                 size: 16,
    //               ),
    //               const SizedBox(width: 4),
    //               Text(
    //                 '${store['distance']} mi',
    //                 style: const TextStyle(
    //                   color: Color.fromARGB(255, 24, 62, 25),
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 12,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
          
    //       // Store details
    //       Padding(
    //         padding: const EdgeInsets.all(12),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Expanded(
    //                   child: Text(
    //                     store['name'],
    //                     style: const TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18,
    //                       color: Color.fromARGB(255, 24, 62, 25),
    //                     ),
    //                   ),
    //                 ),
    //                 Row(
    //                   children: [
    //                     const Icon(
    //                       Icons.star,
    //                       color: Colors.amber,
    //                       size: 18,
    //                     ),
    //                     const SizedBox(width: 4),
    //                     Text(
    //                       '${store['rating']}',
    //                       style: const TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 14,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
                
    //             const SizedBox(height: 8),
                
    //             // Address
    //             Row(
    //               children: [
    //                 const Icon(
    //                   Icons.location_on,
    //                   color: Colors.grey,
    //                   size: 16,
    //                 ),
    //                 const SizedBox(width: 4),
    //                 Text(
    //                   store['address'],
    //                   style: TextStyle(
    //                     color: Colors.grey[600],
    //                     fontSize: 14,
    //                   ),
    //                 ),
    //               ],
    //             ),
                
    //             const SizedBox(height: 8),
                
    //             // Status and buttons
    //             Row(
    //               children: [
    //                 Container(
    //                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    //                   decoration: BoxDecoration(
    //                     color: store['isOpen']
    //                         ? Colors.green.withOpacity(0.1)
    //                         : Colors.red.withOpacity(0.1),
    //                     borderRadius: BorderRadius.circular(4),
    //                   ),
    //                   child: Text(
    //                     store['isOpen'] ? 'Open Now' : 'Closed',
    //                     style: TextStyle(
    //                       color: store['isOpen'] ? Colors.green : Colors.red,
    //                       fontSize: 12,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //                 const Spacer(),
    //                 OutlinedButton(
    //                   onPressed: () {
    //                     // Handle save
    //                   },
    //                   style: OutlinedButton.styleFrom(
    //                     foregroundColor: const Color.fromARGB(255, 24, 62, 25),
    //                     side: const BorderSide(color: Color.fromARGB(255, 24, 62, 25)),
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(8),
    //                     ),
    //                     padding: const EdgeInsets.symmetric(horizontal: 12),
    //                   ),
    //                   child: const Text('Save'),
    //                 ),
    //                 const SizedBox(width: 8),
    //                 ElevatedButton(
    //                   onPressed: () {
    //                     // Handle directions
    //                   },
    //                   style: ElevatedButton.styleFrom(
    //                     backgroundColor: const Color.fromARGB(255, 24, 62, 25),
    //                     foregroundColor: Colors.white,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(8),
    //                     ),
    //                     padding: const EdgeInsets.symmetric(horizontal: 12),
    //                   ),
    //                   child: const Text('Directions'),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}