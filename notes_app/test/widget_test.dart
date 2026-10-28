import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/main.dart';

void main() {
  testWidgets('Notes app displays input field and save button', (WidgetTester tester) async {
    await tester.pumpWidget(const NotesApp());

    expect(find.text('Quick Notes'), findsOneWidget);
    expect(find.text('Save Note'), findsOneWidget);
  });
}
