Received: from mail.zeugmasystems.com ([70.79.96.174]:6708 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20033763AbXLEDuu (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 5 Dec 2007 03:50:50 +0000
Message-ID: <34AF8F83DE89424F94243BB80944B175@rocktron>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
References: <20071203181658.GA26631@onstor.com> <20071203230828.GA17960@linux-mips.org>
In-Reply-To: <20071203230828.GA17960@linux-mips.org>
Subject: Re: [PATCH] Add support for SB1 hardware watchdog.
Date: Tue, 4 Dec 2007 19:50:42 -0800
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
Message-ID: <20071205035042.E2wuhLtUQJIrIgiuo0M3RDx6q4shC65hJKdIx-7AUQs@z>

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
