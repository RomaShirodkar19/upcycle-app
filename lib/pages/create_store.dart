import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_page.dart'; // Ensure this import points to the correct file

class CreateStorePage extends StatefulWidget {
  final String ownerId;
  const CreateStorePage({required this.ownerId, super.key});

  @override
  _CreateStorePageState createState() => _CreateStorePageState();
}

class _CreateStorePageState extends State<CreateStorePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _acceptedProductsController = TextEditingController();
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  Future<void> _submitStore() async {
    if (_nameController.text.isEmpty || 
        _imageUrlController.text.isEmpty || 
        _addressController.text.isEmpty || 
        _descriptionController.text.isEmpty ||
        _acceptedProductsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields'))
      );
      return;
    }

    setState(() => isLoading = true);
    
    await _firestore.collection('thriftstore').doc(widget.ownerId).set({
      'ownerId': widget.ownerId,
      'name': _nameController.text,
      'imageUrl': _imageUrlController.text,
      'address': _addressController.text,
      'description': _descriptionController.text,
      'acceptedProducts': _acceptedProductsController.text,
    });

    setState(() => isLoading = false);
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Store added successfully'))
    );

    // Navigate to Profile Page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 226, 199),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 24, 62, 25),
        title: const Text('Create Thrift Store', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Store Name',
                labelStyle: TextStyle(color: Color.fromARGB(255, 24, 62, 25)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 24, 62, 25)),
                ),
              ),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                labelText: 'Image URL',
                labelStyle: TextStyle(color: Color.fromARGB(255, 24, 62, 25)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 24, 62, 25)),
                ),
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Store Address',
                labelStyle: TextStyle(color: Color.fromARGB(255, 24, 62, 25)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 24, 62, 25)),
                ),
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Store Description',
                labelStyle: TextStyle(color: Color.fromARGB(255, 24, 62, 25)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 24, 62, 25)),
                ),
              ),
            ),
            TextField(
              controller: _acceptedProductsController,
              decoration: InputDecoration(
                labelText: 'Accepted Products',
                labelStyle: TextStyle(color: Color.fromARGB(255, 24, 62, 25)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 24, 62, 25)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            isLoading 
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 24, 62, 25),
                    ),
                    onPressed: _submitStore,
                    child: const Text('Submit', style: TextStyle(color: Colors.white)),
                  ),
            const SizedBox(height: 20),
            _imageUrlController.text.isNotEmpty
                ? Image.network(_imageUrlController.text, height: 150, width: 150, fit: BoxFit.cover)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
