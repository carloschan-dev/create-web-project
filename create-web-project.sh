#! /usr/bin/env bash

# create-web-project  A simple tool for create structures for web projects 
# Copyright (C) 2023 carlos chan dev
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

help_text="usage: create-web-project

A simple tool for create structures for web projects

options:
  -h --help     show this help message and exit
  -v --version  show program's version number and exit

Copyright (c) carlos chan dev 2023"

if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
	echo "$help_text"
	exit
elif [[ $1 == "-v" ]] || [[ $1 == "--version" ]]; then
	echo "version 1.0"
	exit
fi

read -p "Project Name: " project_name

if [[ -z "$project_name" ]]; then
	echo "Error: project name cannot be empty"
	exit
fi

if [[ -d $project_name ]]; then
	echo "Error: Project name '$project_name' already exists"
	exit
fi

if [[ ! -w "$(pwd)" ]]; then
	echo "Error: you don't have permission to create a project here"
	exit
fi

mkdir $project_name
mkdir -p $project_name/static/{css,js}
touch $project_name/{index.html,README.md}
touch $project_name/static/css/style.css
touch $project_name/static/js/main.js
cd $project_name
tree
echo "Project Created"