import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const StyledPagination(),
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
  ));
}

class StyledPagination extends StatefulWidget {
  const StyledPagination({super.key});

  @override
  _StyledPaginationState createState() => _StyledPaginationState();
}

class _StyledPaginationState extends State<StyledPagination> {
  List<int> items = []; // The list of items (numbers)
  int currentPage = 1; // Current page
  final int itemsPerPage = 10; // Number of items per page
  bool isLoading = false; // Is data being loaded?

  @override
  void initState() {
    super.initState();
    loadItems(); // Load the first page
  }

  void loadItems() async {
    if (isLoading) return; // Don't load again if already loading
    setState(() {
      isLoading = true;
    });

    // Simulate loading items (from a server)
    await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds
    List<int> newItems = List.generate(
        itemsPerPage, (index) => (currentPage - 1) * itemsPerPage + index + 1);

    setState(() {
      items.addAll(newItems); // Add new items to the list
      currentPage++; // Move to the next page
      isLoading = false; // Loading finished
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination Example',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.grey[200], // Light background
        child: ListView.builder(
          itemCount: items.length + 1,
          // Extra item for the loading spinner or button
          itemBuilder: (context, index) {
            if (index < items.length) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      items[index].toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    'Item ${items[index]}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: loadItems,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Load More',
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

