Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0x04WI-0005FiC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: boot linux - wish
Date: Sun, 17 Aug 1997 13:33:22 +0100 (BST)
In-Reply-To: <199708162207.AAA01148@informatik.uni-koblenz.de> from "Ralf Baechle" at Aug 17, 97 00:07:45 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Cc: vincent@waw.com, miguel@nuclecu.unam.mx, linux@cthulhu.engr.sgi.com
Message-ID: <19970817123322.yZGcwoSEth9SP4VYfs-7gMYq9BGFHVA3oLviulzY6Tw@z>

> As far as the complexity of writing an XFS-like fs is concerned - SGI has
> invested a significant fraction of the R&D of XFS into the realtime stuff.
> So ignoring that part for the beginning makes the task of writing a XFS
> like filesystem much easier.

An XFS reader doesn't look too difficult, we can even take the btree
code from the Mac HFS driver. It should be possible to put the writing
algorithm back together by working back from the actual allocation patterns
for blocks the system makes
