Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m0xvJsq-0005FsC@lightning.swansea.linux.org.uk>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: root-be-0.03.tar.gz
Date: Thu, 22 Jan 1998 10:29:15 +0000 (GMT)
In-Reply-To: <Pine.LNX.3.95.980122005800.20627E-100000@lager.engsoc.carleton.ca> from "Alex deVries" at Jan 22, 98 01:04:19 am
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Alex deVries <adevries@engsoc.carleton.ca>
Cc: shaver@netscape.com, linux@cthulhu.engr.sgi.com
Message-ID: <19980122102915.dfavxgUAY_Uk6ONzu7bGLkF3YM6xEaI2MaxUvIW9msw@z>

> Here's a question:  is it possible to boot off of the local disk without
> the image being on an EFS partition? Will I ever be able to have my
> machine have no EFS partition? How will ARC find the image?

Using the Linux initrd stuff. To get the ARC loader to load it all you
end up doing

char __initdata initrd_block[]={
#include "bootdisk.hex.h"
};

8)
