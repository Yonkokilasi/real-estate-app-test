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

List<String> apartmentInteriors = [
  'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1615873968403-89e068629265?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1615529182904-14819c35db37?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1564078516393-cf04bd966897?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
];
