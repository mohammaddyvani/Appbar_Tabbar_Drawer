import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("NOAH",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    background: Image(
                      image: AssetImage('assets/images/TL.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                        new Tab(icon: new Icon(Icons.album), text: "Albums"),
                        new Tab(icon: new Icon(Icons.multitrack_audio), text: "Track"),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                song(),
                albums(),
                track(),
              ],
            )),
      ),
    );
  }
}

class song extends StatelessWidget {
  final List albumTL = [
    [
      "Sahabat",
      "NOAH"
    ],
    [
      "Aku & Bintang",
      "NOAH"
    ],
    [
      "Semua Tentang Kita",
      "NOAH"
    ],
    [
      "Dan Hilang",
      "NOAH"
    ],
    [
      "Satu Hati",
      "NOAH"
    ],
    [
      "Mimpi Yang Sempurna",
      "NOAH"
    ],
    [
      "Taman Langit",
      "NOAH"
    ],
    [
      "Yang Terdalam",
      "NOAH"
    ],
    [
      "Tinggalkan Waktu",
      "NOAH"
    ],
    [
      "Kita Tertawa",
      "NOAH"
    ],
    [
      "Topeng",
      "NOAH"
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(albumTL[index][0], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            subtitle: Text(albumTL[index][1]),
            leading: Icon(Icons.audiotrack),
          ));
        },
        itemCount: albumTL.length,
      ),
    );
  }
}

class albums extends StatelessWidget {
  final List albumsNoah = [
    [
      "assets/images/TL.jpg",
      "Taman Langit"
    ],
    [
      "assets/images/BDS.jpg",
      "Bintang di Surga"
    ],
    [
      "assets/images/HYC.jpg",
      "Hari Yang Cerah"
    ],
    [
      "assets/images/SL.jpg",
      "Sings Legends"
    ],
    [
      "assets/images/SS.jpg",
      "Seperti Seharusnya"
    ],
    [
      "assets/images/SC.jpg",
      "Second Chance"
    ],
    [
      "assets/images/KK.jpg",
      "Keterikatan Keterkaiatan"
    ],
    [
      "assets/images/SLA.jpg",
      "Suara Lainnya"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(
                  albumsNoah[index][0],
                  height: 130.0,
                  width: 130.0,
                ),
                Text(albumsNoah[index][1]),
              ],
            ),
          );
        },
        itemCount: albumsNoah.length,
      ),
    );
  }
}

class track extends StatelessWidget {
  final List songtrack = [
    [
      "Sahabat",
      "NOAH"
    ],
    [
      "Aku & Bintang",
      "NOAH"
    ],
    [
      "Semua Tentang Kita",
      "NOAH"
    ],
    [
      "Dan Hilang",
      "NOAH"
    ],
    [
      "Satu Hati",
      "NOAH"
    ],
    [
      "Mimpi Yang Sempurna",
      "NOAH"
    ],
    [
      "Taman Langit",
      "NOAH"
    ],
    [
      "Yang Terdalam",
      "NOAH"
    ],
    [
      "Tinggalkan Waktu",
      "NOAH"
    ],
    [
      "Kita Tertawa",
      "NOAH"
    ],
    [
      "Topeng",
      "NOAH"
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(songtrack[index][0]),
            subtitle: Text(songtrack[index][1]),
            leading: Icon(Icons.audiotrack),
          ));
        },
        itemCount: songtrack.length,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
        child: _tabBar,
        decoration: BoxDecoration(
          color: Colors.white,
        ));
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
