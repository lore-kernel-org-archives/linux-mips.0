Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xtzBj-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: My NEC VR4000's
Date: Sun, 18 Jan 1998 18:11:15 +0000 (GMT)
In-Reply-To: <34C23ACA.83E2E39C@netexpress.net> from "David Hinkle" at Jan 18, 98 11:24:27 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: David Hinkle <drachen@netexpress.net>
Cc: kbob@jogger-egg.engr.sgi.com, linux-mips@fnet.fr, linux@cthulhu.engr.sgi.com
Message-ID: <19980118181115.YDpj0yJM_e_PhduYKO59jyN4AptMIPmLGCBXUhPGhXk@z>

> password....  Bye the way... Is there an easier way to clear the root
> password?    And does anybody know what filesystem IRIX uses?

If its running Irix < 6.4 then read bugtraq archives for about 100,000 ways
to break root on your machine  8)

The best general scheme on a remote box is to stuff the disk into a machine
and without mounting it replace any disk block starting root:........:dfgkd
with your own password string. 
