import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medium_bloc_cache_project/home/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> getPosts() async {
    final postsCubit = context.read<PostsCubit>();
    await postsCubit.getPosts();
  }

  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PostsCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: switch (state) {
        PostsInitial() => const SizedBox.shrink(),
        PostsError() => Center(child: Text(state.error)),
        PostsLoading() => const Center(child: CircularProgressIndicator()),
        PostsLoaded(response: final response) => response.isEmpty
            ? const Center(
                child: Text('No posts to display yet 😊'),
              )
            : RefreshIndicator(
                onRefresh: getPosts,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: response.length,
                  padding: const EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) {
                    final post = response[index];
                    return Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: getRandomColor(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Id: ${post?.id}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Title: ${post?.title}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            'Body: ${post?.body}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      },
    );
  }
}
