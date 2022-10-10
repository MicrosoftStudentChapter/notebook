import 'package:flutter/material.dart';

class ExpandNotes extends StatefulWidget {
  const ExpandNotes({Key? key}) : super(key: key);

  @override
  State<ExpandNotes> createState() => _ExpandNotesState();
}

class _ExpandNotesState extends State<ExpandNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10).copyWith(top: 25),
          child: Column(
            children: const [Header(), Body()],
          ),
        ),
      ),
      persistentFooterButtons: [
        Ink(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).textTheme.bodyText1!.color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "B",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              Text(
                "I",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                color: Theme.of(context).scaffoldBackgroundColor,
                icon: const Icon(Icons.menu),
              ),
              IconButton(
                onPressed: () {},
                color: Theme.of(context).scaffoldBackgroundColor,
                icon: const Icon(Icons.circle_outlined),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide()),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Ink(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                    ),
                    child: Icon(
                      Icons.close_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
              Text(
                "Edit Note",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Ink(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 15).copyWith(bottom: 10),
          child: const Text(
            "How to design using photoshop???",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide()),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Design | MLSC",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).disabledColor,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Edit label",
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodyText1!.color),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Body extends StatefulWidget {
  final String? existingText;
  const Body({super.key, this.existingText});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TextEditingController textController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController = TextEditingController(text: widget.existingText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextField(
        maxLines: null,
        autofocus: textController.text.isNotEmpty ? false : true,
        controller: textController,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
            focusedBorder: InputBorder.none, enabledBorder: InputBorder.none),
      ),
    );
  }
}
