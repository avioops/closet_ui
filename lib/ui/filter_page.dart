import 'package:closet_ui/common_widget/custom_button.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage>
    with SingleTickerProviderStateMixin {
  double _priceValue = 100;
  late TabController _tabController; // Declare TabController

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
  void initState() {
    super.initState();
    _tabController = TabController(length: tabTitles.length, vsync: this);

    // Add a listener to the TabController to update the UI on index change
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Filters"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(95),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sort By",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "All Clear",
                        style: TextStyle(
                          color: Color(0xFFAD16AA),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // TabBar with the controller set to _tabController
              Container(
                child: TabBar(
                  dividerColor: Colors.transparent,
                  controller: _tabController, // Using the TabController
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelPadding: EdgeInsets.zero,
                  labelColor: Colors.white, // Color for selected tab text
                  unselectedLabelColor:
                      Colors.black, // Color for unselected tab text
                  indicator: BoxDecoration(
                    color:
                        Colors
                            .transparent, // Transparent indicator (we'll handle it manually)
                  ),
                  tabs:
                      tabTitles.map((title) {
                        int index = tabTitles.indexOf(title);
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 3,
                            bottom: 3,
                            right: 4.0,
                            left: 4.0,
                          ),
                          child: Tab(
                            child: Container(
                              alignment: Alignment.center,
                              width: 74,
                              height: 27,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(3),
                                // Conditional background color for selected/unselected tabs
                                color:
                                    _tabController.index == index
                                        ? Color(
                                          0xFFAD16AA,
                                        ) // Full purple for selected tab
                                        : Color(
                                          0xFFE1B3D9,
                                        ), // Light purple for unselected tabs
                              ),
                              child: Text(
                                title,
                                style: TextStyle(
                                  color:
                                      _tabController.index == index
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
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
                ...categories[index]
                    .map(
                      (item) => _categoryItem(item, categories[index].length),
                    )
                    .toList(),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(label: "Apply Filters", onpress: () {}),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _categoryItem(String title, int itemCount) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.shopping_bag, color: Colors.blue, size: 18),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$itemCount Items",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Icon(Icons.chevron_right, color: Colors.grey, size: 18),
        ],
      ),
      onTap: () {},
    );
  }
}
