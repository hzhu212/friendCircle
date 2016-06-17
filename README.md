# friendCircle

## 待完成的任务

- [ ] 数据库设计，设计的同时完成E-R图；
- [ ] 确定功能模块——有几个页面，各个页面有哪些内容等；
- [ ] 确定前端样式（偷懒一下，可以借鉴微信朋友圈或者微博的前端样式）

:smile::smile:暂时先做这些吧，后面的再说……

---

## 附

### eclipse-jee下开发jsp项目前期配置

1. 必须使用eclipse-jee（eclipse-Java不能创建jsp项目）；
2. 首先将eclipse-jee与tomcat关联起来。【1】[关联已安装的tomcat](http://jingyan.baidu.com/article/ca2d939dd90183eb6d31ce79.html)【2】[直接通过eclipse-jee安装tomcat](http://jingyan.baidu.com/article/3065b3b6efa9d7becff8a4c6.html)
3. 创建jsp项目。File->New->Other，打开后找到web->Dynamic Web Project
4. 创建完成后，在`WebContent`目录下创建jsp文件，就可以开始工作了；
5. 如果要使用数据库，需要首先安装数据库（统一用MySQL吧），然后把相应的**数据库驱动**程序包复制到`WebContent`->`WEB-INF`->`lib`目录下，无需配置Build Path（数据库驱动是一个jar包，类似于这样：`mysql-connector-java-5.1.39-bin.jar`，[官网下载地址](http://dev.mysql.com/downloads/connector/j/)）
6. 在预览或运行jsp项目时，可以使用eclipse内置的浏览器，也可以使用电脑上的其他浏览器。设置：菜单栏`Window`->`Web Browser`下
