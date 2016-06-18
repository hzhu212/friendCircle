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
5. 如果要使用数据库，需要首先安装数据库（统一用MySQL吧），然后把相应的**数据库驱动**程序包复制到`WebContent`->`WEB-INF`->`lib`目录下，无需配置Build Path（数据库驱动是一个jar包，类似于这样：`mysql-connector-java-5.1.39-bin.jar`，[官网下载地址](http://dev.mysql.com/downloads/connector/j/)（**已经放在项目里了，不用下载**））
6. 在预览或运行jsp项目时，可以使用eclipse内置的浏览器，也可以使用电脑上的其他浏览器。设置：菜单栏`Window`->`Web Browser`下

### MySQL相关

#### mysql配置

##### 将mysql的默认字符集改为utf-8（**重要**，否则不能显示中文）

[ubuntu下修改mysql默认编码](http://www.jb51.net/article/33569.htm)

[windows下修改mysql默认编码](http://www.cnblogs.com/24la/p/update-mysql-default-character.html)

**注：**有时windows下MySQL的安装目录中没有配置文件`my.ini`，只有`my-default.ini`（不同版本的MySQL情况不同），这时只需要将`my-default.ini`原地复制一份并更名为`my.ini`即可。修改配置一律在`my.ini`中进行。

##### 远程登陆mysql数据库：

```
mysql -h 192.168.xxx.xx -u username -p
```

注：`-h`表示数据库主机IP地址，`-u`表示用户名，`-p`表示使用密码

---

#### windows下mysql常见故障

##### 1.找不到mysql命令

```cmd
C:\WINDOWS\system32>mysql --version
mysql不是内部或外部命令，也不是可运行的程序或批处理文件。
```

原因：mysql未加入环境变量

解决：将mysql安装目录下的`bin`目录加入系统`path`环境变量

正确执行结果如下：

```cmd
C:\WINDOWS\system32>mysql
ERROR 1045 (28000): Access denied for user 'ODBC'@'localhost' (using password: NO)
```

##### 2. 打开mysql报错

```cmd
C:\Users\Haley>mysql
ERROR 2003 (HY000): Can't connect to MySQL server on 'localhost' (10061)
```

原因：没有开启mysql服务

解决：控制台执行`net start mysql`

正确执行结果如下：

```cmd
C:\WINDOWS\system32>net start mysql
mysql 服务正在启动 ...
mysql 服务已经启动成功。
```

##### 3. 开启mysql服务出错

```cmd
C:\Users\Haley>net start mysql
服务名无效。
请键入 NET HELPMSG 2185以获得更多的帮助。
```
原因：mysql服务未安装或名称输入错误（其真实名称可能是MySQL/mysql57等）

解决：

①首先确定是否是服务名称错误：按`Win+R`组合键，打开“运行”对话框，输入`services.msc`，回车，查看所有服务，浏览有无mysql开头的服务，确定真实的服务名称。

②如果没有上述服务，则需要安装该服务：在命令行中输入`mysqld -install mysql`，如下：

```cmd
C:\WINDOWS\system32>mysqld -install mysql
Service successfully installed.
```

安装成功之后重新运行命令：`net start mysql`即可。

正确执行结果如下：

```cmd
C:\WINDOWS\system32>net start mysql
mysql 服务正在启动 ...
mysql 服务已经启动成功。
```

##### 4. 安装mysql服务出错

```cmd
C:\Users\Haley>mysqld -install mysql
Install/Remove of the Service Denied!
```

原因：权限不够，访问被拒绝

解决：以管理员的身份运行cmd，然后再输入以上命令即可

正确执行结果如下：

```cmd
C:\WINDOWS\system32>mysqld -install mysql
Service successfully installed.
```

---

#### mysql相关使用技巧

##### 1. 导入外部数据库的数据

首先下载并解压官网上给出的样例数据库，得到后缀名为`.sql`的文件，控制台登录进入想要导入的数据库，使用`source`命令导入数据，如下：

```cmd
mysql> source C:\\Users\\Haley\\Desktop\\world.sql;
```
