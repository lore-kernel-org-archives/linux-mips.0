Message-ID: <009901c36fb8$08190970$6601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <10C6C1971DA00C4BB87AC0206E3CA382627229@1aurora.enabtech>
Subject: Re: RE: Information required
Date: Sun, 31 Aug 2003 08:04:29 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <brad@ltc.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Adeel Malik <AdeelM@avaznet.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030831120429.bzUZhdhUls4nUGSNZEB1gw4WI9ZEdEgmqvZvV79H6aU@z>

----- Original Message ----- 
From: "Adeel Malik" <AdeelM@avaznet.com>
To: "Dan Aizenstros" <daizenstros@quicklogic.com>
Cc: <linux-mips@linux-mips.org>
Sent: Saturday, August 30, 2003 7:34 AM
Subject: RE: RE: Information required


>        I have been able to resolve all the unresolved function symbols, by
> properly configuring the MODVERSIONING in the module code. Only two
symbols
> are left:
>
> 1. unresolved symbol Atomic_add
> 2. unresolved symbol Atomic_sub
>
> These symbols are not even in /proc/ksyms and System.map file of the
> cross-compild linux-2.4 directory.

I don't think you'll find those in Linux.  Maybe your module relies on
another module.

Regards,
Brad
