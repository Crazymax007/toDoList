import 'package:flutter/material.dart';
import 'add_task_dialog.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, dynamic>> tasks = []; // เปลี่ยนเป็น dynamic เพื่อรองรับค่า bool

  void _addTask() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => AddTaskDialog(),
    );

    if (result != null) {
      setState(() {
        tasks.add({
          'title': result['title'],
          'time': result['time'],
          'details': result['details'],
          'completed': false, // เพิ่มสถานะการทำสำเร็จ
        });
      });
    }
  }

  final dateRightNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${dateRightNow.day}/${dateRightNow.month}/${dateRightNow.year}";
    return Scaffold(
      appBar: _customAppBar(context),
      backgroundColor: const Color.fromARGB(255, 27, 26, 26),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(height: 30),
                Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 195, 195, 195)),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  final isCompleted = task['completed'] ?? false; // ตรวจสอบสถานะ completed
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 50, 50, 50),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: isCompleted,
                        onChanged: (bool? value) {
                          setState(() {
                            task['completed'] = value ?? false;
                          });
                        },
                      ),
                      title: Text(
                        task['title'] ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(
                        '${task['time'] ?? ''}\n${task['details'] ?? ''}',
                        style: TextStyle(
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      textColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15.0,
                      ),
                      trailing: isCompleted
                          ? IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  tasks.removeAt(index); // ลบ task ออกจากรายการ
                                });
                              },
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }

  PreferredSize _customAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 26, 26),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 27,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.mode_comment_outlined,
                    size: 30,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    // กำหนดการทำงานเมื่อกดปุ่มข้อความ
                  },
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.person_outlined,
                size: 35,
              ),
              color: Colors.white,
              onPressed: () {
                // กำหนดการทำงานเมื่อกดปุ่มคน
              },
            ),
          ],
        ),
      ),
    );
  }
}
