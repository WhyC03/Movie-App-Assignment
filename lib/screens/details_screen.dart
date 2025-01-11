import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = '/details-screen';
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    if (args == null) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Center(
            child: Text("No Data"),
          ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(args['name']?.toString() ?? 'args Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (args['image']?['original'] != null)
                Center(
                  child: Image.network(
                    args['image']['original'],
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          args['name']?.toString() ?? 'No Title',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        ' ${args['rating']['average']?.toString() ?? '0'} ⭐',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        args['genres'].join(", ")?.toString() ?? '',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 10),
                      Text(
                        args['language']?.toString() ?? 'No Title',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Play",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_download_outlined,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Download",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(height: 5),
                        Text("Info"),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Icon(Icons.add_outlined),
                        SizedBox(height: 5),
                        Text("My List"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //Summary
              Text(
                "Summary",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Text(
                args['summary']
                        ?.toString()
                        .replaceAll(RegExp(r'<[^>]*>'), '') ??
                    'No Summary Available',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
