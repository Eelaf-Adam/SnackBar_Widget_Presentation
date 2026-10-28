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
  // For user input
  final TextEditingController _noteController = TextEditingController();

  void _saveNote() {
    final noteText = _noteController.text.trim();

    // Clear existing SnackBar 
    ScaffoldMessenger.of(context).clearSnackBars();

    // Check if the user typed 
    if (noteText.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // Property 1 
          content: const Text('Note saved!\nAutomatically disappears after 3 seconds'),

          // Property 2 
          duration: const Duration(seconds: 3),
          persist: false,

          // Property 3 
          action: SnackBarAction(
            label: 'UNDO',
            textColor: Colors.amber,
            onPressed: () {
              // Restore the note 
              _noteController.text = noteText;
            },
          ),
        ),
      );

      // Clear the field 
      _noteController.clear();
    } else {
      // Prompt error 
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
    // Avoid memory leaks
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
            // Multiline input 
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

            // Save button 
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
