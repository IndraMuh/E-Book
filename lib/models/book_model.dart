class BookModel {
  final String poster, title, genre, description, writer;
  final int id, stock;

  BookModel({
    required this.id,
    required this.poster,
    required this.title,
    required this.genre,
    required this.description,
    required this.stock,
    required this.writer,
  });
}

class BookController {
  final List<BookModel> book = [
    BookModel(
      id: 1,
      poster: 'assets/book1.png',
      title: ' Sherlock Holmes : LONDON',
      genre: 'Thriller',
      description:
          "Holmes is known for his brilliant intellect, unique methods of deduction, and his ability to notice the smallest details that others often overlook. Each story typically begins with a mysterious case—whether it's a murder, theft, or other crime—that appears impossible to solve. Watson, who often serves as the narrator, records their adventures and provides insight into Holmes's extraordinary abilities.",
      stock: 9,
      writer: 'Sir Arthur Conan',
    ),
    BookModel(
      id: 2,
      poster: 'assets/book2.png',
      title: 'Dilan 1991',
      genre: "Romance",
      description:
          "The story picks up where Dilan 1990 left off, focusing on the evolving relationship between Dilan and Milea. After officially becoming a couple, they face new challenges that test their bond. Milea worries about Dilan's involvement in his motorcycle gang and his frequent brawls, fearing for his safety. Her attempts to distance him from his risky activities lead to tensions and misunderstandings between them.",
      stock: 8,
      writer: 'Pidi Baiq',
    ),
    BookModel(
      id: 3,
      poster: 'assets/book3.png',
      title: "Harry Potter and the Philosopher's Stone",
      genre: 'Fantasy',
      description:
          "Harry Potter is an eleven-year-old boy who has been living a difficult life with his abusive aunt, uncle, and cousin, the Dursleys, after the mysterious death of his parents. On his eleventh birthday, Harry learns that he is actually a wizard and is invited to attend Hogwarts School of Witchcraft and Wizardry. Hagrid, a giant of a man and the Keeper of Keys at Hogwarts, reveals to Harry that his parents were famous wizards who were killed by the dark wizard Lord Voldemort. Harry also learns that he survived Voldemort's attack as a baby, leaving him with a lightning-shaped scar on his forehead.",
      stock: 8,
      writer: 'J.K. Rowling',
    ),
    BookModel(
      id: 4,
      poster: 'assets/book4.png',
      title: "Spider-Man's Origin Story",
      genre: 'Fantasy',
      description:
          "The story follows Peter Parker, a shy and intelligent high school student living in New York City with his Aunt May and Uncle Ben. Peter's life changes dramatically when he is bitten by a radioactive spider during a school field trip. The bite grants him superhuman abilities, including enhanced strength, agility, the ability to cling to walls, and a heightened 'spider-sense' that warns him of danger.",
      stock: 8,
      writer: 'Stan Lee',
    ),
    BookModel(
      id: 5,
      poster: 'assets/book5.png',
      title: 'Metamorphosis',
      genre: 'Fantasy',
      description:
          "The story centers on Gregor Samsa, a young traveling salesman who wakes up one morning to find himself inexplicably transformed into a gigantic insect (often depicted as a beetle or cockroach). Confused and horrified by his new form, Gregor struggles to adjust to his new reality. His transformation affects every aspect of his life, making it impossible for him to continue working and contributing to his family financially.",
      stock: 7,
      writer: ' Kafka',
    ),
    BookModel(
      id: 6,
      poster: 'assets/book6.png',
      title: 'IT A Novel',
      genre: 'Horror',
      description:
          "IT is a horror novel by Stephen King, published in 1986. The story follows a group of children known as 'The Losers Club' as they confront an evil entity named Pennywise, who takes the form of a clown and appears every 27 years to terrorize the town of Derry, Maine.\n\nThe novel explores themes of friendship, courage, and the battle against fear. As adults, the group members return to Derry to face Pennywise once again and confront the traumas of their past.\n\nIT is renowned for its ability to evoke the deepest fears of readers and has been adapted into films and a miniseries.",
      stock: 7,
      writer: 'Stephen King',
    )
  ];
}
