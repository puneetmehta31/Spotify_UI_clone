import 'package:spotify_music_player_clone/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Love Songs',
      songs: Song.songs,
      imageUrl:
          'https://images.unsplash.com/photo-1721539584859-9fea914ae2fe?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Playlist(
      title: 'Party Songs',
      songs: Song.songs,
      imageUrl:
          'https://images.unsplash.com/photo-1721539584865-134ea847dbaf?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Playlist(
      title: 'Sad Songs',
      songs: Song.songs,
      imageUrl:
          'https://images.unsplash.com/photo-1676188114945-efdc6d290dbb?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
  ];
}
