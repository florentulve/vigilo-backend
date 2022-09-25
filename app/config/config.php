<?php
/*
Copyright (C) 2020 Velocité Montpellier

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

/* Database configuration */

// Set the host or IP of the MySQL Server
$config['MYSQL_HOST'] = getenv('MYSQL_ADDON_HOST');

// Set the MySQL user
$config['MYSQL_USER'] = getenv('MYSQL_ADDON_USER');

// Set the MySQL user password;
$config['MYSQL_PASSWORD'] = getenv('MYSQL_ADDON_PASSWORD');

// Set the database name
$config['MYSQL_DATABASE'] = getenv('MYSQL_ADDON_DB');


$config['DATA_PATH'] = getenv('APP_HOME') . '/data/';

