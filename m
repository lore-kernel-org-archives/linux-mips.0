Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Subject: RE: __up, __down_trylock & __down_interruptible for MIPS
Date: Thu, 7 Oct 2004 15:12:32 +0530
Message-ID: <6BF015B686198842A1C8F84F4B7E6D2601276C2F@chn-snr-msg.wipro.com>
From: <priya.mani@wipro.com>
Return-Path: <priya.mani@wipro.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: geert@linux-m68k.org
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20041007094232.8F57A1fQ526eSDUgVA_BeSrul1BE_MQuuVVwu5GWsC8@z>

Thanks but I did try that and did not find kernel version above 2.3.
Since I am behind a firewall I got speacial access to the
ftp.linux-mips.org and logged into the site to find the linux under pub
which contains only upto kernel version 2.3. Am I going the wrong path?

-----Original Message-----
From: geert@sonycom.com [mailto:geert@sonycom.com] On Behalf Of Geert
Uytterhoeven
Sent: Thursday, October 07, 2004 1:40 PM
To: Priya Balasubramanian (WT01 - EMBEDDED & PRODUCT ENGINEERING
SOLUTIONS)
Cc: Ralf Baechle; Linux/MIPS Development
Subject: RE: __up, __down_trylock & __down_interruptible for MIPS


On Thu, 7 Oct 2004 priya.mani@wipro.com wrote:
> I too doubted that the kernel which I am using is not in proper shape.
> Please could you point me to a proper link where I can download it
from.
> I am in need of a proper working kernel version 2.4.25 or above.
> 
> Hope you can lead me to a proper link for this!

http://cvs.linux-mips.org/kernel.html

and check out the 2.4 branch (or mainline if you want 2.6).

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker.
But
when I'm talking to journalists I just say "programmer" or something
like that.
							    -- Linus
Torvalds
