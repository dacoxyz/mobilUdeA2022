import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'NewSitePage.dart';


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
                .collection("sites")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading');
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot site = snapshot.data!.docs[index];
                  return Card(
                      child: ListTile(
                        title: Text(site['name']),
                        subtitle: Text(site['description']),
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
          tooltip: 'New Site',
          child: const Icon(Icons.add)),
    );
  }
}