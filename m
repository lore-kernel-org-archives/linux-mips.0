Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0wwZA8-0005FiC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: Pending fixes
Date: Thu, 7 Aug 1997 21:27:59 +0100 (BST)
In-Reply-To: <199708071730.MAA21512@athena.nuclecu.unam.mx> from "Miguel de Icaza" at Aug 7, 97 12:30:46 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Miguel de Icaza <miguel@nuclecu.unam.mx>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970807202759.n9kllJzxqVFV8e4bvLjrRdxAwwnI9rFLeMjzFPrDAlw@z>

> 	- NFS is crashing after heavy usage.  This is not the same 
> 	  problem that the 2.1 tree has on the intel.  Every time it
> 	  crashes on me it fails around the end of do_bottom_half.

How big are your kernel stacks ?
