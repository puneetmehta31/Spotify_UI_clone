import 'package:flutter/material.dart';
import 'package:spotify_music_player_clone/models/playlist_model.dart';
import 'package:spotify_music_player_clone/models/song_model.dart';
import 'package:spotify_music_player_clone/widgets/playlist_card.dart';
import 'package:spotify_music_player_clone/widgets/song_card.dart';

import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playlists;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.lightBlue.shade600.withOpacity(0.8),
          Colors.lightBlue.shade200.withOpacity(0.8),
          Colors.lightBlue.shade300.withOpacity(0.8),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),
              _TrendingMusic(songs: songs),
              _PlaylistMusic(playlists: playlists),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    super.key,
    required this.playlists,
  });

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'PlayLists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return PlaylistCard(playlist: playlists[index]);
            },
          )
        ],
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: "Trending Music"),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          Text('Enjoy Your Favourite Music',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.lightBlue.shade100,
              hintText: 'Search',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.lightBlue.shade600,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
              ),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
            label: 'Favorite'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_circle),
            ),
            label: 'Play'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const ProfilePage();
                }));
              },
              icon: const Icon(Icons.person),
            ),
            label: 'Profile'),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.lightBlue.shade600.withOpacity(0.8),
          Colors.lightBlue.shade200.withOpacity(0.8),
          Colors.lightBlue.shade300.withOpacity(0.8),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade300,
          title: Text(
            'My Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue.shade50,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue.shade200,
                  image: DecorationImage(
                    image: AssetImage('assets/images/Anime Boy.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.lightBlue.shade100,
                    width: 3,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ListTile(
                leading: Icon(
                  Icons.person_pin_sharp,
                  color: Colors.lightBlue.shade100,
                ),
                tileColor: Colors.lightBlueAccent.withOpacity(0.4),
                title: Text('NAME'),
                subtitle: Text('NAMAN AGRAWAL'),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(
                  Icons.calendar_month,
                  color: Colors.lightBlue.shade100,
                ),
                tileColor: Colors.lightBlueAccent.withOpacity(0.4),
                title: Text('DOB'),
                subtitle: Text('11-12-2004'),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(
                  Icons.business_outlined,
                  color: Colors.lightBlue.shade100,
                ),
                tileColor: Colors.lightBlueAccent.withOpacity(0.4),
                title: Text('COLLEGE'),
                subtitle: Text('GLOBAL INSTITUTE OF TECHNOLOGY'),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.lightBlue.shade100,
                ),
                tileColor: Colors.lightBlueAccent.withOpacity(0.4),
                title: Text('COUNTRY'),
                subtitle: Text('INDIA'),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Colors.lightBlue.shade100,
                ),
                tileColor: Colors.lightBlueAccent.withOpacity(0.4),
                title: Text('STATE/CITY'),
                subtitle: Text('RAJASTHAN/JAIPUR'),
                trailing: Icon(Icons.navigate_next),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''Thank You For Checking Out My Profile 
                               .....''',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 135,
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.lightBlue.shade600,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.white,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      icon: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const HomeScreen();
                          }));
                        },
                        icon: const Icon(
                          Icons.home,
                        ),
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                      ),
                      label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle),
                      ),
                      label: 'Play'),
                  BottomNavigationBarItem(
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person),
                      ),
                      label: 'Profile'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.grid_view_rounded),
        color: Colors.white,
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Anime Boy.jpeg')),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
