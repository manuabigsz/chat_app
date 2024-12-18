// import 'dart:math';
// import 'package:chat_app/core/models/chat_notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/messages.dart';
import '../components/new_message.dart';
import '../core/services/auth/auth_service.dart';
import '../core/services/notification/chat_notification_service.dart';
import 'notification_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cod3r Chat'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: const [
                DropdownMenuItem(
                  value: 'logout',
                  child: Row(
                    children: const [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 10),
                      Text('Sair'),
                    ],
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) {
                      return const NotificationPage();
                    }),
                  );
                },
              ),
              Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: Colors.red.shade800,
                  child: Text(
                    '${Provider.of<ChatNotificationService>(context).itemsCount}',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: const [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(
      //       context,
      //       listen: false,
      //     ).add(ChatNotification(
      //       title: 'Mais uma notificação!',
      //       body: Random().nextDouble().toString(),
      //     ));
      //   },
      // ),
    );
  }
}
