import 'package:api_integration/api_services/get_service.dart';
import 'package:api_integration/api_services/urls.dart';
import 'package:api_integration/controller/general_controller.dart';
import 'package:api_integration/modules/getApi/posts/repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'logic.dart';

class PostsPage extends StatefulWidget {

  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final logic = Get.put(PostsLogic());

  final state = Get
      .find<PostsLogic>()
      .state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMethod(context, getAllPostsURL, null, false, postsRepo);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return GetBuilder<PostsLogic>(builder: (postsLogic) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Posts'),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          body:
          postsLogic.posts.isEmpty
              ?
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SkeletonLoader(
                period: const Duration(seconds: 2),
                highlightColor: Colors.grey,
                direction: SkeletonDirection.ltr,
                builder: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 20),
                  child: Column(
                    children: List.generate(4, (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width*.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                        const SizedBox(height: 5,),

                        Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width*.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width*.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),
                        const SizedBox(height: 5,),

                        Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width*.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(10)),
                        ),

                      ],
                    ),)
                  ),
                ),
              ),
            ),
          )
              : ListView(
            children: List.generate(
              postsLogic.posts.length,
                  (index) =>
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'User Id:', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${postsLogic.posts[index]['userId']}',

                        ),
                        const Text(
                          'Id:', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${postsLogic.posts[index]['id']}',
                        ),
                        const Text(
                          'Title:', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${postsLogic.posts[index]['title']}',

                        ),
                        const Text(
                          'Body:', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${postsLogic.posts[index]['body']}',

                        ),
                        const Divider(color: Colors.grey),

                      ],
                    ),
                  ),),
          ),

        );
      });
    });
  }
}
