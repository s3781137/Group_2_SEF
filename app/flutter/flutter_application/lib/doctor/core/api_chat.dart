import 'dart:convert';

import 'package:flutter_application/doctor/model/chatModel.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

//
class chatApiClient {
  // Return an instance of PatientModel
  Future<chatModel> getChats(int senderID, int recipientID) async {
    print("Sender ID: " +
        senderID.toString() +
        ". Recipient ID: " +
        recipientID.toString());
    Response response = await http.get(
        Uri.parse(
            'http://localhost:8089/chat/findMessages?senderId=$senderID&recipientId=$recipientID'),
        headers: <String, String>{"Content-Type": "application/json"});
    print(response.body);
    if (response.statusCode == 200) {
      return chatModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load chats');
    }
  }
  /*
  Future<chatModel> postChat(Int senderID, Int recipientID, String senderName,
      String recipientName) async {
    Response response = await http.get(Uri.parse(
        'http://localhost:8089/chat/findMessages?senderId=${senderID}&recipientId=${recipientID}'));
    if (response.statusCode == 200) {
      return chatModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load chats');
    }
  }
  */
}
