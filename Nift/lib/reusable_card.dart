import 'package:flutter/material.dart';
import 'disscussion_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class ReusableCard extends StatelessWidget {
  ReusableCard({
    this.title,
    this.subtitle,
  });
  final String title;
  final String subtitle;

  // // void getthreads() async {
  // //   final threads = await _firestore.collection('thread').get();
  // //   for (var thread in threads.docs) {
  // //     print(thread.data());
  // //   }
  // // }

  // void threadStream() async {
  //   await for (var snapshot in _firestore.collection('thread').snapshots()) {
  //     for (var thread in snapshot.docs) {
  //       print(thread.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Card(
        elevation: 3.0,
        margin: new EdgeInsets.all(7.0),
        child: new InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute<void>(
            //     builder: (BuildContext context) {
            //       return DiscussionPage();
            //     },
            //   ),
            // );
            //threadStream();
          },
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  //title: Text('Welocome'),
                  title: new Text(
                    title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  //  subtitle: Text(
                  //      'This app works like a forum one has to post thread to get answers from his friends'),),
                  subtitle: new Text(subtitle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThreadStream extends StatelessWidget {
  final ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('thread').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlueAccent,
                ),
              );
            }
            final threads = snapshot.data.docs;
            List<ReusableCard> threadWidgets = [];
            for (var thread in threads) {
              final threadTitle = thread.data()['title'];
              final threadSubtitle = thread.data()['subtitle'];
              final threadWidget = ReusableCard(
                title: threadTitle,
                subtitle: threadSubtitle,
              );
              // Text(
              //   '$threadTitle and $threadSubtitle',
              //   style: TextStyle(fontSize: 100.0),
              // );
              threadWidgets.add(threadWidget);
            }
            return ListView(
              controller: _controller,
              scrollDirection: Axis.vertical,

              addAutomaticKeepAlives: false,

              //padding:EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              reverse: true,
              shrinkWrap: true,
              children: threadWidgets,
            );
          },
        ),
      ],
    );
  }
}
