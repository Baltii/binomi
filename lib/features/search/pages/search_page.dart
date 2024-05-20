import 'package:binomi/features/annonces/models/annonce.dart';
import 'package:binomi/features/annonces/services/api_annonce.dart';
import 'package:binomi/features/search/services/api_search.dart';
import 'package:binomi/features/search/widget/app_bar_serch.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';
import 'package:binomi/shared/widget/vertical_card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int selectedIndex = 0;
  final SearchService _searchService = SearchService();
  final AnnonceService _annonceService = AnnonceService();
  List<Annonce> _annonces = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadAnnonces();
  }

  Future<void> _loadAnnonces() async {
    try {
      List<Annonce> annonces = await _annonceService.getAnnonces();
      print('Annonces loaded successfully.');

      setState(() {
        _annonces = annonces;
      });
    } catch (e) {
      print('Failed to load annonces: $e');
      // Handle error gracefully, e.g., show an error message
    }
  }

  Future<void> _searchAnnonces(String keyword) async {
    try {
              print("le mot clee $keyword");

      List<Annonce> annonces = await _searchService.searchAnnonces(keyword);
            print('Annonces sucessssssss.');

      setState(() {
        _annonces = annonces;
      });
    } catch (e) {
      print('Failed to search annonces: $e');
      // Handle error gracefully, e.g., show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/searchback.jpg',
              width: double.infinity,
              height: 262.01,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: AppBarSearch(
                onSearch: (keyword) {
                  _searchAnnonces(keyword);
                },
                searchController: _searchController,
              ),
            ),
            Positioned(
              top: 222.01,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: MediaQuery.of(context).size.height - 262.01 - 40,
                child: ListView.builder(
                  itemCount: _annonces.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Annonce annonce = _annonces[index];
                    return VerticalCard(
                      image: 'assets/images/home1.jpg',
                      title: annonce.title,
                      adress: annonce.location,
                      room: annonce.roomNumber,
                      person: annonce.placeInRoom,
                      price: annonce.price.toInt(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        onIndexChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
