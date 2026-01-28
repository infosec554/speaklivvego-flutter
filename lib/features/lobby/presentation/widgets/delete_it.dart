import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListExample extends StatelessWidget {
  const SlidableListExample({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (i) => "User $i");

    return Scaffold(
      appBar: AppBar(title: const Text('Slidable Auto Close Example')),
      body: SlidableAutoCloseBehavior( // 👈 This does the magic
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Slidable(
              key: ValueKey(index),

              // left side actions
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) => debugPrint('Call ${items[index]}'),
                    backgroundColor: Colors.green,
                    icon: Icons.call,
                    label: 'Call',
                  ),
                  SlidableAction(
                    onPressed: (_) => debugPrint('Message ${items[index]}'),
                    backgroundColor: Colors.blue,
                    icon: Icons.message,
                    label: 'Message',
                  ),
                ],
              ),

              // right side actions (optional)
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) => debugPrint('To Friends ${items[index]}'),
                    backgroundColor: Colors.indigo,
                    icon: Icons.favorite,
                    label: 'To friends',
                  ),
                ],
              ),

              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(items[index]),
                subtitle: const Text('Uzbekistan - 101 talks'),
              ),
            );
          },
        ),
      ),
    );
  }
}
