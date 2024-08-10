import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('เพิ่มกิจกรรม'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'ชื่อกิจกรรม'),
          ),
          TextField(
            controller: _timeController,
            decoration: const InputDecoration(labelText: 'เวลา'),
          ),
          TextField(
            controller: _detailsController,
            decoration: const InputDecoration(labelText: 'รายละเอียด'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('ยกเลิก'),
        ),
        TextButton(
          onPressed: () {
            final title = _titleController.text;
            final time = _timeController.text;
            final details = _detailsController.text;
            Navigator.of(context).pop({
              'title': title,
              'time': time,
              'details': details,
            });
          },
          child: const Text('เพิ่ม'),
        ),
      ],
    );
  }
}
