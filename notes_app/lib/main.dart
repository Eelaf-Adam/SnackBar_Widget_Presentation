import 'package:flutter/material.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NoteScreen(),
    );
  }
}

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  // Controller to read and clear the input text
  final TextEditingController _noteController = TextEditingController();

  void _saveNote() {
    final noteText = _noteController.text.trim();

    // Check if the user actually typed something
    if (noteText.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // Property 1 - content: what the user sees inside the banner
          content: const Text('Note saved!\nAutomatically disappears after 3 seconds'),

          // Property 2 - duration: how long it stays (default is 4s, we set 3s)
          duration: const Duration(seconds: 3),

          // Property 3 - action: interactive button allowing the user to undo
          action: SnackBarAction(
            label: 'UNDO',
            textColor: Colors.amber,
            onPressed: () {
              // Restore the note text back into the field
              _noteController.text = noteText;
            },
          ),
        ),
      );

      // Clear the field for the next note
      _noteController.clear();
    } else {
      // Friendly reminder if save was tapped on an empty note
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a note before saving!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    // Clean up controller to avoid memory leaks
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Notes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Multiline input field for writing notes
            TextField(
              controller: _noteController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'New Note',
                hintText: 'Enter your note here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Save button that triggers our SnackBar demo
            ElevatedButton.icon(
              onPressed: _saveNote,
              icon: const Icon(Icons.save),
              label: const Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
