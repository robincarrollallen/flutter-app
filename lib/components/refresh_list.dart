import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/variables/custom.dart';
import '../utils/screen.dart';

/// 列表项部件类型
typedef ItemWidgetBuilder = Widget Function(BuildContext context, int index);

/// 默认列表项部件
ItemWidgetBuilder _defaultItemBuilder = (context, index) {
  return ListTile(
    title: Text('Item $index'),
    leading: CircleAvatar(
      child: Text((index + 1).toString()),
    ),
    onTap: () {
      // 处理点击事件
    },
  );
};

class RefreshList extends StatefulWidget {
  final AsyncCallback onRefresh; // 下拉刷新事件
  final AsyncCallback onLoad; // 上拉加载事件
  final List<dynamic> items; // 列表项数据
  final bool more; // 是否没有更多数据
  final ItemWidgetBuilder itemBuilder; // 用于构建每个列表项的 builder
  final double loadMoreThreshold;

  RefreshList({
    super.key,
    required this.onRefresh,
    required this.onLoad,
    required this.items,
    this.more = true,
    this.loadMoreThreshold = 10.0,
    ItemWidgetBuilder? itemBuilder, // 可选的 itemBuilder 参数
  }) : itemBuilder = itemBuilder ?? _defaultItemBuilder; // 默认值非常量

  @override
  State<RefreshList> createState() => RefreshListState();
}

class RefreshListState extends State<RefreshList> {
  final ScrollController scrollController = ScrollController(); // 用于监听滚动
  bool _isLoading = false; // 标记是否正在加载更多

  @override
  void initState() {
    super.initState();

    _handleRefresh(isRefresh: false); // 首次加载数据

    // 添加滚动监听
    scrollController.addListener(() {
      if (_isLoading) return;

      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - widget.loadMoreThreshold && !_isLoading) {
        setState(() {
          _isLoading = true;
        });
        widget.onLoad().then((_) {
          setState(() {
            if (!mounted) return; // 确认是否还挂载在 content 中
            _isLoading = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose(); // 页面销毁时，释放控制器资源

    super.dispose();
  }

  /// 处理下拉刷新的回调
  Future<void> _handleRefresh({bool isRefresh = true}) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await widget.onRefresh();

    setState(() {
      if (!mounted) return; // 确认是否还挂载在 content 中
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: !widget.more && widget.items.isEmpty
      ? LayoutBuilder( // 使用 LayoutBuilder 确保在可滚动视图中正确显示
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(), // 保持下拉刷新可用
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Padding(
                  padding: EdgeInsetsGeometry.only(bottom: MediaQuery.of(context).padding.bottom),
                  child:  FractionallySizedBox( // 根据父元素的宽高设置大小
                    widthFactor: 0.5, // 宽度是父元素宽度的50%
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1, // 设置宽高比
                          child: SvgPicture.asset(
                            'assets/svg/empty.svg',
                          ),
                        ),
                        Text('No Record', style: TextStyle(color: colors?.textWeaker, fontSize: 14.0.rem()))
                      ],
                    )
                  ),
                )
              )
            )
          );
        }
      )
      : ListView.builder(
        controller: scrollController, // 将控制器附加到 ListView
        itemCount: widget.items.length + 1, // 列表项+1以显示加载指示器
        itemBuilder: (context, index) {
          if (index ==  widget.items.length) {
            return _buildLoadMoreIndicator(_isLoading, widget.more);
          }

          // 否则，显示正常的数据项
          return widget.itemBuilder(context, index);
        },
      ),
    );
  }
}

/// 构建列表底部加载指示器的小部件
Widget _buildLoadMoreIndicator(bool isLoading, bool hasMoreData) {
  if (isLoading) {
    // 正在加载中
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  } else if (!hasMoreData) {
    // 没有更多数据了
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          hasMoreData ? '' : '--- 已经到底了 ---',
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  } else {
    // 还有更多数据，但当前未触发加载，不显示任何东西
    return const SizedBox.shrink();
  }
}