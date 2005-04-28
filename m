Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: iptables/vmalloc issues on alchemy
Date: Thu, 28 Apr 2005 18:16:36 -0500
Message-ID: <8230E1CC35AF9F43839F3049E930169A137236@yang.LibreStream.local>
From: "Christian Gan" <christian.gan@librestream.com>
Return-Path: <christian.gan@librestream.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Dan Malek <dan@embeddedalley.com>
Cc: Josh Green <jgreen@users.sourceforge.net>, Herbert Valerio Riedel <hvr@hvrlab.org>, linux-mips@linux-mips.org, Pete Popov <ppopov@embeddedalley.com>
Message-ID: <20050428231636.A_Eo3ENOZkY4ZuQZrODaSEjzRqovw5arhJBKwif5XxY@z>

Sorry, I should have been more clear:  The little test module I created
worked without CONFIG_64BIT_PHYS_ADDR, I realize that it would fail for
the PCI device though.

Thanks!

Christian

-----Original Message-----
From: Dan Malek [mailto:dan@embeddedalley.com] 
Sent: Thursday, April 28, 2005 5:17 PM
To: Christian Gan
Cc: Josh Green; Herbert Valerio Riedel; linux-mips@linux-mips.org; Pete
Popov
Subject: Re: iptables/vmalloc issues on alchemy


On Apr 28, 2005, at 5:22 PM, Christian Gan wrote:

> ..... Again it would be okay if I used
> kmalloc or if I disabled CONFIG_64BIT_PHYS_ADDR.

An Au1500 or Au1550 isn't likely to work with this disabled.
PCI and other peripherals exist in the 36-bit space, unless you
disable them.  I suspect all of this got broken with the dynamic
exception handler building.  Prior to that, I suspect it works
fine.  I guess we need to do some regression testing ....

Thanks.


	-- Dan
