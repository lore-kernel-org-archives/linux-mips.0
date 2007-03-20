Received: from an-out-0708.google.com ([209.85.132.245]:3792 "EHLO
	an-out-0708.google.com") by ftp.linux-mips.org with ESMTP
	id S20022077AbXCTOrS (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 20 Mar 2007 14:47:18 +0000
Received: by an-out-0708.google.com with SMTP id c8so1571309ana
        for <linux-mips@linux-mips.org>; Tue, 20 Mar 2007 07:47:11 -0700 (PDT)
Message-ID: <d459bb380703200747y13ba427ek83cc32b503c33bc7@mail.gmail.com>
Date: Tue, 20 Mar 2007 15:47:10 +0100
From: "Marco Braga" <marco.braga@gmail.com>
Subject: Re: Au1500 and TI PCI1510 cardbus
In-Reply-To: <45FFEDED.6060708@ru.mvista.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_182445_9198083.1174402030334"
References: <d459bb380703190755n3f05b8e1v850bb8347e574d68@mail.gmail.com>
	 <200703200204.l2K24WgH020041@centurysys.co.jp>
	 <45FFEDED.6060708@ru.mvista.com>
Return-Path: <marco.braga@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20070320144710.05CKOXG7IYWFiQUBEqv-2-0e14nSvMWunCV8-XsgBIw@z>

------=_Part_182445_9198083.1174402030334
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2007/3/20, Sergei Shtylyov <sshtylyov@ru.mvista.com>:
>
>     What I don't understand is why use USB card on CardBus, if the Au1500
> datasheet clearly tells us (well, at least me :-) that this is *not* going
> to
> work?
>

I'll reply for my part: we need something hotswappable, and support for
wifi. The first idea was to use cardbus, so a board was built using PCI1510.
When the system was projected, USB2.0 was not easy to find (if even existed)
and almost every wifi card was PCMCIA or Cardbus. The PCI1510 never worked,
and it seems now that never will. So at the moment an alternative is to try
a wifi dongle on USB. USB 1.x was too slow, but USB 2.0 seems ok for our
application. Au1500 does not support USB2.0, so I am looking for a
PCI/USB2.0 controlles. Does something similar exist? Does it work on Au1500?

To make it short, we are NOT trying to make USB work on Cardbus, but to use
either cardbus OR usb. :-)
------=_Part_182445_9198083.1174402030334--
