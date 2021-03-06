import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Chat UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Message> messages = [
    Message(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey2",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "hey3",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey2",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "hey3",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey2",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "hey3",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey2",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "hey3",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey2",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "hey3",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey2",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "hey3",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey2",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "hey3",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "hey2",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: "hey3",
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false)
  ];

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                elements: messages,
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                groupBy: (message) => DateTime(
                    message.date.year, message.date.month, message.date.day),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 10),
                    decoration: message.isSentByMe
                        ? BoxDecoration(
                            color: Colors.blueAccent.shade100,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                          )
                        : BoxDecoration(
                            color: Colors.blueGrey.shade50,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                            ),
                          ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(message.text),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  hintText: 'type your message here',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      final message = Message(
                          text: _controller.value.text.toString(),
                          date: DateTime.now(),
                          isSentByMe: true);
                      _controller.clear();
                      setState(() {
                        messages.add(message);
                      });
                    },
                  ),
                ),
                autocorrect: false,
                onSubmitted: (text) {
                  final message = Message(
                      text: text, date: DateTime.now(), isSentByMe: true);
                  setState(() {
                    messages.add(message);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message(
      {required this.text, required this.date, required this.isSentByMe});
}
