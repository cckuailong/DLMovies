## 电影下载链接搜索

### 说明
爬取各电影网站的下载链接，制作了搜索网站

### 技术栈
爬虫：python beautifulsoup

网站：Golang Iris + Mysql

### 部署

- 安装golang
- data/mv_info.sql 导入mysql（提前创建数据库movie）
- 安装代码环境
```
go mod tidy
```
- conf/db.toml 配置数据库信息
- 启动网站
```
go build main.go
```

### 网站效果图

![](https://github.com/cckuailong/DLMovies/blob/master/img/demo.png)

