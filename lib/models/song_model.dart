class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coverUrl});

  static List<Song> songs = [
    Song(
        title: 'Aaoge Tum Kabhi',
        description: 'By The Local Train',
        url: 'assets/musics/Aaoge Tum Kabhi.mp3',
        coverUrl: 'assets/images/Aaoge Tum Kabhi.jpg'),
    Song(
        title: 'Humnava Mere',
        description: 'By Jubin Nautiyal',
        url: 'assets/musics/Humnava Mere.mp3',
        coverUrl: 'assets/images/Humnava Mere.jpg'),
    Song(
        title: 'Tu Hai Kahan',
        description: 'By AUR',
        url: 'assets/musics/Tu Hai Kahan.mp3',
        coverUrl: 'assets/images/Tu Hai Kahan.jpg'),
  ];
}
