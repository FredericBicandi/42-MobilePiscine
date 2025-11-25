import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final entriesStream = db
        .collection("users")
        .doc(user.email)
        .collection("entries")
        .orderBy("date", descending: true)
        .snapshots();

    return Scaffold(
      backgroundColor: Color(0xFFF6F8EE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "My Diary",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
          )
        ],
      ),

      body: StreamBuilder(
        stream: entriesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          final docs = snapshot.data!.docs;

          // ----- TOTAL ENTRIES -----
          int total = docs.length;

          // ----- LAST TWO ENTRIES -----
          final lastTwo = docs.take(2).toList();

          // ----- FEELING STATISTICS -----
          Map<String, int> counts = {};
          for (var d in docs) {
            final f = d["feeling"];
            counts[f] = (counts[f] ?? 0) + 1;
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // ---- USER NAME ----
                Text(
                  user.displayName ?? user.email!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 20),

                // ---- TOTAL ENTRIES ----
                Text(
                  "Total entries: $total",
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(height: 20),

                // ---- LAST TWO ENTRIES ----
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Last entries:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),

                for (var entry in lastTwo)
                  _entryCard(context, entry),

                SizedBox(height: 30),

                // ---- FEELINGS STATISTICS ----
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Feelings Usage:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),

                for (var f in counts.keys)
                  _feelingStat(f, counts[f]!, total),

                SizedBox(height: 40),

                // ---- NEW ENTRY BUTTON ----
                ElevatedButton(
                  onPressed: () => _openNewEntryDialog(context),
                  child: Text("Add New Entry"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ------------------- ENTRY CARD ---------------------
  Widget _entryCard(context, entry) {
    return GestureDetector(
      onTap: () => _openEntry(context, entry),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
          ],
        ),
        child: Row(
          children: [
            Text(entry["feeling"], style: TextStyle(fontSize: 28)),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry["date"],
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text(entry["title"],
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ],
            )
          ],
        ),
      ),
    );
  }

  // ------------------- FEELING STAT ROW ---------------------
  Widget _feelingStat(String emoji, int count, int total) {
    final percent = ((count / total) * 100).toStringAsFixed(1);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$emoji", style: TextStyle(fontSize: 24)),
          SizedBox(width: 10),
          Text("$percent%", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  // ------------------- VIEW ENTRY ---------------------
  void _openEntry(context, entry) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("${entry['feeling']}   ${entry['title']}"),
        content: Text(entry["content"]),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
          TextButton(
            onPressed: () async {
              await db
                  .collection("users")
                  .doc(user.email)
                  .collection("entries")
                  .doc(entry.id)
                  .delete();
              Navigator.pop(context);
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _openNewEntryDialog(context) {
    String title = "";
    String content = "";
    String selectedFeeling = "";
    final feelings = ["😀", "😊", "😐", "😢", "😡"];

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFF8FBEF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "New Entry",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E613D),
                      ),
                    ),

                    SizedBox(height: 20),

                    // TITLE
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      onChanged: (v) => title = v,
                    ),

                    // FEELING EMOJI PICKER
                    SizedBox(height: 20),
                    Text("Feeling", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: feelings.map((f) {
                        final isSelected = (selectedFeeling == f);
                        return GestureDetector(
                          onTap: () => setState(() => selectedFeeling = f),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? Colors.green.withOpacity(0.25)
                                  : Colors.transparent,
                            ),
                            child: Text(
                              f,
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 20),

                    // CONTENT
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(labelText: "Content"),
                      onChanged: (v) => content = v,
                    ),

                    SizedBox(height: 20),

                    // BUTTON ROW
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (title.isEmpty || content.isEmpty || selectedFeeling.isEmpty) return;

                            final date = DateTime.now().toIso8601String().split("T")[0];

                            await db
                                .collection("users")
                                .doc(user.email)
                                .collection("entries")
                                .add({
                              "title": title,
                              "content": content,
                              "feeling": selectedFeeling,
                              "date": date,
                            });

                            Navigator.pop(context);
                          },
                          child: Text("Add"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}
