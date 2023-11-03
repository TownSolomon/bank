import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../commons/env.dart';

class CacheImage extends StatefulWidget {
  final String url;
  final Widget? placeWidget;
  final bool fade;
  final BoxFit? fit;
  final bool? enableMemoryCache;
  final double? height;
  final double? width;
  final String? host;
  final Alignment? alignment;

  const CacheImage({
    required this.url,
    super.key,
    this.placeWidget,
    this.fade = true,
    this.fit,
    this.enableMemoryCache,
    this.height,
    this.host,
    this.width,
    this.alignment,
  });

  @override
  State<CacheImage> createState() => _CacheImageState();
}

class _CacheImageState extends State<CacheImage> {
  late String url;
  bool already = false;
  bool? enableMemoryCache;
  double? width;
  double? height;
  BoxFit? fit;
  bool fade = true;
  Widget? placeWidget;
  late Alignment alignment;

  @override
  void initState() {
    url = widget.url;
    enableMemoryCache = widget.enableMemoryCache ?? true;
    width = widget.width;
    height = widget.height;
    fit = widget.fit;
    fade = widget.fade;
    placeWidget = widget.placeWidget;
    alignment = widget.alignment ?? Alignment.center;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CacheImage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.url != widget.url) {
      setState(() {
        url = widget.url;
        width = widget.width;
        height = widget.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(url == ""){
      return Container();
    }

    return CachedNetworkImage(
      placeholder: (context, url) => widget.placeWidget ?? Container(height: height),
      errorWidget: (context, url, _) => const Text("图片加载异常"),
      fadeOutDuration: Duration(milliseconds: (widget.fade ? 1000 : 1)),
      imageUrl: url,
      cacheManager: (Env.isWeb || enableMemoryCache == false) ? null : customImageCacheManager,
      height: height,
      width: width,
      fit: fit ?? BoxFit.fitWidth,
      alignment: alignment,
      httpHeaders: imageHeader,
    );
  }
}

final imageHeader = Env.isWeb
    ? null
    : const {
        "Referer": "bank.townsapi.com",
      };

class CacheImageProvider {
  static ImageProvider url(String url, {String? preUrl}) {
    if (kIsWeb) {
      return NetworkImage(url);
    }

    return CachedNetworkImageProvider(
      url,
      cacheManager: customImageCacheManager,
      headers: imageHeader,
    );
  }
}

CustomImageCacheManager customImageCacheManager = CustomImageCacheManager();

class CustomImageCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'image_v1';

  CustomImageCacheManager() : super(Config(
    key,
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 20,
    fileService: HttpFileService(),
    // fileSystem: IOFileSystem(key),
    repo: JsonCacheInfoRepository(databaseName: key),
  ));
}