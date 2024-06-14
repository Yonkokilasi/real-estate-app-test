import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

CachedNetworkImage getCachedNetworkImage({
  required BuildContext context,
  required String imageUrl,
  double? borderRadius,
  required double width,
  required double height,
  EdgeInsetsGeometry? margin,
}) {
  final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  return CachedNetworkImage(
    placeholder: (context, url) => Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        image: DecorationImage(
          image: NetworkImage('https://via.placeholder.com/${width.round()}'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    imageBuilder: (context, imageProvider) => Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    imageUrl: imageUrl,
    width: width,
    height: height,
    maxHeightDiskCache: (height * devicePixelRatio).round(),
    maxWidthDiskCache: (width * devicePixelRatio).round(),
    memCacheHeight: (height * devicePixelRatio).round(),
    memCacheWidth: (width * devicePixelRatio).round(),
    fit: BoxFit.cover,
  );
}

void logThis(dynamic message, {LogFilter? filter}) {
  final Logger logger = Logger(
    filter: filter,
    printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        colors: true,
        printEmojis: true,
        printTime: true,
        lineLength: 120),
  );

  // only log on debug mode
  if (kDebugMode) {
    logger.d(message);
  }
}
