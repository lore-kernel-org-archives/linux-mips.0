Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199903161915.LAA73750@oz.engr.sgi.com>
Subject: Anon CVS (was Re: FAQ)
Date: Tue, 16 Mar 1999 11:15:12 -0800 (PST)
In-Reply-To: <199903161719.JAA96403@cthulhu.engr.sgi.com> from "owner-linux@cthulhu" at Mar 16, 99 09:19:37 am
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: R.vandenBerg@inter.nl.net
Cc: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19990316191512.e6xDQY-wJLb_ZmgHQHjPyLEwv6SnIkNLSiAPWyGPG70@z>

Just a reminder since this is a FAQ...

(in a bounced message :-) Richard van den Berg wrote:
:
:P.S. is cvs read-only possible at linus.linux.sgi.com? I've tried without
:succes getting a permission denied. Instead I've ftp'ed the cvs tree.
:
:Regards,
:Richard
:

Anonymous read-only CVS to linus.linux.sgi.com:

        Using CVS you can checkout the Linux/MIPS source tree with
        the following commands:

        cvs -d :pserver:cvs@linus.linux.sgi.com:/cvs login
        (Only needed the first time you use anonymous CVS,
         the password is "cvs")

        cvs -d :pserver:cvs@linus.linux.sgi.com:/cvs co <repository>

        where you insert linux, libc, or gdb for <repository>.


-- 
Peace, Ariel
