import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../data.dart';

class Media extends StatefulWidget {
  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
  List<ChatMessage> messages = media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media example'),
      ),
      body: DashChat(
        currentUser: user,
        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });
        },
        messages: messages + headerMessage,
        inputOptions: const InputOptions(
          inputToolbarStyle: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black12),
            ),
          ),
          leading: [Icon(Icons.link)],
          alwaysShowSend: true,
          inputDecoration: InputDecoration(
            isDense: true,
            //hintText: ,
            // hintStyle: const TextStyle(color: Colors.grey),
            // filled: true,
            // fillColor: Colors.grey[100],
            contentPadding: EdgeInsets.only(
              left: 18,
              top: 10,
              bottom: 10,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
        messageListOptions: MessageListOptions(
          dateSeparatorFormat: intl.DateFormat('dd MMMM', 'ru'),
        ),
      ),
    );
  }
}
