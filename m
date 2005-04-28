In-Reply-To: <8230E1CC35AF9F43839F3049E930169A137228@yang.LibreStream.local>
References: <8230E1CC35AF9F43839F3049E930169A137228@yang.LibreStream.local>
Mime-Version: 1.0 (Apple Message framework v622)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-ID: <c145ddc72b875ec3833ceba1a849b156@embeddedalley.com>
Content-Transfer-Encoding: 7bit
From: Dan Malek <dan@embeddedalley.com>
Subject: Re: iptables/vmalloc issues on alchemy
Date: Thu, 28 Apr 2005 18:16:43 -0400
Return-Path: <dan@embeddedalley.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Christian Gan <christian.gan@librestream.com>
Cc: Josh Green <jgreen@users.sourceforge.net>, Herbert Valerio Riedel <hvr@hvrlab.org>, linux-mips@linux-mips.org, Pete Popov <ppopov@embeddedalley.com>
Message-ID: <20050428221643.1Y4ANz6Tfpz8-aNhmZIkprGItnIcVvuhAy9BoiwhBIU@z>


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
