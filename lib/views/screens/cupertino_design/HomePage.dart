import 'package:flutter/cupertino.dart';
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          onTap: (val) {
            Provider.of<AddChatProvider>(context, listen: false).clearValues();
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: "CHATS",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
              label: "CALLS",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: "SETTINGS",
            ),
          ],
        ),
        tabBuilder: (context, i) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: const Text("Platform Converter"),
                  trailing: CupertinoSwitch(
                    value: Provider.of<AppProvider>(context).appModel.isIos,
                    onChanged: (val) {
                      Provider.of<AppProvider>(context, listen: false)
                          .switchUi();
                    },
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      IndexedStack(
                        index: i,
                        children: const [
                          AddChat(),
                          ChatPage(),
                          CallsPage(),
                          SettingsPage(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
