# 7 Days to Die Server Docker image

## Introduction

This image aims to be "as it is" and not Download the game at start-up like the other images I found.
It comes with Allocs fixes as default.

## Usage

I have an example [docker-compose.yml](https://github.com/Momper14/7_Days_to_Die_-_Docker_Image/blob/master/docker-compose.yml) for Docker Compose.
If you don’t want the Logs, u can remove the Line. It’s not marked as a Volume.

The Serverconfig.xml and Saves are in the Data Volume.

## Build it your own

You can install the pre-requirements with the [pre_build.sh](https://github.com/Momper14/7_Days_to_Die_-_Docker_Image/blob/master/pre_build.sh) script. If you don’t want the latest version, you can change it here.

## Help wanted

Help is welcome. (like gramma correction :D)