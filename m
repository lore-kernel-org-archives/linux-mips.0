Message-ID: <000d01bf5708$40dbe150$5a4f89d0@tds.net>
Reply-To: "Ken Wills" <kenwills@tds.net>
From: "Ken Wills" <kenwills@mailbag.com>
Subject: general question on linux-mips
Date: Tue, 4 Jan 2000 17:05:54 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: linux@cthulhu.engr.sgi.com
Message-ID: <20000104230554.IQJ5bYxiVkF8kqj5ETpd3EwjQxF9GKkh2JAmRGbXFPQ@z>

Hello everyone!

I have quite a general question, that I hope someone won't mind answering:-

I've installed hard-hat-5.1 on my indy, with few problems, and updated to a
kernel
that supports swap and everything seems fine. Next I decided to update gcc
and binutils,
in order to try later kernel builds (2.3.x). (I'm a long time UNIX user, but
quite new to linux).

My question is: I've had no sucess with gcc-2.95 or any version of binutils
I can lay my hands on.
binutils-2.95 builds with CFLAGS=-g , but then during the build of gcc, I
get an error from as.
Is the only option for software compilation a cross compiler on another
linux box?

I've poured over the web pages and have the cvs repo, which I am about to
start poking around in,
and don't find any specific dos or don'ts.

Thanks,

Ken
kenwills@mailbag.com
