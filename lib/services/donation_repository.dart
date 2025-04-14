import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class DonationRepository {
  final String storeId;

  DonationRepository(this.storeId);

  Future<List<Map<String, dynamic>>> loadRequests() async {
    try {
      final jsonString = await rootBundle.loadString('assets/data/donation_requests.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      
      return jsonData
          .cast<Map<String, dynamic>>()
          .where((request) => request['thriftStoreId'] == storeId)
          .toList();
    } catch (e) {
      debugPrint('Error loading JSON: $e');
      return [];
    }
  }

  Future<void> updateStatus(String id, String status) async {
    // In a real app, you might save this back to JSON
    debugPrint('Updating request $id to $status');
  }
}