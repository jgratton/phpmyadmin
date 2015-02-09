# PHPMyAdmin
PHPMyAdmin MySQL Database Management - Docker Image Builder

[PHPMyAdmin](http://www.phpmyadmin.net/home_page/index.php) is a database management tool using PHP and other languages designed for the the web to manage the [MySQL Relational Database Management System](http://www.mysql.com/).
Website: [http://www.phpmyadmin.net/home_page/index.php](http://www.phpmyadmin.net/home_page/index.php)
Documentation: [http://docs.phpmyadmin.net/en/latest/index.html](http://docs.phpmyadmin.net/en/latest/index.html)

## BASE IMAGE
[library/php:5.6-apache](https://registry.hub.docker.com/_/php/)

STABLE PHPMyAdmin from GitHub: [https://github.com/phpmyadmin/phpmyadmin/tree/STABLE](https://github.com/phpmyadmin/phpmyadmin/tree/STABLE)

## This version of the image is only configured to work with MySQLi and the official Docker [library/mysql](https://registry.hub.docker.com/_/mysql/) image.

### Create a MySQL Container
Basic Setup

```
docker run --name mysql_db_container_name -h mysql_db_host_name -e MYSQL_ROOT_PASSWORD=secretpassword -d mysql
```

### Create the PHPMyAdmin Container
Basic Setup

```
docker run --name phpmyadmin_container_name -h phpmyadmin_host_name --link mysql_db_container_name:mysql -P -d jgratton/phpmyadmin
```

## Finally
Navigate to your installation in the web browser and enjoy.