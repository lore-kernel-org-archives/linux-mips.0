Date: Fri, 2 Feb 2001 15:03:11 +0000 (GMT)
From: "Dr. David Gilbert" <gilbertd@treblig.org>
Subject: Re: Cross build applications
In-Reply-To: <3A7AC901.4BD0F4E0@mips.com>
Message-ID: <Pine.LNX.4.30.0102021502170.1654-100000@springhead.px.uk.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Carsten Langgaard <carstenl@mips.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010202150311.9GTpOxlIQ2tUtGBpg-kIahN9kFtJlAMWB3BGMu2nSdQ@z>

On Fri, 2 Feb 2001, Carsten Langgaard wrote:

> I'm trying to cross build a small test program on a linux PC, but it
> fails.
>
> mips-linux-gcc -o test test.c
> /usr/mips-linux/bin/ld: cannot open crt1.o: No such file or directory

Yep - you need to obtain a copy of this - just copy it out of Linux/mips
installation and put it in one of the lib directories under your
/usr/mips-linux.

(That let me get "hello world" crossing from Linux/Alpha last week)

Dave
-- 
/------------------------------------------------------------------\
| Dr. David Alan Gilbert | Work:dg@px.uk.com +44-161-286-2000 Ex258|
| -------- G7FHJ --------|---------------------------------------- |
| Home: dave@treblig.org            http://www.treblig.org         |
\------------------------------------------------------------------/
