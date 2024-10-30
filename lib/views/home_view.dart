import 'dart:math';

import 'package:perpustakaan/const.dart';
import 'package:perpustakaan/models/category_model.dart';
import 'package:perpustakaan/views/detail_view.dart';
import 'package:perpustakaan/views/genre_view.dart';
import 'package:perpustakaan/widgets/modal.dart';
import 'package:perpustakaan/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/book_model.dart';

class HomePageBook extends StatefulWidget {
  const HomePageBook({super.key});

  @override
  State<HomePageBook> createState() => _HomePageBookState();
}

class _HomePageBookState extends State<HomePageBook> {
  final formKey = GlobalKey<FormState>();
  BookController book = BookController();
  TextEditingController poster = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController genre = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController writer = TextEditingController();
  List buttonChoice = ["Update", "Hapus"];
  List? buku;
  int? buku_id;
  getBuku() {
    setState(() {
      buku = book.book;
    });
  }

  late PageController controller;
  double pageoffSet = 1;
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();
    getBuku();
    controller = PageController(
      initialPage: 1,
      viewportFraction: 0.6,
    )..addListener(() {
        setState(() {
          pageoffSet = controller.page!;
        });
      });
  }

  void despose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: headerParts(),
      body: Column(
        children: [
          const SizedBox(height: 35),
          searchField(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                categoryItems(),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Recommended For You!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PageView.builder(
                        controller: controller,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index % book.book.length;
                          });
                        },
                        itemBuilder: (context, index) {
                          double scale = max(
                            0.6,
                            (1 - (pageoffSet - index).abs() + 0.6),
                          );
                          double angle = (controller.position.haveDimensions
                                  ? index.toDouble() - (controller.page ?? 0)
                                  : index.toDouble() - 1) *
                              5;
                          angle = angle.clamp(-5, 5);
                          final buku = book.book[index % book.book.length];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BookDetailPage(Book: buku),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 100 - (scale / 1.6 * 100),
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Transform.rotate(
                                    angle: angle * pi / 90,
                                    child: Hero(
                                      tag: buku.poster,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Stack(children: [
                                          Image.asset(
                                            buku.poster,
                                            height: 300,
                                            width: 205,
                                            fit: BoxFit.cover,
                                          ),
                                          PopupMenuButton(
                                            itemBuilder:
                                                (BuildContext context) {
                                              return buttonChoice.map((r) {
                                                return PopupMenuItem(
                                                  value: r,
                                                  child: Text(r),
                                                  onTap: () {
                                                    if (r == "Update") {
                                                      setState(() {
                                                        buku_id =
                                                            book.book[index].id;
                                                      });

                                                      poster.text = book
                                                          .book[index].poster;
                                                      title.text = book
                                                          .book[index].title;
                                                      genre.text = book
                                                          .book[index].genre;
                                                      description.text = book
                                                          .book[index]
                                                          .description;
                                                      stock.text = book
                                                          .book[index].stock
                                                          .toString();
                                                      writer.text = book
                                                          .book[index].writer;
                                                      ModalWidget()
                                                          .showFullModal(
                                                              context,
                                                              addItem(index));
                                                    } else if (r == "Hapus") {
                                                      book.book.removeWhere(
                                                          (item) =>
                                                              item.id ==
                                                              book.book[index]
                                                                  .id);
                                                      getBuku();
                                                    }
                                                  },
                                                );
                                              }).toList();
                                            },
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                          top: 330,
                          child: Row(
                            children: List.generate(
                              book.book.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.only(right: 15),
                                width: currentIndex == index ? 30 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? buttonColor
                                      : Colors.white24,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(0),
    );
  }

  Row categoryItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        categories.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GenreBookPage(
                  genre: categories[index].name,
                  books: book.book,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white10.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  categories[index].emoji,
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                categories[index].name,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addItem(int? index) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
                controller: poster,
                decoration: InputDecoration(
                    label: Text("Gambar"),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus di isi';
                  } else {
                    return null;
                  }
                }),
            TextFormField(
                controller: title,
                decoration: InputDecoration(
                    label: Text("Judul"),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus di isi';
                  } else {
                    return null;
                  }
                }),
            TextFormField(
                controller: genre,
                decoration: InputDecoration(
                    label: Text("Genre"),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus di isi';
                  } else {
                    return null;
                  }
                }),
            TextFormField(
                controller: description,
                decoration: InputDecoration(
                    label: Text("Deskripsi"),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus di isi';
                  } else {
                    return null;
                  }
                }),
            TextFormField(
                controller: stock,
                decoration: InputDecoration(
                    label: Text("Stock"),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus di isi';
                  } else {
                    return null;
                  }
                }),
            TextFormField(
                controller: writer,
                decoration: InputDecoration(
                    label: Text("writer"),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'harus di isi';
                  } else {
                    return null;
                  }
                }),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (index != null && buku_id != null) {
                      final updatedBook = BookModel(
                        id: buku_id ?? 0,
                        poster: poster.text,
                        title: title.text,
                        genre: genre.text,
                        description: description.text,
                        stock: int.tryParse(stock.text) ?? 0,
                        writer: writer.text,
                      );

                      book.book[index] = updatedBook;
                      getBuku();
                      Navigator.pop(context);
                    } else {
                      int _id_buku = buku!.length + 1;
                      buku!.add(BookModel(
                        id: _id_buku,
                        poster: poster.text,
                        title: title.text,
                        genre: genre.text,
                        description: description.text,
                        stock: int.parse(stock.text),
                        writer: writer.text,
                      ));
                      getBuku();
                      Navigator.pop(context);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFffb43b),
                ),
                child: Container(
                  child: Text(
                    "Simpan",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 19),
          filled: true,
          fillColor: Colors.white.withOpacity(0.05),
          hintText: "Search",
          hintStyle: const TextStyle(
            color: Colors.white54,
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 35,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar headerParts() {
    return AppBar(
      backgroundColor: appBackgroundColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome.... ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Colors.white54,
                        ),
                      ),
                      TextSpan(
                        text: "👋",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Let's search and read your book!",
                  style: TextStyle(
                    height: 0.6,
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                )
              ],
            ),
            Container(
              width: 40,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://t3.ftcdn.net/jpg/06/07/84/82/240_F_607848231_w5iFN4tMmtI2woJjMh7Q8mGvgARnzHgQ.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                buku_id = null;
              });
              title.text = '';
              genre.text = '';
              description.text = '';
              stock.text = '';
              writer.text = '';
              ModalWidget().showFullModal(context, addItem(null));
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ))
      ],
    );
  }
}
