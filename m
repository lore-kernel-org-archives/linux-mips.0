Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0wzS9I-0005FjC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Local disk boot HOWTO
Date: Fri, 15 Aug 1997 20:35:04 +0100 (BST)
In-Reply-To: <199708151717.TAA19277@informatik.uni-koblenz.de> from "Ralf Baechle" at Aug 15, 97 07:17:56 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Cc: greg@xtp.engr.sgi.com, eak@detroit.sgi.com, shaver@neon.ingenia.ca, linux@cthulhu.engr.sgi.com
Message-ID: <19970815193504.xPvEqBrbrvjfaGVLNAzuA_YtUq8uRQl-__QqOuHInQ8@z>

> My suggestion is to attack the ext2fs disk to a Linux/i386 machine,
> build the root filesystem etc. on it, then back on the Indy use it
> for booting.  Linux is so smart that it handles the MSDOG partitions
> on the disk created that way correctly and I store my kernel on the
> IRIX / anyway.

Another approach is to create a linux fs the right size for your root
on another ext2fs supporting host (ie linux,os/2, win95,macos ;))
and gzip the actual file system, then people can bootstrap it quite
easily under irix by just gunzipping to the _right_ ;) raw device

Alan
