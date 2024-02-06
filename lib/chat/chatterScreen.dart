import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String username = 'User';
String email = 'user@example.com';
String? messageText;
User? loggedInUser;

class ChatterScreen extends StatefulWidget {
  final dynamic user;
  const ChatterScreen({
    super.key,
    required this.user,
  });

  @override
  ChatterScreenState createState() => ChatterScreenState();
}

class ChatterScreenState extends State<ChatterScreen> {
  final _textEditingController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool _loaded = false;
  String? docID;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getMessages();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        setState(() {
          username = loggedInUser?.displayName ?? '';
          email = loggedInUser?.email ?? '';
        });
      }
    } catch (e) {
      // EdgeAlert.show(context, title: 'Something Went Wrong', description: e.toString(), gravity: EdgeAlert.BOTTOM, icon: Icons.error, backgroundColor: Colors.deepPurple[900]);
    }
  }

  void getMessages() async {
    final doc = await _firestore
        .collection('messages')
        .where('user_ids.${widget.user.id}', isEqualTo: true)
        .where('user_ids.${_auth.currentUser!.uid}', isEqualTo: true)
        .get();
    if (doc.docs.isNotEmpty) {
      docID = doc.docs.first.id;
      setState(() {
        _loaded = true;
      });
    } else {
      print(docID);
      final doc = await _firestore.collection('messages').add({
        'user_ids': {
          _auth.currentUser!.uid: true,
          widget.user.id: true,
        },
        'user_data': {
          _auth.currentUser!.uid: {
            'name': _auth.currentUser!.displayName ?? '',
          },
          widget.user.id: {
            'name': widget.user.userName ?? '',
          }
        },
        'messages': [],
      });
      docID = doc.id;
      setState(() {
        _loaded = true;
      });
      print(docID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.grey.shade900,
          title: Text(
            widget.user.profileName ?? '',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: _loaded
                  ? StreamBuilder(
                      stream: _firestore.collection('messages').doc(docID).snapshots(includeMetadataChanges: true),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) return const SizedBox();

                        final data = snapshot.data!.data()!;

                        final messages = data['messages'] as List;
                        messages.sort((a, b) => b['time'].compareTo(a['time']));

                        // final readStatusUpdatedList = [...messages];
                        // for (var message in readStatusUpdatedList) {
                        //   if (message['from'] == widget.user.id) {
                        //     message['read'] = true;
                        //   }
                        // }

                        // _firestore.collection('messages').doc(docID).update({
                        //   'messages': readStatusUpdatedList,
                        // });

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.containsKey('messages') ? data['messages'].length : 0,
                          reverse: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            if (widget.user.id != messages[index]['from']) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.25),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        color: Colors.grey.shade900,
                                      ),
                                      child: Text(
                                        messages[index]['content'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                ],
                              );
                            }
                            return Row(
                              children: [
                                const SizedBox(width: 8.0),
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.25),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      messages[index]['content'],
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )
                  : const SizedBox(),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Message...',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 7.0,
                        ),
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  InkWell(
                    onTap: () {
                      if (_textEditingController.text.trim().isNotEmpty) {
                        _firestore.collection('messages').doc(docID).update({
                          'messages': FieldValue.arrayUnion([
                            {
                              'content': _textEditingController.text.trim(),
                              'from': _auth.currentUser!.uid,
                              'read': false,
                              'time': Timestamp.now(),
                            }
                          ]),
                        });
                        _textEditingController.clear();
                      }
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 16.0,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).viewPadding.bottom,
              color: Colors.grey.shade900,
            ),
          ],
        ),
      ),
    );
  }
}
