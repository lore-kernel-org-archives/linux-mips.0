Received: from mail.zeugmasystems.com ([70.79.96.174]:6708 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20032592AbXLEDut (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 5 Dec 2007 03:50:49 +0000
Message-ID: <802BA59F5D0A495BAB9A037527BB76BB@rocktron>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
References: <20071203181658.GA26631@onstor.com> <20071203230828.GA17960@linux-mips.org>
In-Reply-To: <20071203230828.GA17960@linux-mips.org>
Subject: Re: [PATCH] Add support for SB1 hardware watchdog.
Date: Tue, 4 Dec 2007 19:41:08 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20071205034108.7fgHJPjsJenTILNiypLP-hTs04X7tC_Fs1bw95S9NpQ@z>

On Mon, Dec 03, 2007, Ralf Baechle wrote:
> On Mon, Dec 03, 2007 at 10:17:04AM -0800, Andrew Sharp wrote:
>
>> +   Watchdog driver for the built in watchdog hardware in Sibyte
>> +   SoC processors.  There are apparently two watchdog timers
>> +   on such processors; this driver supports only the first one,
>> +   because currently Linux only supports exporting one watchdog
>> +   to userspace.
>
> And even four watchdogs in the BCM1480.
>
> You'd think they'd trust their hardware more than that ;-)

Maybe the dogs can be daisy-chained together. After all, who watches the 
watcher? And who watches him?

Did I ever tell you how lucky you are?

http://www.drseussart.com/beewatcher.html

http://www.webpages.ttu.edu/sbaugues/fin4323/dr.seuss.pdf
