# Pagination in Flutter

This Flutter project demonstrates how to implement **pagination** in a `ListView` with enhanced UI styles. It is a great starting point for apps requiring infinite scrolling or "Load More" functionality.

## Features
- **Pagination Logic**: Load items in chunks when the user scrolls to the bottom or presses a "Load More" button.
- **Modern UI**: Stylish list items with cards, rounded avatars, and consistent colors.
- **Smooth Loading**: Includes a loading spinner while fetching new data.

---


## Installation

1. Clone this repository:
   ```bash
   git clone <repo_url>
   ```

2. Navigate to the project folder:
   ```bash
   cd styled-pagination
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---



### Key Components

1. **Pagination Logic**:
   - Handles loading of new data when the user reaches the end of the list.
   - Prevents multiple simultaneous data fetches using the `isLoading` flag.

   ```dart
   void loadItems() async {
       if (isLoading) return;
       setState(() { isLoading = true; });

       await Future.delayed(Duration(seconds: 2));
       List<int> newItems = List.generate(itemsPerPage, (index) => (currentPage - 1) * itemsPerPage + index + 1);

       setState(() {
           items.addAll(newItems);
           currentPage++;
           isLoading = false;
       });
   }
   ```

2. **UI Enhancements**:
   - Stylish `ListTile` with a `Card` wrapping for a polished look.
   - Rounded `CircleAvatar` for item numbers.
   - "Load More" button with custom styles.

   ```dart
   Card(
       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
       elevation: 4,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12),
       ),
       child: ListTile(
           leading: CircleAvatar(
               backgroundColor: Colors.deepPurple,
               child: Text(
                   items[index].toString(),
                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
               ),
           ),
           title: Text(
               'Item ${items[index]}',
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
           ),
           trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
       ),
   );
   ```

---



## Customization
- **Colors**:
  Modify the `primarySwatch` in `MaterialApp` or the colors directly in the `CircleAvatar` and buttons.

- **Pagination Behavior**:
  Adjust `itemsPerPage` or add conditions for stopping pagination when all items are loaded.

---

## Contributions
Contributions are welcome! If you have ideas for improving the UI or functionality, feel free to create a pull request.

---

Happy coding! 🚀

