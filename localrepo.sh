#!/bin/bash

cp /etc/fstab /fstab.bak
cp ./rhel8.6.iso /rhel8.6.iso

echo '/rhel8.6.iso /repo iso9660 ro,loop 0 0' >> /etc/fstab
echo [baseos] >>/etc/yum.repos.d/local.repo
echo name=baseos >>/etc/yum.repos.d/local.repo
echo baseurl=file:///repo/BaseOS >>/etc/yum.repos.d/local.repo
echo enabled=1 >>/etc/yum.repos.d/local.repo
echo gpgcheck=0 >>/etc/yum.repos.d/local.repo
echo [appstream] >>/etc/yum.repos.d/local.repo
echo name=appstream >>/etc/yum.repos.d/local.repo
echo baseurl=file:///repo/AppStream >>/etc/yum.repos.d/local.repo
echo enabled=1 >>/etc/yum.repos.d/local.repo
echo gpgcheck=0 >>/etc/yum.repos.d/local.repo

mkdir /repo
mount -a
dnf update
dnf list
