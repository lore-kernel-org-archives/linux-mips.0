Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Thu, 10 Jul 1997 18:08:40 -0400
Message-ID: <199707102208.SAA19714@tvp.boston.sgi.com>
From: Wayne Mesard <wmesard@cthulhu.engr.sgi.com>
Subject: How to get the masses (IRIX<->Linux)
In-Reply-To: Ariel Faigon's message of 10 July 1997 14:38:49
References: <199707102138.OAA23929@oz.engr.sgi.com>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ariel Faigon <ariel@sgi.com>
Cc: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970710220840.EX1DKJIktVCR7kC2ukAWlxKd9I7JSdS11oQpVAY5wV4@z>

Ariel Faigon writes:
> If we could rewrite wakeupat or reboot to take some
> extra boot options or alternatively run some Linux loader
> (SILO/MILO) from IRIX then 2) should be easy.

Not necessary.  Use nvram to set SystemPartition (and maybe one or two
other prom variables?) to point at the Linux disk and then just init 6.

Wayne();
617-489-7864
