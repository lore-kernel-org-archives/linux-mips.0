Message-ID: <006401c2b0b3$af277b30$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20021231074733.52293.qmail@web14804.mail.yahoo.com>
Subject: Re: need help - malta board mips5kc
Date: Tue, 31 Dec 2002 11:01:55 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: amit lubovsky <amit_lubovsky@yahoo.com>, linux-mips@linux-mips.org
Message-ID: <20021231100155.folU17JEPrC7OmlJp5cTWwRN7641WIFx8sgefFsvBs4@z>

I don't know the Lauterback tool at all, so I can
only suggest two possible things to worry about.
One would be that the debugger is making use of
memory in a way that conflicts with the download
of the Linux image.  The other would be that the
Malta drivers very likely still assume that some
set up has been done by the on-board ROM
monitor (YAMON), and that perhaps your
setup isn't allowing that to happen.  But if you
really want some help diagnosing stuff, you need
to provide more information (like *which* Linux
image, whether YAMON is still booting up on
the board before you start your session, some
description of the failure mode more detailed than
"no success", etc, etc).

----- Original Message ----- 
From: "amit lubovsky" <amit_lubovsky@yahoo.com>
To: <linux-mips@linux-mips.org>
Sent: Tuesday, December 31, 2002 8:47 AM
Subject: need help - malta board mips5kc


> Hi,
> I try to load a Linux image with HW debuger
> (Lauterbach) to a malta board with mips5kc with no
> success.
> With vxWorks image it loads and run with no problem,
> Any idea what is wrong?, the load address? the 'go'
> address?
> Thanks,
> Amit.
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
> 
> 
