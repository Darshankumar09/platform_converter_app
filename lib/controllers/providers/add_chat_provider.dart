import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app/models/add_chat_model.dart';
import 'package:platform_converter_app/models/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddChatProvider extends ChangeNotifier {
  AddChatModel addChatModel;

  AddChatProvider({required this.addChatModel});

  pickImage() async {
    ImagePicker pick = ImagePicker();
    XFile? img = await pick.pickImage(source: ImageSource.camera);

    addChatModel.img = File(img!.path);
    notifyListeners();
  }

  editImage(int index) async {
    ImagePicker pick = ImagePicker();
    XFile? img = await pick.pickImage(source: ImageSource.camera);

    addChatModel.img = File(img!.path);
    notifyListeners();
  }

  pickDate() async {
    if (addChatModel.tempDate != null &&
        addChatModel.tempDate != addChatModel.pickDate) {
      addChatModel.pickDate = addChatModel.tempDate;
    }
    notifyListeners();
  }

  pickTime() async {
    if (addChatModel.tempTime != null &&
        addChatModel.tempTime != addChatModel.pickTime) {
      addChatModel.pickTime = addChatModel.tempTime;
    }
    notifyListeners();
  }

  saveChat() async {
    addChatModel.image.add(addChatModel.img!.path);
    addChatModel.fullName.add(Variables.name.text);
    addChatModel.phoneNumber.add(Variables.phone.text);
    addChatModel.chatConversation.add(Variables.chat.text);
    addChatModel.date.add(
        "${addChatModel.pickDate?.day}/${addChatModel.pickDate?.month}/${addChatModel.pickDate?.year}");
    addChatModel.time
        .add("${addChatModel.pickTime?.hour}:${addChatModel.pickTime?.minute}");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('image', addChatModel.image);
    prefs.setStringList('fullName', addChatModel.fullName);
    prefs.setStringList('phoneNumber', addChatModel.phoneNumber);
    prefs.setStringList('chatConversation', addChatModel.chatConversation);
    prefs.setStringList('date', addChatModel.date);
    prefs.setStringList('time', addChatModel.time);

    addChatModel.img = null;
    Variables.name.clear();
    Variables.phone.clear();
    Variables.chat.clear();
    addChatModel.pickDate = null;
    addChatModel.pickTime = null;

    notifyListeners();
  }

  editChat(int index) async {
    if (addChatModel.img != null) {
      addChatModel.image[index] = addChatModel.img!.path;
    }
    addChatModel.fullName[index] = Variables.editName!;
    addChatModel.phoneNumber[index] = Variables.editPhone!;
    addChatModel.chatConversation[index] = Variables.editChat!;

    if (addChatModel.pickDate != null) {
      addChatModel.date[index] =
          ("${addChatModel.pickDate?.day}/${addChatModel.pickDate?.month}/${addChatModel.pickDate?.year}");
    }

    if (addChatModel.pickTime != null) {
      addChatModel.time[index] =
          ("${addChatModel.pickTime?.hour}:${addChatModel.pickTime?.minute}");
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('image', addChatModel.image);
    prefs.setStringList('fullName', addChatModel.fullName);
    prefs.setStringList('phoneNumber', addChatModel.phoneNumber);
    prefs.setStringList('chatConversation', addChatModel.chatConversation);
    prefs.setStringList('date', addChatModel.date);
    prefs.setStringList('time', addChatModel.time);

    addChatModel.img = null;
    Variables.editName = null;
    Variables.editPhone = null;
    Variables.editChat = null;
    addChatModel.pickDate = null;
    addChatModel.pickTime = null;

    notifyListeners();
  }

  deleteChat(int index) async {
    addChatModel.fullName.remove(addChatModel.fullName[index]);
    addChatModel.phoneNumber.remove(addChatModel.phoneNumber[index]);
    addChatModel.chatConversation.remove(addChatModel.chatConversation[index]);
    addChatModel.date.remove(addChatModel.date[index]);
    addChatModel.time.remove(addChatModel.time[index]);
    if (Variables.index > 0) {
      Variables.index--;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList('image', addChatModel.image);
    prefs.setStringList('fullName', addChatModel.fullName);
    prefs.setStringList('phoneNumber', addChatModel.phoneNumber);
    prefs.setStringList('chatConversation', addChatModel.chatConversation);
    prefs.setStringList('date', addChatModel.date);
    prefs.setStringList('time', addChatModel.time);

    notifyListeners();
  }

  clearValues() {
    Variables.name.clear();
    Variables.phone.clear();
    Variables.chat.clear();
    Variables.editName = null;
    Variables.editPhone = null;
    Variables.editChat = null;
    Variables.index = 0;
    addChatModel.img = null;
    addChatModel.pickDate = null;
    addChatModel.pickTime = null;
    notifyListeners();
  }
}
