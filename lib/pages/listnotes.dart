import 'package:flutter/material.dart';
import 'package:notes_era/widget/text.custom.dart';

import '../model/notes.model.dart';

class ListNotes extends StatefulWidget {
  const ListNotes({Key? key}) : super(key: key);

  @override
  State<ListNotes> createState() => _ListNotesState();
}

class _ListNotesState extends State<ListNotes>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController tabController;
  Brightness? _brightness;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _brightness = WidgetsBinding.instance.window.platformBrightness;
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    tabController.dispose();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      setState(() {
        _brightness = WidgetsBinding.instance.window.platformBrightness;
      });
    }
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColorDark,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: Column(
          children: [
            Row(
              children: [
                _brightness == Brightness.dark
                    ? Image.asset(
                        "assets/logo_dark.png",
                        height: 30,
                      )
                    : Image.asset(
                        "assets/logo.png",
                        height: 30,
                      ),
                const SizedBox(width: 10),
                const CustomText(name: 'NoteBook'),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  iconSize: 28,
                  icon: Icon(Icons.search,
                      size: 28, color: Theme.of(context).iconTheme.color),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Theme.of(context).dividerTheme.color,
            ),
            NotesListBody(tabController: tabController),
          ],
        ),
      )),
    );
  }
}

class NotesListBody extends StatelessWidget {
  const NotesListBody({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          height: 60,
          decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(15)),
          child: TabBar(
              indicatorColor: Theme.of(context).primaryColorDark,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColorDark,
              ),
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: const Color(0xff8B8989),
              controller: tabController,
              tabs: const [
                Tab(text: 'Notes'),
                Tab(text: 'Highlights'),
                Tab(text: 'Favorites'),
              ]),
        ),
        SizedBox(
          height: 600,
          child: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: notes,
                ),
              ),
              Container(),
              Container(),
            ],
          ),
        ),
      ],
    );
  }
}

class NoteListTile extends StatefulWidget {
  const NoteListTile({
    super.key,
    required this.title,
    required this.noteText,
    required this.tag,
    required this.date,
    required this.fillColor,
    required this.borderColor,
  });
  final String title;
  final String noteText;
  final String tag;
  final String date;
  final Color fillColor;
  final Color borderColor;

  @override
  State<NoteListTile> createState() => _NoteListTileState();
}

class _NoteListTileState extends State<NoteListTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
        debugPrint(isExpanded.toString());
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 18, 14, 10),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.fillColor,
          border: isExpanded ? Border.all(color: widget.borderColor) : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              name: widget.title,
              fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
              fontSize: 16,
            ),
            const SizedBox(height: 15),
            if (isExpanded) Text(widget.noteText),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.tag),
                Text(widget.date),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
