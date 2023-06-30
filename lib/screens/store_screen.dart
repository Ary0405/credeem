import 'package:flutter/material.dart';
import '../data/stores_data.dart';
import '../widgets/store_overview.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFF151517),
        padding: const EdgeInsets.only(top: 18, left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logo.png',
                ),
                // rounded image
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://avatars.githubusercontent.com/u/41837037?v=4"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // search and sort
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: SearchBox(),
                ),
                const SizedBox(width: 10),
                // rounded ripple button
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  splashColor: Colors.white.withOpacity(0.6499999761581421),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F2F30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.sort,
                      color: Colors.white.withOpacity(0.6499999761581421),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // stores list
            Text(
              'Stores Near You',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6000000238418579),
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            //list of stores scrollable cards
            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: ListView.builder(
                  itemCount: storeData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: StoreOverviewCard(
                        name: storeData[index].name,
                        points: storeData[index].points,
                        perksAvailable: storeData[index].perksAvailable,
                        newPerks: storeData[index].newPerks,
                        logoUrl: storeData[index].logoUrl,
                        highlightNewPerks: true,
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF2F2F30),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.6499999761581421),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search For Stores',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6499999761581421),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
