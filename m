Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0wu104-0005FiC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: An update...
Date: Thu, 31 Jul 1997 20:35:04 +0100 (BST)
In-Reply-To: <Pine.LNX.3.95.970724230351.22084H-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jul 24, 97 11:15:26 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970731193504.C4M-UlzQSPFKy3IiifVL4xkzdBHYDQk5u3zjKoZMiTU@z>

> - My root partition isn't being mounted read/write.  I can't figure it
> out.  /proc/mounts does indicate that it's rw, and I'm sure the NFS export
> is setup correctly.

Are you remounting root after startup and do you have our export set not
to map root to nobody ?

(try mount -o remount,rw -n /)


Alan
