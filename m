Received: from acting (exchange01.skystream.com [63.89.190.81])
	by sarang.flyduck.com (8.12.10/8.12.5) with SMTP id j0RNonWV017979
	for <linux-mips@linux-mips.org>; Thu, 27 Jan 2005 15:50:49 -0800
Message-ID: <004201c504cb$d43bacc0$1202a8c0@acting>
From: "Ho Lee" <flylist@linuxkernel.net>
References: <41F8688A.24C5725C@procsys.com>
Subject: Re: Davicom driver support in pmon
Date: Thu, 27 Jan 2005 15:56:32 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <flylist@linuxkernel.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050127235632.Orvo2Be6LP_pdIK7U9oqGzAXhtXkiNbmWC1sPl4D-44@z>


Once I did in other platform. Did you set the valid MAC address
to ID registers starting from I/O base + 0xc0?

-- Ho

----- Original Message ----- 
From: "priya" <priya@procsys.com>
To: <linux-mips@linux-mips.org>
Sent: Wednesday, January 26, 2005 8:05 PM
Subject: Davicom driver support in pmon


> Hi,
> I have implemented a davicom driver on
> the same lines as rtl driver in pmon for
> a customized mips platform - but iam not
> able to set the mac ID. After the init
> routine  the driver seem to have has
> received a multicaste frame. This i
> could verify by putting sufficient
> prints. After this nothing happens. I
> guess the mac address is also not set
> properly. Has any one implemented a
> davicom driver in pmon before??
> 
> thanks,
> priya
>
