class BookDonation {
  final String id;
  final String title;
  final String author;
  final String condition;
  final String genre;
  final String donorName;
  final DateTime donationDate;
  final String coverImageUrl;

  BookDonation({
    required this.id,
    required this.title,
    required this.author,
    required this.condition,
    required this.genre,
    required this.donorName,
    required this.donationDate,
    required this.coverImageUrl,
  });
}

// Dummy data for book donations
class BookDonationData {
  static List<BookDonation> getDummyBookDonations() {
    return [
      BookDonation(
        id: '1',
        title: 'To Kill a Mockingbird',
        author: 'Harper Lee',
        condition: 'Like New',
        genre: 'Classic Literature',
        donorName: 'Emily Johnson',
        donationDate: DateTime(2024, 3, 15),
        coverImageUrl: 'https://example.com/mockingbird.jpg',
      ),
      BookDonation(
        id: '2',
        title: 'The Hobbit',
        author: 'J.R.R. Tolkien',
        condition: 'Good',
        genre: 'Fantasy',
        donorName: 'Michael Chen',
        donationDate: DateTime(2024, 3, 10),
        coverImageUrl: 'https://example.com/hobbit.jpg',
      ),
      BookDonation(
        id: '3',
        title: 'Python Crash Course',
        author: 'Eric Matthes',
        condition: 'Very Good',
        genre: 'Programming',
        donorName: 'Sarah Rodriguez',
        donationDate: DateTime(2024, 3, 5),
        coverImageUrl: 'https://example.com/python.jpg',
      ),
      BookDonation(
        id: '4',
        title: 'The Alchemist',
        author: 'Paulo Coelho',
        condition: 'Acceptable',
        genre: 'Fiction',
        donorName: 'David Kim',
        donationDate: DateTime(2024, 2, 28),
        coverImageUrl: 'https://example.com/alchemist.jpg',
      ),
      BookDonation(
        id: '5',
        title: 'Atomic Habits',
        author: 'James Clear',
        condition: 'Like New',
        genre: 'Self-Help',
        donorName: 'Emma Watson',
        donationDate: DateTime(2024, 2, 20),
        coverImageUrl: 'https://example.com/habits.jpg',
      ),
    ];
  }
}