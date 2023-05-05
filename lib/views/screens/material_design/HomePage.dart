import 'package:flutter/material.dart';
import 'package:platform_converter_app/controllers/providers/add_chat_provider.dart';
import 'package:platform_converter_app/controllers/providers/app_provider.dart';
import 'package:platform_converter_app/views/components/AddChat.dart';
import 'package:platform_converter_app/views/components/CallsPage.dart';
import 'package:platform_converter_app/views/components/ChatPage.dart';
import 'package:platform_converter_app/views/components/SettingsPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Platform Converter"),
            actions: [
              Switch(
                value: Provider.of<AppProvider>(context).appModel.isIos,
                onChanged: (val) {
                  Provider.of<AppProvider>(context, listen: false).switchUi();
                },
              ),
            ],
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              onTap: (val) {
                Provider.of<AddChatProvider>(context, listen: false)
                    .clearValues();
              },
              tabs: const [
                Icon(Icons.person_add_alt),
                Text("CHATS"),
                Text("CALLS"),
                Text("SETTINGS"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              AddChat(),
              ChatPage(),
              CallsPage(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
