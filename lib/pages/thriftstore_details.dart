// import 'package:flutter/material.dart';
// import 'package:mpl_lab/pages/donation_form.dart';

// class ThriftStoreDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> storeData;

//   const ThriftStoreDetailsPage({super.key, required this.storeData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(storeData['name'] ?? 'Store Details'),
//         backgroundColor: const Color.fromARGB(255, 24, 62, 25),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Hero image section
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(storeData['imageUrl'] ?? 'https://via.placeholder.com/400x250?text=Thrift+Store'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
            
//             // Store info section
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Store name and rating
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         storeData['name'] ?? 'Thrift Store',
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.green[100],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           children: [
//                             const Icon(Icons.star, color: Colors.amber, size: 16),
//                             const SizedBox(width: 4),
//                             Text(
//                               (storeData['rating'] ?? 4.0).toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 8),
                  
//                   // Address
//                   Row(
//                     children: [
//                       const Icon(Icons.location_on, color: Colors.grey, size: 16),
//                       const SizedBox(width: 4),
//                       Text(
//                         storeData['address'] ?? 'No address provided',
//                         style: TextStyle(color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 20),
                  
//                   // Open status and hours
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                             color: Colors.green[100],
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(Icons.access_time, size: 16, color: Colors.green),
//                         ),
//                         const SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               storeData['isOpen'] ?? true ? 'Open Now' : 'Closed',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Text(
//                               storeData['hours'] ?? 'Mon-Fri: 9AM-6PM\nSat-Sun: 10AM-5PM',
//                               style: TextStyle(color: Colors.grey[700]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
                  
//                   const SizedBox(height: 20),
                  
//                   // About section
//                   const Text(
//                     'About',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     storeData['description'] ?? 
//                     'We accept donations of clothing, furniture, books, and household items. '
//                     'Your donations help support our community programs and initiatives.',
//                     style: TextStyle(fontSize: 16, height: 1.5),
//                   ),
                  
//                   const SizedBox(height: 20),
                  
//                   // Contact section
//                   const Text(
//                     'Contact',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.phone, color: Colors.grey),
//                       const SizedBox(width: 8),
//                       Text(
//                         storeData['phone'] ?? '(123) 456-7890',
//                         style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.email, color: Colors.grey),
//                       const SizedBox(width: 8),
//                       Text(
//                         storeData['email'] ?? 'contact@thriftstore.com',
//                         style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 30),
                  
//                   // Donate button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Donate functionality
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => DonationFormPage(thriftStoreId: '',)),
//                         );

//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         backgroundColor: Colors.green,
//                         foregroundColor: Colors.white,
//                       ),
//                       child: const Text('Donate Items', style: TextStyle(fontSize: 16)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:mpl_lab/pages/donation_form.dart';

// class ThriftStoreDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> storeData;

//   const ThriftStoreDetailsPage({super.key, required this.storeData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(storeData['name'] ?? 'Store Details'),
//         backgroundColor: const Color.fromARGB(255, 24, 62, 25),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Hero image section
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(storeData['imageUrl'] ?? 'https://via.placeholder.com/400x250?text=Thrift+Store'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
            
//             // Store info section
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Store name and rating
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         storeData['name'] ?? 'Thrift Store',
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.green[100],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           children: [
//                             const Icon(Icons.star, color: Colors.amber, size: 16),
//                             const SizedBox(width: 4),
//                             Text(
//                               (storeData['rating'] ?? 4.0).toString(),
//                               style: const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 8),
                  
//                   // Address
//                   Row(
//                     children: [
//                       const Icon(Icons.location_on, color: Colors.grey, size: 16),
//                       const SizedBox(width: 4),
//                       Text(
//                         storeData['address'] ?? 'No address provided',
//                         style: TextStyle(color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 20),
                  
//                   // Open status and hours
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(6),
//                           decoration: BoxDecoration(
//                             color: Colors.green[100],
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(Icons.access_time, size: 16, color: Colors.green),
//                         ),
//                         const SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               storeData['isOpen'] ?? true ? 'Open Now' : 'Closed',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             Text(
//                               storeData['hours'] ?? 'Mon-Fri: 9AM-6PM\nSat-Sun: 10AM-5PM',
//                               style: TextStyle(color: Colors.grey[700]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
                  
//                   const SizedBox(height: 20),
                  
//                   // About section
//                   const Text(
//                     'About',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     storeData['description'] ?? 
//                     'We accept donations of clothing, furniture, books, and household items. '
//                     'Your donations help support our community programs and initiatives.',
//                     style: TextStyle(fontSize: 16, height: 1.5),
//                   ),
                  
//                   const SizedBox(height: 20),
                  
//                   // Contact section
//                   const Text(
//                     'Contact',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.phone, color: Colors.grey),
//                       const SizedBox(width: 8),
//                       Text(
//                         storeData['phone'] ?? '(123) 456-7890',
//                         style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.email, color: Colors.grey),
//                       const SizedBox(width: 8),
//                       Text(
//                         storeData['email'] ?? 'contact@thriftstore.com',
//                         style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
                  
//                   const SizedBox(height: 30),
                  
//                   // Donate button - EDITED SECTION
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DonationFormPage(
//                               thriftStoreId: storeData['id'] ?? storeData['documentId'] ?? '',
//                               // Add this if you included store name in DonationFormPage:
//                               // thriftStoreName: storeData['name'] ?? 'Unknown Store',
//                             ),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         backgroundColor: Colors.green,
//                         foregroundColor: Colors.white,
//                       ),
//                       child: const Text('Donate Items', style: TextStyle(fontSize: 16)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////////////
///

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mpl_lab/pages/donation_form.dart';

class ThriftStoreDetailsPage extends StatelessWidget {
  final String documentId;  // Firestore document ID
  final Map<String, dynamic> storeData;

 const ThriftStoreDetailsPage({
  super.key, 
  required this.documentId, 
  required this.storeData,   // Made required
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storeData['name'] ?? 'Store Details'),
        backgroundColor: const Color.fromARGB(255, 24, 62, 25),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero image section
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(storeData['imageUrl'] ?? 'https://via.placeholder.com/400x250?text=Thrift+Store'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // Store info section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Store name and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        storeData['name'] ?? 'Thrift Store',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              (storeData['rating'] ?? 4.0).toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Address
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        storeData['address'] ?? 'No address provided',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Open status and hours
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.access_time, size: 16, color: Colors.green),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              storeData['isOpen'] ?? true ? 'Open Now' : 'Closed',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              storeData['hours'] ?? 'Mon-Fri: 9AM-6PM\nSat-Sun: 10AM-5PM',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // About section
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    storeData['description'] ?? 
                    'We accept donations of clothing, furniture, books, and household items. '
                    'Your donations help support our community programs and initiatives.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Contact section
                  const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        storeData['phone'] ?? '(123) 456-7890',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.email, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        storeData['email'] ?? 'contact@thriftstore.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Donate button - Now using guaranteed documentId
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DonationFormPage(
                              thriftStoreId: documentId, // Using the guaranteed document ID
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Donate Items', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example of how to use this from a list of stores:
class StoreListItem extends StatelessWidget {
  final DocumentSnapshot storeSnapshot;

  const StoreListItem({super.key, required this.storeSnapshot});

  @override
  Widget build(BuildContext context) {
    final storeData = storeSnapshot.data() as Map<String, dynamic>;
    
    return ListTile(
      leading: Image.network(storeData['imageUrl'] ?? 'https://via.placeholder.com/100?text=Store'),
      title: Text(storeData['name'] ?? 'Thrift Store'),
      subtitle: Text(storeData['address'] ?? 'No address'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThriftStoreDetailsPage(
              documentId: storeSnapshot.id, // Pass the Firestore document ID
              storeData: storeData,
            ),
          ),
        );
      },
    );
  }
}