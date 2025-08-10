import 'package:flutter/material.dart';
import 'package:task_3/model/movie_list.dart';

import '../../style/colors/app_colors.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movies;

  const MovieDetailScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black, size: 24),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "image/users/ic_users1.jpg",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[600],
                            size: 30,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lucas Wilson",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Thomas Jefferson High School",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primaryYellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.sync, color: Colors.white, size: 20),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Divider(),

            const SizedBox(height: 16),

            Text(
              "Staff available for Lucas Wilson",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 16),

            Divider(),

            const SizedBox(height: 16),
            // Expanded(
            // child: ListView.separated(
            //   itemCount: staffList.length,
            //   separatorBuilder: (context, index) =>
            //       Divider(color: Colors.grey[200], height: 1),
            //   itemBuilder: (context, index) {
            //     return _buildStaffItem(staffList[index]);
            //   },
            // ),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget _buildStaffItem(UsersModel staff) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 16),
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 50,
  //           height: 50,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(25),
  //             child: Image.asset(
  //               staff.profileImage,
  //               fit: BoxFit.cover,
  //               errorBuilder: (context, error, stackTrace) {
  //                 return Container(
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(25),
  //                     color: Colors.grey[300],
  //                   ),
  //                   child: Icon(
  //                     Icons.person,
  //                     color: Colors.grey[600],
  //                     size: 24,
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //
  //         const SizedBox(width: 16),
  //
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 staff.name,
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               Text(
  //                 staff.role,
  //                 style: TextStyle(fontSize: 14, color: Colors.grey[600]),
  //               ),
  //             ],
  //           ),
  //         ),
  //
  //         GestureDetector(
  //           child: Container(
  //             width: 40,
  //             height: 40,
  //             decoration: BoxDecoration(
  //               color: Colors.blue[50],
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             child: Icon(Icons.phone, color: Colors.blue, size: 20),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
