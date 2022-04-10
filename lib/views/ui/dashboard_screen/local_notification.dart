/* ************************************************************************
* Directory Name: dashboard_screen                                        *
* File Name: create_notification.dart                                     *
* Created At: Sunday, 10th April 2022 10:16:10 pm                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/views/index.dart';

class LocalNotification extends StatefulWidget {
  const LocalNotification({Key? key}) : super(key: key);

  @override
  State<LocalNotification> createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  DateTime dateController = DateTime.now();
  bool isSchedule = false;

  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: CustomScaffold(
        drawer: MyDrawer(),
        appBar: const PreferredSize(
          child: CustomAppBar(),
          preferredSize: Size.fromHeight(60),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtils.hp(5, context),
                ),
                Icon(
                  Icons.notification_add,
                  size: 80,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text("Create Notification",
                    style: Theme.of(context).textTheme.headline5),
                const SizedBox(
                  height: 15,
                ),
                CustomInput(
                  controller: titleController,
                  hintText: "Enter your title.",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInput(
                  controller: messageController,
                  hintText: "Enter your message.",
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  value: isSchedule,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Now"),
                      value: false,
                    ),
                    DropdownMenuItem(
                      child: Text("Schedule"),
                      value: true,
                    ),
                  ],
                  onChanged: (bool? value) {
                    setState(() {
                      isSchedule = value ?? false;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                if (isSchedule) ...[
                  SizedBox(
                    height: 40,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          dateController = newDateTime;
                        });
                      },
                      use24hFormat: false,
                      minuteInterval: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
                ElevatedButton(
                  child: const Text(
                    "Create Notification",
                  ),
                  onPressed: () {
                    createNotification();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  createNotification() {
    if (titleController.text.isEmpty || messageController.text.isEmpty) {
      ToastMessage.error("Please fill title and message");
    } else {
      if (isSchedule) {
        NotificationService.scheduleNotifications(
          title: titleController.text,
          body: messageController.text,
          scheduleTime: dateController,
        );
        ToastMessage.success("Schedule Successfully at $dateController");
        clearState();
      } else {
        NotificationService.showNotifications(
          title: titleController.text,
          body: messageController.text,
        );
        ToastMessage.success("Sent Suceessfully");
        clearState();
      }
    }
  }

  clearState() {
    setState(() {
      titleController.text = '';
      messageController.text = '';
      isSchedule = false;
    });
  }
}
