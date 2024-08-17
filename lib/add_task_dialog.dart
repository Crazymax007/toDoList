import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _titleController = TextEditingController();
  final _timeController = TextEditingController(); // ใช้สำหรับแสดงเวลา
  final _detailsController = TextEditingController();
  TimeOfDay? _selectedTime;

  // ฟังก์ชันเปิด TimePicker
  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = _selectedTime!.format(context); // อัปเดตค่าใน TextField
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'TO DO LIST',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'TASK',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: _pickTime,
              child: AbsorbPointer(
                child: TextField(
                  controller: _timeController, // ใช้ controller เพื่อแสดงเวลา
                  decoration: const InputDecoration(
                    labelText: 'TIME',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _detailsController,
              maxLines: 3, // ทำให้รายละเอียดพิมพ์ได้หลายบรรทัด
              decoration: const InputDecoration(
                labelText: 'DETAILS',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'ยกเลิก',
            style: TextStyle(color: Colors.red),
          ),
        ),
        ElevatedButton(
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
