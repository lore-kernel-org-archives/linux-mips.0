From: "Ian Chilton" <mailinglist@ichilton.co.uk>
Subject: RE: Can't find |
Date: Mon, 12 Jun 2000 13:37:19 +0100
Message-ID: <NAENLMKGGBDKLPONCDDOCEHLCMAA.mailinglist@ichilton.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <39440AA3.51CEDFA3@brussels.sgi.com>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Alexis Cousein <al@brussels.sgi.com>
Cc: Linux-MIPS Mailing List <linux-mips@oss.sgi.com>, info-iris-hardware@ARL.MIL
Message-ID: <20000612123719.qXujlec_haUVUbGSAW8Jm18ZC3VkLSXDOQyhDCYdMlI@z>

Hello,

> That's *usually* easy. You usu need another model specified in
> /usr/lib/X11/xkb/X0-config.keyboard -- you have a 102 key keyboard and
> the Indy thinks you have a 101 kkey keyboard or vice-versa.

> Note that a file somewhere in the .desktop home directory of users can
> override this file, so make sure that default file is the only one on
> the system!

In the desktopenv file, it has:
SGI_KB_LAYOUT="gb"

Will this matter?


> Trouble is, it's been so long I've had to answer this that it's no
> longer in deja.com archives

I have tried what you suggested, and it doesn't make any difference...I can
only get a |.

Anyone know exactly what the command is to go in this file?


I did find however, that while IRIX is booting, and that console window
comes up, I can do CTRL-ALT, and they key left of 1 and get a |, but this
doesn't work once it's booted. In a terminal window, I just get '15q' when I
press this.


Any ideas?


Thanks!


Bye for Now,

Ian


                     \|||/
                     (o o)
 /----------------ooO-(_)-Ooo----------------\
 |  Ian Chilton                              |
 |  E-Mail : ian@ichilton.co.uk              |
 \-------------------------------------------/
