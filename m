Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199712111821.KAA13893@oz.engr.sgi.com>
Subject: Re: Announce: New uploads
Date: Thu, 11 Dec 1997 10:21:49 -0800 (PST)
In-Reply-To: <348FFDBF.EE8@kaydara.com> from "Joe Alonso" at Dec 11, 97 09:50:39 am
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: jalonso@kaydara.com
Cc: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19971211182149.bddgrF-nAv2-aaKE1WSY3nhGCROkeqM9B43lPnetpJ8@z>

:
:Pardon my ignorance, but...
:I have a couple of questions;  
:is there a how-to document that outlines how to load linux on an sgi?
:
We are waiting for someone to write this.

You may get all the info by reading:

	http://reality.sgi.com/ariel/linux.gz

(an archive of this mailing list).  The problem is that
it is way too long in this form.


:is the Indigo Elan (r4000) supported?
:

Unfortunately, no.


:I'm not sure how to initialize a loading of linux on the sgi.
:Here's what I've assumed:
:- bring over the src's to the sgi
:- compile a basic system (under irix)
:- copy over the original irix kernel with the new linux kernel
:- re-boot
:
:The begging questions:
:The FS are not compatible, therefore a new mkfs has to be done on the
:(root) partitions.
:This just doesn't "sound" right to me. 
:What am I overlooking?
:

You should be either:

1) boot via bootp (/vmlinux on a remote filesystem) and mount
   stuff via NFS.

2) Go through a complex and not well documented way of creating
   an ext2fs filesystem on your Indy (better get an additional disk)
   copy the kernel and root to that system and reboot.

--
Peace, Ariel
