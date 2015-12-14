### 依赖
- ruby 2.x
- sqlite3

### 安装
- git clone git@github.com:songjiayang/fund_sugar.git 
- bundle install 

### 如何工作
- 程序分为爬虫和筛选条件模块，分别位于 lib/spider 和 lib/tasks/filter.rake,可以自定义自己的爬虫和筛选条件。
- 执行 `rake -T | grep fund_filters` 列出所有筛选条件， 例如 `rake fund_filters:4433` 。


