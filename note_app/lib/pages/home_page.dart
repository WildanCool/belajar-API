import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/pages/note_page.dart';
import 'package:note_app/services/database_helper.dart';
// import 'package:note_app/widgets/confirm_dialog.dart'; 
import 'package:note_app/widgets/note_card.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const HomePage({super.key, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];

  // LOAD DATA (DATABASE -> UI)
  Future<void> loadNotes() async {
    final data = await DatabaseHelper.instance.getAllNotes();

    // REFRESH
    setState(() {
      notes = data;
    });
  }

  // ADD
  // void addNote(Note note) {
  //   setState(() {
  //     notes.add(note);
  //   });
  // }

  // // UPDATE
  // void updateNote(int index, Note note) {
  //   setState(() {
  //     notes[index] = note;
  //   });
  // }

  // // DELETE
  // void deleteNote(int index) async {
  //   bool confirm = await showConfirmDialog(context);
  //   if (confirm) {
  //     setState(() {
  //       notes.removeAt(index);
  //     });
  //   }
  // }

  // NAVIGATION (KEEP STYLE)
  void goToNotePage({Note? note}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NotePage(note: note)),
    );

    // HANDLE RESULT
    // DELETE
    if (result == "delete" && note?.id != null) {
      await DatabaseHelper.instance.deleteNote(note!.id!);
      await loadNotes();
    } // UPDATE
    else if (result is Note && note != null) {
      await DatabaseHelper.instance.updateNote(result);
      await loadNotes();
    } // INSERT
    else if (result is Note) {
      await DatabaseHelper.instance.insertNote(result);
      await loadNotes();
    }
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("My NOTES"),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme,
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),

      backgroundColor: theme.scaffoldBackgroundColor,

      body: notes.isEmpty
          ? Center(
              child: Text(
                "Ayo, Catat Keperluan Kamu!",
                style: theme.textTheme.bodyMedium,
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return NoteCard(
                  note: notes[index],
                  onEdit: () => goToNotePage(note: notes[index]),
                  onDelete: () => goToNotePage(note: notes[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goToNotePage(),
        child: Icon(Icons.add),
      ),
    );
  }
}
