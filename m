Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: I built a mipsel-linux toolchain, but it doesn't work
Date: Sat, 2 Jul 2005 14:10:48 +0530
Message-ID: <A8A67F242940E246A515077CF9ECACC157F3F6@dbde01.ent.ti.com>
From: "Singh, Ajay" <ajaysingh@ti.com>
Return-Path: <ajaysingh@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: sjhill@realitydiluted.com, David Daney <ddaney@avtrex.com>
Cc: moreau francis <francis_moreau2000@yahoo.fr>, zhan rongkai <zhanrk@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20050702084048.aynanTpUU7EMrknRO0xURilPuU1uC6TvH7W6qbVB7QU@z>

We are using uClibc-0.9.27 for MIPS target. Can you point out the issues
with uClibc-0.9.27 ??

~Ajay.

-----Original Message-----
From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] On Behalf Of
sjhill@realitydiluted.com
Sent: Friday, July 01, 2005 8:30 PM
To: David Daney
Cc: moreau francis; zhan rongkai; linux-mips@linux-mips.org
Subject: Re: I built a mipsel-linux toolchain, but it doesn't work

> moreau francis wrote:
> > Could you develop please ? What kind of config/hack does Buildroot 
> > to be able to use GCC with uClibc ?
> > 
> 
> It is quite complicated, but you can find a summary on this web page:
> 
> http://www.google.com/search?q=uclibc+buildroot
> 
Here is the page for it:

   http://buildroot.uclibc.org/

The mipsel target is supported and will build for your needs. Do not use
uClibc-0.9.27 when you configure your buildroot system. Use the latest
uClibc snapshot. There are issues with uClibc-0.9.27 with MIPS targets.

-Steve
