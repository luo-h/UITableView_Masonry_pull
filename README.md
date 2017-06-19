# UITableView_Masonry_pull

![Rendering](ezgif.com-video-to-gif.gif)

- 首页有个简单的下拉放大，上拉导航栏渐变，目前用的是[self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

- 然后是tableView配合masonry的使用，加上UITableView-FDTemplateLayoutCell，主要是有个动态行高的处理和行高的缓存。

- 问题：就是在viewWillDisapear中设置setBackgroundImage为nil，从当前控制器Push到下个控制器的时候或者Pop回来的时候导航栏有个白条，这个不知怎么解决，希望有解决的不吝赐教


