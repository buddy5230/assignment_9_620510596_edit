import 'package:flutter/material.dart';
import 'video_play.dart';
void main() {
  runApp(const MyApp());
}

final List<Map<String, dynamic>> _videos = [
  {      'title': 'Big Buck Bunny',
          'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          'thumbnail': 'lib/images/bigbuckbunny.jpg',
          'user':'UserA',
          'description':'58k views . 6 hours ago',
  },
  {      'title': 'Elephant Dream',
          'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
          'thumbnail': 'lib/images/elephants_dream1.jpg',
          'user':'UserB',
          'description':'100k views . 1 years ago',
  },
  {      'title': 'For Bigger Blazes',
          'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
          'thumbnail': 'lib/images/forbiggerblazes.jpg',
          'user':'UserC',
          'description':'45k views . 2 days ago',
  },
  {      'title': 'For Bigger Escape',
          'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
          'thumbnail': 'lib/images/forbigescape.jpg',
          'user':'UserD',
          'description':'6.2k views . 10 hours ago',
  },
  {      'title': 'Sintel',
          'url': 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
          'thumbnail': 'lib/images/Sintel_poster.jpg',
          'user':'UserE',
          'description':'10k views . 4 months ago',
  },
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          final video = _videos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    title: video['title'],
                    url: video['url'],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    video['thumbnail'],
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video['title'],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Description: ${video['description']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: video['user'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}