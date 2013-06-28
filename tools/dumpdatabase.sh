#!/usr/bin/env bash
mysqldump -u root --password=vagrant sanboxwordpresssimply > /vagrant/tools/database.sql
