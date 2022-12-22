import 'package:flutter/material.dart';
import 'package:novels/utilities/routes/screens_route.dart';

class DefaultSearch extends StatelessWidget {
  const DefaultSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 5),
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed(ScreenRoute.searchScreenRoute),
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[300],
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
              Text(
                ' Search',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
