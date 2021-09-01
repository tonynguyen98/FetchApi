import 'package:api_fetch/models/rnm_episodes.model.dart';
import 'package:api_fetch/services/rnm_episodes.service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<RnmEpisodeModel>> futureRnmEpisodes;

  @override
  void initState() {
    super.initState();
    futureRnmEpisodes = RnmEpisodeService.fetchRnmEpiodes();
  }

  ListView _episodeListView(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _episodeInfo(
          name: data[index].name,
          airDate: data[index].airDate,
          episode: data[index].episode,
          characterCount: data[index].characters.length,
        );
      },
    );
  }

  ListTile _episodeInfo({
    String name,
    String airDate,
    String episode,
    int characterCount,
  }) =>
      ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          airDate,
        ),
        leading: Text(episode),
        trailing: Text(
          'Character count: $characterCount',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FetchApi'),
      ),
      body: FutureBuilder<List<RnmEpisodeModel>>(
        future: futureRnmEpisodes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _episodeListView(snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
