Message-ID: <001701c4e195$24d48260$3ca06096@NUNOE>
From: "Hdei Nunoe" <nunoe@co-nss.co.jp>
References: <001101c4dbf9$1da02270$3ca06096@NUNOE> <20041207095837.GA13264@linux-mips.org>
Subject: Re: HIGHMEM
Date: Tue, 14 Dec 2004 13:26:55 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <nunoe@co-nss.co.jp>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20041214042655.agvkwdvPre77Dq2M6c0pMBVviSK9bHBvITJ3UMKLYWM@z>

Ralf,

Thanks for the info!  I still have a ocuple of question, hope you do not 
mind.

> In 2.4 the support for CONFIG_DISCONTIG and CONFIG_NUMA are a bit tangled
> with each other because IP27 is the only platform to uses these features
> and it needs both.

Is it named "sgi-ip27"?

> Other than that you can also just setup your system
> as 0x0 - 0x10000000 being RAM, 0x10000000 - 0x20000000 being reserved
> memory and 0x20000000 - 0x30000000 being highmem.  Which works but is a
> bit wasteful.

The gap in physical memory is 0x10000000 - 0x20000000, but it is 
0x90000000 -
0xC0000000 in virtual memory because there is K1 segment.  So the macros 
such
as __pa() or __va() does not work, I think.  Started to wonder it might not 
be easy
as just changing the PAGE_OFFSET value.  Do you see?

cheers,
-hdei
