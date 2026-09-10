import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ShoppingListPage(),
    );
  }
}

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<String> items = ['apple', 'grapes'];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    String newItem = _controller.text.trim();
    if (newItem.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter an item!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (items.contains(newItem)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"$newItem" already exists!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    setState(() {
      items.add(newItem);
      _controller.clear();
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('"$newItem" added successfully')));
  }

  void _deleteItem(int index) {
    setState(() {
      String deletedItem = items[index];
      items.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"$deletedItem" deleted!'),
          backgroundColor: Colors.grey,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.amber,
                    child: ListTile(
                      title: Text(items[index], style: TextStyle(fontSize: 20)),
                      trailing: IconButton(
                        onPressed: () => _deleteItem(index),
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                      onTap: () => _deleteItem(index),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onSubmitted: (value) => _addItem(),
                  ),
                ),
                SizedBox(width: 30),
                ElevatedButton(onPressed: _addItem, child: Text('Add')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
