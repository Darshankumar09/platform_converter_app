import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/controllers/providers/add_chat_provider.dart';
import 'package:platform_converter_app/controllers/providers/app_provider.dart';
import 'package:platform_converter_app/controllers/providers/theme_provider.dart';
import 'package:platform_converter_app/models/variables.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (Provider.of<AppProvider>(context).appModel.isIos == false)
        ? (Provider.of<AddChatProvider>(context)
                .addChatModel
                .fullName
                .isNotEmpty)
            ? ListView.builder(
                itemCount: Provider.of<AddChatProvider>(context)
                    .addChatModel
                    .fullName
                    .length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  horizontalTitleGap: 10,
                  onTap: () {
                    Variables.index = index;

                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                        height: 350,
                        child:
                            (Provider.of<AddChatProvider>(context)
                                    .addChatModel
                                    .fullName
                                    .isNotEmpty)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 70,
                                        foregroundImage: FileImage(
                                          File(
                                            Provider.of<AddChatProvider>(
                                                    context)
                                                .addChatModel
                                                .image[Variables.index],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        Provider.of<AddChatProvider>(context)
                                            .addChatModel
                                            .fullName[Variables.index],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        Provider.of<AddChatProvider>(context)
                                            .addChatModel
                                            .chatConversation[Variables.index],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) =>
                                                    StatefulBuilder(
                                                  builder:
                                                      (context, setState) =>
                                                          AlertDialog(
                                                    content: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Form(
                                                        key: formKey,
                                                        child:
                                                            SingleChildScrollView(
                                                          physics:
                                                              const BouncingScrollPhysics(),
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              (Provider.of<AddChatProvider>(
                                                                              context)
                                                                          .addChatModel
                                                                          .img !=
                                                                      null)
                                                                  ? GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Provider.of<AddChatProvider>(context,
                                                                                listen: false)
                                                                            .editImage(index);
                                                                      },
                                                                      child:
                                                                          CircleAvatar(
                                                                        radius:
                                                                            60,
                                                                        foregroundImage: FileImage(Provider.of<AddChatProvider>(context)
                                                                            .addChatModel
                                                                            .img!),
                                                                      ),
                                                                    )
                                                                  : GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Provider.of<AddChatProvider>(context,
                                                                                listen: false)
                                                                            .editImage(index);
                                                                      },
                                                                      child:
                                                                          CircleAvatar(
                                                                        radius:
                                                                            60,
                                                                        foregroundImage:
                                                                            FileImage(
                                                                          File(Provider.of<AddChatProvider>(context)
                                                                              .addChatModel
                                                                              .image[index]),
                                                                        ),
                                                                      ),
                                                                    ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              TextFormField(
                                                                initialValue: Provider.of<
                                                                            AddChatProvider>(
                                                                        context)
                                                                    .addChatModel
                                                                    .fullName[index],
                                                                onSaved: (val) {
                                                                  Variables
                                                                          .editName =
                                                                      val;
                                                                },
                                                                validator:
                                                                    (val) {
                                                                  if (val!
                                                                      .isEmpty) {
                                                                    return "Enter Full Name";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
                                                                  prefixIcon:
                                                                      Icon(Icons
                                                                          .person_outline),
                                                                  labelText:
                                                                      "Full Name",
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              TextFormField(
                                                                initialValue: Provider.of<
                                                                            AddChatProvider>(
                                                                        context)
                                                                    .addChatModel
                                                                    .phoneNumber[index],
                                                                onSaved: (val) {
                                                                  Variables
                                                                          .editPhone =
                                                                      val;
                                                                },
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                maxLength: 10,
                                                                validator:
                                                                    (val) {
                                                                  if (val!
                                                                      .isEmpty) {
                                                                    return "Enter Phone Number";
                                                                  } else if (val
                                                                          .length !=
                                                                      10) {
                                                                    return "Not Valid Number";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
                                                                  prefixIcon:
                                                                      Icon(Icons
                                                                          .phone),
                                                                  labelText:
                                                                      "Phone Number",
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              TextFormField(
                                                                initialValue: Provider.of<
                                                                            AddChatProvider>(
                                                                        context)
                                                                    .addChatModel
                                                                    .chatConversation[index],
                                                                onSaved: (val) {
                                                                  Variables
                                                                          .editChat =
                                                                      val;
                                                                },
                                                                validator:
                                                                    (val) {
                                                                  if (val!
                                                                      .isEmpty) {
                                                                    return "Enter Any Message";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    const InputDecoration(
                                                                  prefixIcon:
                                                                      Icon(Icons
                                                                          .message_outlined),
                                                                  labelText:
                                                                      "Chat Conversation",
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  Provider.of<AddChatProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .addChatModel
                                                                      .tempDate = await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime(
                                                                            2000),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2100),
                                                                  );

                                                                  Provider.of<AddChatProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .pickDate();
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Icon(Icons
                                                                        .calendar_month),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    (Provider.of<AddChatProvider>(context, listen: false).addChatModel.pickDate !=
                                                                            null)
                                                                        ? Text(
                                                                            "${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.day} / ${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.month} / ${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.year}",
                                                                          )
                                                                        : Text(Provider.of<AddChatProvider>(context)
                                                                            .addChatModel
                                                                            .date[index]),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  Provider.of<AddChatProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .addChatModel
                                                                      .tempTime = await showTimePicker(
                                                                    context:
                                                                        context,
                                                                    initialTime:
                                                                        TimeOfDay
                                                                            .now(),
                                                                  );

                                                                  Provider.of<AddChatProvider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .pickTime();
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Icon(Icons
                                                                        .access_time_outlined),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    (Provider.of<AddChatProvider>(context, listen: false).addChatModel.pickTime !=
                                                                            null)
                                                                        ? Text(
                                                                            "${Provider.of<AddChatProvider>(context).addChatModel.pickTime?.hour} : ${Provider.of<AddChatProvider>(context).addChatModel.pickTime?.minute}",
                                                                          )
                                                                        : Text(Provider.of<AddChatProvider>(context)
                                                                            .addChatModel
                                                                            .time[index]),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  OutlinedButton(
                                                                    onPressed:
                                                                        () {
                                                                      if (formKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        formKey
                                                                            .currentState!
                                                                            .save();
                                                                        Provider.of<AddChatProvider>(context,
                                                                                listen: false)
                                                                            .editChat(index);
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      }
                                                                    },
                                                                    child: const Text(
                                                                        "Save"),
                                                                  ),
                                                                  OutlinedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Provider.of<AddChatProvider>(
                                                                              context,
                                                                              listen: false)
                                                                          .clearValues();
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: const Text(
                                                                        "Cancel"),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: const Icon(Icons.edit),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Provider.of<AddChatProvider>(
                                                      context,
                                                      listen: false)
                                                  .deleteChat(index);
                                            },
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Cancel"),
                                      ),
                                    ],
                                  )
                                : Container(),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    foregroundImage: FileImage(
                      File(
                        Provider.of<AddChatProvider>(context)
                            .addChatModel
                            .image[index],
                      ),
                    ),
                  ),
                  title: Text(
                    Provider.of<AddChatProvider>(context)
                        .addChatModel
                        .fullName[index],
                  ),
                  subtitle: Text(
                    Provider.of<AddChatProvider>(context)
                        .addChatModel
                        .chatConversation[index],
                  ),
                  trailing: Text(
                    "${Provider.of<AddChatProvider>(context, listen: false).addChatModel.date[index]}, ${Provider.of<AddChatProvider>(context, listen: false).addChatModel.time[index]}",
                  ),
                ),
              )
            : const Center(
                child: Text("No any chat yet..."),
              )
        : (Provider.of<AddChatProvider>(context)
                .addChatModel
                .fullName
                .isNotEmpty)
            ? CupertinoListSection(
                children: List.generate(
                  Provider.of<AddChatProvider>(context)
                      .addChatModel
                      .fullName
                      .length,
                  (index) => CupertinoListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    leadingSize: 80,
                    leadingToTitle: 5,
                    onTap: () {
                      Variables.index = index;

                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          color: (Provider.of<ThemeProvider>(context)
                                  .themeModel
                                  .isDark)
                              ? CupertinoColors.darkBackgroundGray
                              : CupertinoColors.white,
                          child:
                              (Provider.of<AddChatProvider>(context)
                                      .addChatModel
                                      .fullName
                                      .isNotEmpty)
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 70,
                                          foregroundImage: FileImage(
                                            File(
                                              Provider.of<AddChatProvider>(
                                                      context)
                                                  .addChatModel
                                                  .image[Variables.index],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          Provider.of<AddChatProvider>(context)
                                              .addChatModel
                                              .fullName[Variables.index],
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          Provider.of<AddChatProvider>(context)
                                                  .addChatModel
                                                  .chatConversation[
                                              Variables.index],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CupertinoButton(
                                              onPressed: () {
                                                showCupertinoDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      Transform.scale(
                                                    scaleX: 1.2,
                                                    scaleY: 1.1,
                                                    child: CupertinoAlertDialog(
                                                      content: SizedBox(
                                                        child: Form(
                                                          key: formKey,
                                                          child:
                                                              SingleChildScrollView(
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                            child: Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                (Provider.of<AddChatProvider>(context)
                                                                            .addChatModel
                                                                            .img !=
                                                                        null)
                                                                    ? GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Provider.of<AddChatProvider>(context, listen: false)
                                                                              .pickImage();
                                                                        },
                                                                        child:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              60,
                                                                          foregroundImage: FileImage(Provider.of<AddChatProvider>(context)
                                                                              .addChatModel
                                                                              .img!),
                                                                        ),
                                                                      )
                                                                    : GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Provider.of<AddChatProvider>(context, listen: false)
                                                                              .pickImage();
                                                                        },
                                                                        child:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              60,
                                                                          foregroundImage:
                                                                              FileImage(
                                                                            File(
                                                                              Provider.of<AddChatProvider>(context).addChatModel.image[index],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Transform.scale(
                                                                  scaleX: 1.01,
                                                                  scaleY: 1.15,
                                                                  child:
                                                                      CupertinoTextFormFieldRow(
                                                                    initialValue: Provider.of<AddChatProvider>(
                                                                            context)
                                                                        .addChatModel
                                                                        .fullName[index],
                                                                    onSaved:
                                                                        (val) {
                                                                      Variables
                                                                              .editName =
                                                                          val;
                                                                    },
                                                                    validator:
                                                                        (val) {
                                                                      if (val!
                                                                          .isEmpty) {
                                                                        return "Enter Full Name";
                                                                      } else {
                                                                        return null;
                                                                      }
                                                                    },
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border
                                                                          .all(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    placeholder:
                                                                        "Full Name",
                                                                    prefix:
                                                                        const Icon(
                                                                      CupertinoIcons
                                                                          .person,
                                                                    ),
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Transform.scale(
                                                                  scaleX: 1.01,
                                                                  scaleY: 1.15,
                                                                  child:
                                                                      CupertinoTextFormFieldRow(
                                                                    initialValue: Provider.of<AddChatProvider>(
                                                                            context)
                                                                        .addChatModel
                                                                        .phoneNumber[index],
                                                                    onSaved:
                                                                        (val) {
                                                                      Variables
                                                                              .editPhone =
                                                                          val;
                                                                    },
                                                                    validator:
                                                                        (val) {
                                                                      if (val!
                                                                          .isEmpty) {
                                                                        return "Enter Phone Number";
                                                                      } else if (val
                                                                              .length !=
                                                                          10) {
                                                                        return "Not Valid Number";
                                                                      } else {
                                                                        return null;
                                                                      }
                                                                    },
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    maxLength:
                                                                        10,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border
                                                                          .all(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    placeholder:
                                                                        "Phone Number",
                                                                    prefix:
                                                                        const Icon(
                                                                      CupertinoIcons
                                                                          .phone,
                                                                    ),
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Transform.scale(
                                                                  scaleX: 1.01,
                                                                  scaleY: 1.15,
                                                                  child:
                                                                      CupertinoTextFormFieldRow(
                                                                    initialValue: Provider.of<AddChatProvider>(
                                                                            context)
                                                                        .addChatModel
                                                                        .chatConversation[index],
                                                                    onSaved:
                                                                        (val) {
                                                                      Variables
                                                                              .editChat =
                                                                          val;
                                                                    },
                                                                    validator:
                                                                        (val) {
                                                                      if (val!
                                                                          .isEmpty) {
                                                                        return "Enter Any Message";
                                                                      } else {
                                                                        return null;
                                                                      }
                                                                    },
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border: Border
                                                                          .all(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    placeholder:
                                                                        "Chat Conversation",
                                                                    prefix:
                                                                        const Icon(
                                                                      CupertinoIcons
                                                                          .chat_bubble_text,
                                                                    ),
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    showCupertinoModalPopup(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        height:
                                                                            350,
                                                                        color: (Provider.of<ThemeProvider>(context).themeModel.isDark)
                                                                            ? CupertinoColors.darkBackgroundGray
                                                                            : CupertinoColors.white,
                                                                        child:
                                                                            CupertinoDatePicker(
                                                                          mode:
                                                                              CupertinoDatePickerMode.date,
                                                                          initialDateTime:
                                                                              DateTime.now(),
                                                                          minimumYear:
                                                                              2000,
                                                                          maximumYear:
                                                                              2100,
                                                                          onDateTimeChanged:
                                                                              (val) {
                                                                            Provider.of<AddChatProvider>(context, listen: false).addChatModel.tempDate =
                                                                                val;

                                                                            Provider.of<AddChatProvider>(context, listen: false).pickDate();
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const Icon(
                                                                          CupertinoIcons
                                                                              .calendar),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      (Provider.of<AddChatProvider>(context, listen: false).addChatModel.pickDate !=
                                                                              null)
                                                                          ? Text(
                                                                              "${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.day} / ${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.month} / ${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.year}",
                                                                            )
                                                                          : Text(
                                                                              Provider.of<AddChatProvider>(context).addChatModel.date[index],
                                                                            ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    showCupertinoModalPopup(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        height:
                                                                            350,
                                                                        color: (Provider.of<ThemeProvider>(context).themeModel.isDark)
                                                                            ? CupertinoColors.darkBackgroundGray
                                                                            : CupertinoColors.white,
                                                                        child:
                                                                            CupertinoDatePicker(
                                                                          mode:
                                                                              CupertinoDatePickerMode.time,
                                                                          initialDateTime:
                                                                              DateTime.now(),
                                                                          minimumYear:
                                                                              2000,
                                                                          maximumYear:
                                                                              2100,
                                                                          onDateTimeChanged:
                                                                              (val) {
                                                                            Provider.of<AddChatProvider>(context, listen: false).addChatModel.tempTime =
                                                                                TimeOfDay.fromDateTime(val);

                                                                            Provider.of<AddChatProvider>(context, listen: false).pickTime();
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const Icon(
                                                                          CupertinoIcons
                                                                              .time),
                                                                      const SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      (Provider.of<AddChatProvider>(context, listen: false).addChatModel.pickTime !=
                                                                              null)
                                                                          ? Text(
                                                                              "${Provider.of<AddChatProvider>(context).addChatModel.pickTime?.hour} : ${Provider.of<AddChatProvider>(context).addChatModel.pickTime?.minute}",
                                                                            )
                                                                          : Text(
                                                                              Provider.of<AddChatProvider>(context).addChatModel.time[index],
                                                                            ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      actions: [
                                                        CupertinoButton(
                                                          onPressed: () {
                                                            if (formKey
                                                                .currentState!
                                                                .validate()) {
                                                              formKey
                                                                  .currentState!
                                                                  .save();
                                                              Provider.of<AddChatProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .editChat(
                                                                      index);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }
                                                          },
                                                          child: const Text(
                                                              "Save"),
                                                        ),
                                                        CupertinoButton(
                                                          onPressed: () {
                                                            Provider.of<AddChatProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .clearValues();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              "Cancel"),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Icon(
                                                  CupertinoIcons.pen),
                                            ),
                                            CupertinoButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Provider.of<AddChatProvider>(
                                                        context,
                                                        listen: false)
                                                    .deleteChat(index);
                                              },
                                              child: const Icon(
                                                  CupertinoIcons.delete_solid),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        CupertinoButton.filled(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Cancel"),
                                        ),
                                      ],
                                    )
                                  : Container(),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      foregroundImage: FileImage(
                        File(
                          Provider.of<AddChatProvider>(context)
                              .addChatModel
                              .image[index],
                        ),
                      ),
                    ),
                    title: Text(
                      Provider.of<AddChatProvider>(context)
                          .addChatModel
                          .fullName[index],
                    ),
                    subtitle: Text(
                      Provider.of<AddChatProvider>(context)
                          .addChatModel
                          .chatConversation[index],
                    ),
                    trailing: Text(
                      "${Provider.of<AddChatProvider>(context, listen: false).addChatModel.date[index]}, ${Provider.of<AddChatProvider>(context, listen: false).addChatModel.time[index]}",
                    ),
                  ),
                ),
              )
            : const Center(
                heightFactor: 35,
                child: Text("No any chat yet..."),
              );
  }
}
