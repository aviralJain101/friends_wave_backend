import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          contact(
            'assets/10.jpg',
            'Avinash',
            '19:30',
            'online',
            'biomedical to meta branch change',
            context,
          ),
          contact(
            'assets/20.jpg',
            'Ajit',
            '10:05',
            'online',
            'fjkasdf',
            context,
          ),
          contact(
            'assets/30.jpg',
            'Rajni',
            '18:20',
            'online',
            'ad;jfjk',
            context,
          ),
          contact(
            'assets/40.jpg',
            'Priyal',
            '12:10',
            'online',
            'dxsfag',
            context,
          ),
          contact(
            'assets/50.jpg',
            'Dhawal',
            '16:45',
            'online',
            'Am in the way, just 5 min...',
            context,
          ),
          contact(
            'assets/60.jpg',
            'Bhumik',
            '19:30',
            'online',
            'fine',
            context,
          ),
          contact(
            'assets/70.jpg',
            'Aviral',
            'Yesterday',
            'online',
            'Can you explain to me ?',
            context,
          ),
          contact(
            'assets/80.jpg',
            'Miki',
            'Yesterday',
            'online',
            'a;kldjf;kaj;dkjf;ljfjkdjlfkjlkdsjlkfjlskjlkdjflsjfk kjlkjdlfjl lkjldjsfl jal lkjlsjdflk jlkjl jlfksdjl jlsfjlkdjfl sjfldkj lkjdslkjf',
            context,
          ),
          contact(
            'assets/90.jpg',
            'Aviral',
            'Yesterday',
            'online',
            '',
            context,
          ),
          contact(
            'assets/100.jpg',
            'Aviral',
            '4/23/22',
            'online',
            'yes',
            context,
          ),
          contact(
            'assets/110.jpg',
            'Harsh',
            '4/23/22',
            'online',
            'on-call',
            context,
          ),
          contact(
            'assets/120.jpg',
            'Aviral',
            '4/23/22',
            'online',
            'great',
            context,
          ),
          contact(
            'assets/120.jpg',
            'Aviral',
            '4/23/22',
            'online',
            'great',
            context,
          ),
          contact(
            'assets/120.jpg',
            'Aviral',
            '4/23/22',
            'online',
            'great',
            context,
          ),
          contact(
            'assets/120.jpg',
            'Aviral',
            '4/23/22',
            'online',
            'great',
            context,
          ),
          contact(
            'assets/120.jpg',
            'Aviral',
            '4/23/22',
            'online',
            'great',
            context,
          ),
          contact(
            'assets/120.jpg',
            'Aviral',
            '4/23/22',
            'online',
            'great',
            context,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
    );
  }
}

Widget contact(
    String urlImage, String title, var time, onOff, String msgs, context) {
  // Define the maximum number of characters to show in the message
  const int maxMessageLength = 25;

  // Truncate the message to the maximum length and add three dots if it overflows
  final truncatedMsg = msgs.length > maxMessageLength
      ? '${msgs.substring(0, maxMessageLength)}...' // Append three dots
      : msgs;
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
    child: ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => message(urlImage, title, onOff, context)),
        );
      },
      leading: SizedBox(
        height: 50,
        width: 50,
        child: ClipOval(
          child: Image.asset(
            urlImage,
            fit: BoxFit.fill,
          ),
        ),
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          const Icon(
            Icons.done_all,
            size: 20,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            truncatedMsg,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: Text(time),
    ),
  );
}

Widget message(String urlImage, String title, String onOff, context) {
  // clickContact
  return Scaffold(
    appBar: AppBar(
      titleSpacing: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      title: Row(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: ClipOval(
              child: Image.asset(
                urlImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(
                height: 2,
              ),
              Text(
                onOff,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: const [
        Icon(Icons.videocam),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.call),
        ),
        Icon(Icons.more_vert),
      ],
    ),
    body: const ChatScr(),
  );
}

class ChatMess extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  const ChatMess(
      {Key? key, required this.text, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: const Color(0xffdcf8c6),
            borderRadius: BorderRadius.circular(4.0)),
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        child: Text(text),
      ),
    );
  }
}

class ChatScr extends StatefulWidget {
  const ChatScr({Key? key}) : super(key: key);

  @override
  State<ChatScr> createState() => _ChatScrState();
}

class _ChatScrState extends State<ChatScr> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final List<ChatMess> _messages = [];
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  void _handleSubmitted(String text) {
    _textController.clear();

    var message = ChatMess(
      // NEW
      text: text, // NEW
      animationController: AnimationController(
        // NEW
        duration: const Duration(milliseconds: 700), // NEW
        vsync: this, // NEW
      ), // NEW
    ); // NEW
    setState(() {
      // NEW
      _messages.insert(0, message); // NEW
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    bool sendMic = false;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: _textController,
                onChanged: (text) {
                  setState(() {
                    sendMic = true;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.7),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Message',
                  hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
                  suffixIconConstraints:
                  const BoxConstraints(minWidth: 80, maxWidth: 100),
                  suffixIcon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.attach_file_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                focusNode: _focusNode,
              ),
            ),
          ),
          IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
            child: SizedBox(
              height: 65,
              width: 65,
              child: IconButton(
                icon: _textController.text == ''
                    ? const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                    ))
                    : const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => // MODIFIED
                _handleSubmitted(_textController.text) // MODIFIED
                ,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/chatBack.jpg"), fit: BoxFit.cover)),
      child: Column(
        // MODIFIED
        children: [
          // NEW
          Flexible(
            // NEW
            child: ListView.builder(
              // NEW
              padding: const EdgeInsets.all(8.0), // NEW
              reverse: true, // NEW
              itemBuilder: (_, index) => _messages[index], // NEW
              itemCount: _messages.length, // NEW
            ), // NEW
          ), // NEW
          Container(
            child: _buildTextComposer(), // MODIFIED
          ), // NEW
        ], // NEW
      ),
    );
  }
}
