import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'NewSitePage.dart';
//import 'package:mis_libros/pages/new_book_page.dart';

class MySitesPage extends StatefulWidget {
  const MySitesPage({Key? key}) : super(key: key);

  @override
  State<MySitesPage> createState() => _MySitesPageState();
}

enum Menu { logOut }

class _MySitesPageState extends State<MySitesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .collection("books")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading');
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot book = snapshot.data!.docs[index];
                  return Card(
                      child: ListTile(
                        title: Text(book['name']),
                        subtitle: Text(book['author']),
                      ));
                },
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewSitePage()));
          },
          tooltip: 'New Book',
          child: const Icon(Icons.add)),
    );
  }
}