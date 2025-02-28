import 'package:closet_ui/common_widget/custom_button.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _priceValue = 100;

  final List<String> tabTitles = [
    "Lowest",
    "Highest",
    "Best",
    "Newest",
    "Discount",
  ];

  // Categories with associated items.
  final List<List<String>> categories = [
    ["Fresh Fruits", "Fresh Vegetables", "Mushrooms", "Fresh Fishes"],
    ["Meat", "Dairy Products", "Frozen Foods", "Organic"],
    ["Fast Food", "Bakery", "Confectionery", "Beverages"],
    ["Snacks", "Gourmet", "Seafood", "Pasta"],
    ["Health", "Beauty", "Skincare", "Supplements"],
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search Filters"),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              100,
            ), // Adjusted height for the space
            child: Column(
              children: [
                // Row for "Sort By" and "All Clear"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sort By",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "All Clear",
                          style: TextStyle(color: Color(0xFFAD16AA)),
                        ),
                      ),
                    ],
                  ),
                ),
                // TabBar
                Container(
                  // color: Color(0xFFFFDBFE),
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
                    isScrollable: true, // Disable scrolling for fixed width
                    labelPadding: EdgeInsets.zero, // Remove default padding
                    labelColor: Colors.white, // Color for selected tab
                    unselectedLabelColor:
                        Colors.black, // Color for unselected tab
                    indicator: BoxDecoration(
                      color: Color(0xFFAD16AA), // Selected tab color
                      borderRadius: BorderRadius.circular(
                        8,
                      ), // Rounded corners for indicator
                    ),
                    tabs:
                        tabTitles.map((title) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 3,
                              bottom: 3,
                              right: 4.0,
                              left: 4.0,
                            ),
                            child: Tab(
                              child: Container(
                                alignment:
                                    Alignment.center, // Center text in the tab
                                width: 80, // Fixed width for each tab
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1,
                                  ), // Border for partition
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ), // Rounded corners
                                ),
                                child: Text(title), // Tab title text
                              ),
                            ),
                          );
                        }).toList(), // Convert iterable to list
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(tabTitles.length, (index) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: _priceValue,
                    min: 20,
                    max: 200,
                    divisions: 9,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        _priceValue = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("\$20"), Text("\$200")],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  // Pass dynamic item count from categories
                  ...categories[index]
                      .map(
                        (item) => _categoryItem(item, categories[index].length),
                      )
                      .toList(),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(label: "Apply Filter", onpress: () {}),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  // Updated method to receive dynamic item count
  Widget _categoryItem(String title, int itemCount) {
    return ListTile(
      leading: Icon(Icons.shopping_bag, color: Colors.blue),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dynamically show the item count
          Text("$itemCount Items", style: TextStyle(color: Colors.grey)),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
      onTap: () {},
    );
  }
}
