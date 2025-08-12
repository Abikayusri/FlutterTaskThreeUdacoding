import 'package:flutter/material.dart';
import 'package:task_3/model/movie_list.dart';
import 'package:task_3/presentation/home/movie_card.dart';
import 'package:task_3/static/navigation_route.dart';
import 'package:task_3/style/colors/app_colors.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<MovieModel> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filteredMovies = List.from(movieList);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredMovies = List.from(movieList);
      } else {
        _filteredMovies = movieList.where((movie) {
          final titleMatch =
              movie.title?.toLowerCase().contains(query) ?? false;
          final overviewMatch =
              movie.overview?.toLowerCase().contains(query) ?? false;
          return titleMatch || overviewMatch;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGray,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Hello, ",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: widget.username,
                                  style: const TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "good Morning",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primaryOrange,
                    size: 24,
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _searchController.clear();
                          },
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: AppColors.primaryOrange,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          if (_searchController.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    "Found ${_filteredMovies.length} movie${_filteredMovies.length != 1 ? 's' : ''}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

          if (_searchController.text.isNotEmpty) const SizedBox(height: 8),

          Expanded(
            child: _filteredMovies.isEmpty && _searchController.text.isNotEmpty
                ? _buildNoResultsWidget()
                : ListView.builder(
                    itemCount: _filteredMovies.length,
                    itemBuilder: (context, index) {
                      final movie = _filteredMovies[index];

                      return MovieCard(
                        movie: movie,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NavigationRoute.detailRoute.name,
                            arguments: movie,
                          );
                        },
                      );
                    },
                  ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildNoResultsWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            "No movies found",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Try searching with different keywords",
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
