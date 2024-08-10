import 'package:flutter/material.dart';
import 'add_task_dialog.dart'; // นำเข้าคลาส AddTaskDialog

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, String>> tasks = [];

  void _addTask() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => AddTaskDialog(),
    );

    if (result != null) {
      setState(() {
        tasks.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(context),
      backgroundColor: const Color.fromARGB(255, 27, 26, 26),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              child: const Row(
                children: [
                  Text(
                    'march 21, 2024',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 195, 195, 195)),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    title: Text(task['title'] ?? ''),
                    subtitle: Text('${task['time'] ?? ''}\n${task['details'] ?? ''}'),
                    textColor: Colors.white,
                    tileColor: Color.fromARGB(255, 50, 50, 50),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
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
