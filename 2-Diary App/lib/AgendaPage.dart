import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
      ),
      body: Column(
        children: [
          _calendar(),
          Expanded(child: _entriesForSelectedDay()),
        ],
      ),
    );
  }

  Widget _calendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2000),
      lastDay: DateTime.utc(2100),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
      calendarFormat: CalendarFormat.month,

      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
    );
  }

  Widget _entriesForSelectedDay() {
    String selectedDate = _selectedDay.toIso8601String().substring(0, 10);

    return StreamBuilder(
      stream: db
          .collection("users")
          .doc(user.email)
          .collection("entries")
          .where("date", isEqualTo: selectedDate)
          .orderBy("date")
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        final docs = snapshot.data!.docs;

        if (docs.isEmpty)
          return Center(child: Text("No entries on this day"));

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, i) {
            final entry = docs[i];

            return ListTile(
              title: Text(entry["title"]),
              subtitle: Text(entry["feeling"]),
              onTap: () => _openEntry(entry),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _delete(entry.id),
              ),
            );
          },
        );
      },
    );
  }

  void _openEntry(entry) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(entry["title"]),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Date: ${entry['date']}"),
            Text("Feeling: ${entry['feeling']}"),
            SizedBox(height: 10),
            Text(entry["content"]),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          )
        ],
      ),
    );
  }

  void _delete(String id) async {
    await db
        .collection("users")
        .doc(user.email)
        .collection("entries")
        .doc(id)
        .delete();
  }
}
