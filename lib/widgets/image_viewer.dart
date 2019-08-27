import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

const kTranslucentBlackColor = const Color(0x66000000);
const _kMaxDragSpeed = 400.0;

class ImageViewer extends StatefulWidget {
  ImageViewer({
    this.initialIndex = 0,
    this.imageProviders,
  });

  final int initialIndex;
  final List<ImageProvider> imageProviders;

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer>
    with TickerProviderStateMixin {
  PageController _pageController;
  int _currentPageIndex;
  bool _isLocked = false;

  double _start;
  double _last;
  AnimationController _offsetController;
  Animation<Offset> _offsetAnimation;
  Tween<Offset> _offsetTween;
  // bool _isDragging = false;

  AnimationController _opacityController;
  Animation<double> _opacityAnimation;
  Tween<double> _opacityTween;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialIndex ?? 0);
    _currentPageIndex = widget.initialIndex ?? 0;

    _offsetController =
        AnimationController(vsync: this, duration: Duration.zero);
    _offsetTween = Tween<Offset>(begin: Offset.zero, end: Offset.zero);
    _offsetAnimation = _offsetTween.animate(
      CurvedAnimation(
        parent: _offsetController,
        curve: Curves.easeOut,
      ),
    );

    _opacityController =
        AnimationController(vsync: this, duration: Duration.zero);
    _opacityTween = Tween<double>(begin: 1.0, end: 0.0);
    _opacityAnimation = _opacityTween.animate(_opacityController);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _offsetController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageView = PageView.builder(
      itemBuilder: _buildPage,
      physics: _isLocked || widget.imageProviders.length <= 1
          ? const NeverScrollableScrollPhysics()
          : null,
      controller: _pageController,
      onPageChanged: _onPageChanged,
    );

    return OffsetTransition(
      offset: _offsetAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: _wrapWithCloseGesture(child: pageView),
      ),
    );
  }

  void _onScaleStateChanged(PhotoViewScaleState scaleState) {
    setState(() {
      _isLocked = scaleState != PhotoViewScaleState.initial;
    });
  }

  void _onPageChanged(int index) {
    setState(() => _currentPageIndex =
        mapToRange(index, 0, widget.imageProviders.length - 1));
  }

  void _onDragStart(DragStartDetails details) {
    _start = details.globalPosition.dy;

    // setState(() => _isDragging = true);
  }

  void _onDrag(double dy) {
    if (dy < 0) {
      return;
    }
    _last = dy;
    _offsetTween.begin = Offset.zero;
    _offsetTween.end = Offset(0, dy);

    _offsetController.duration = Duration.zero;
    _offsetController.reset();
    _offsetController.forward();

    _opacityTween.begin = _opacityTween.end;
    _opacityTween.end = mapValue(dy < 0 ? dy.abs() : dy, 0,
        MediaQuery.of(context).size.height, 1.0, 0.0);
    _opacityController.duration = Duration.zero;
    _opacityController.reset();
    _opacityController.forward();
  }

  void _onDragEnd(double velocity) {
    if (_last == null) return;
    _start = null;

    if ((velocity < 0 ? velocity.abs() : velocity) > _kMaxDragSpeed ||
        (_offsetTween.end.dy < 0
                ? _offsetTween.end.dy.abs()
                : _offsetTween.end.dy) >=
            MediaQuery.of(context).size.height / 2) {
      Navigator.of(context).pop();
    } else {
      _opacityTween.begin = _opacityTween.end;
      _opacityTween.end = 1.0;
      _opacityController.duration = Duration(milliseconds: 200);
      _opacityController.reset();
      _opacityController.forward();

      _offsetTween.begin = Offset(0, _offsetTween.end.dy);
      _offsetTween.end = Offset.zero;
      _offsetController.duration = Duration(milliseconds: 200);
      _offsetController.reset();
      _offsetController.forward();
    }

    // setState(() => _isDragging = false);
  }

  Widget _buildPage(_, int index) {
    final idx = mapToRange(index, 0, widget.imageProviders.length - 1);
    final ImageProvider provider = widget.imageProviders[idx];

    return ZoomableImage(
      imageProvider: provider,
      onScaleStateChanged: _onScaleStateChanged,
    );
  }

  Widget _wrapWithCloseGesture({Widget child}) {
    return GestureDetector(
      onVerticalDragStart: _isLocked ? null : _onDragStart,
      onVerticalDragUpdate: _isLocked
          ? null
          : (details) {
              _onDrag(details.globalPosition.dy - _start);
            },
      onVerticalDragCancel: _isLocked ? null : () => _onDragEnd(0.0),
      onVerticalDragEnd: _isLocked
          ? null
          : (details) {
              _onDragEnd(details.velocity.pixelsPerSecond.dy);
            },
      child: child,
    );
  }
}

class ZoomableImage extends StatefulWidget {
  ZoomableImage({
    this.imageProvider,
    this.onScaleStateChanged,
  });

  final ImageProvider imageProvider;
  final PhotoViewScaleStateChangedCallback onScaleStateChanged;

  @override
  _ZoomableImageState createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  final _controller = PhotoViewScaleStateController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: widget.imageProvider,
      loadingChild: Center(
        child: CupertinoActivityIndicator(),
      ),
      enableRotation: false,
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      maxScale: 5.0,
      scaleStateController: _controller,
      scaleStateChangedCallback: (s) {
        if (widget.onScaleStateChanged == null ||
            s == PhotoViewScaleState.covering) {
          return;
        }
        widget.onScaleStateChanged(s);
      },
    );
  }
}

double mapValue(
    double value, double low1, double high1, double low2, double high2) {
  return low2 + (high2 - low2) * (value - low1) / (high1 - low1);
}

int mapToRange(int value, int low, int high) {
  assert(low <= high);
  if (value >= low && value <= high) {
    return value;
  }

  int len = high - low + 1;
  return value % len;
}

class OffsetTransition extends AnimatedWidget {
  const OffsetTransition({
    Key key,
    @required Animation<Offset> offset,
    this.child,
  }) : super(key: key, listenable: offset);

  final Widget child;

  Animation<Offset> get offset => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset.value,
      child: child,
    );
  }
}
