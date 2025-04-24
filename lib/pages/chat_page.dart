import 'package:chatapp/components/chat_bubble.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});
  //text controller
  final TextEditingController _messgaeController = TextEditingController();

  // chat & auth Services
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  //send message
  void sendMessage() async {
    if (_messgaeController.text.isNotEmpty) {
      await _chatServices.sendMessage(receiverID, _messgaeController.text);
      _messgaeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatServices.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading..");
          }

          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderId'] == _authService.getCurrentUser()!.uid;

    var alignement =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignement,
      child: Column(
        crossAxisAlignment: isCurrentUser? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(message: data["message"], isCurrentUser: isCurrentUser)
        ],
      ));
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
              child: MyTextfield(
                  hintText: "Type a message",
                  obscurText: false,
                  controllerText: _messgaeController)),
          Container(
            decoration: BoxDecoration(color: Colors.green,shape: BoxShape.circle),
            margin: EdgeInsets.only(right:25 ),
            child: IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward,color: Colors.white,)))
        ],
      ),
    );
  }
}
