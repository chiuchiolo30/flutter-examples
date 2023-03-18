import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    required this.path,
    super.key,
  });
  final String path;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
      placeholder: const AssetImage('assets/img/loading.gif'),
      placeholderErrorBuilder: (_, __, ___) =>
          const CircularProgressIndicator.adaptive(),
      image: NetworkImage(
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$path',
      ),
      imageErrorBuilder: (_, __, ___) => const _NoPicture(),
    );
  }
}

class _NoPicture extends StatelessWidget {
  const _NoPicture();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Icon(Icons.no_photography, size: 80, color: Color(0xffB1B1B1)),
        Text(
          'NO CONNECTION',
          style: TextStyle(fontSize: 10, letterSpacing: 1),
        )
      ],
    );
  }
}
