content-class: urn:content-classes:message
Subject: RE: 64 bit operations w/32 bit kernel
Date: Tue, 30 Sep 2003 09:23:05 -1000
Message-ID: <DC1BF43A8FAE654DA6B3FB7836DD3A56DEB75F@iris.adtech-inc.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
From: "Finney, Steve" <Steve.Finney@SpirentCom.COM>
Return-Path: <Steve.Finney@SpirentCom.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, "Finney, Steve" <Steve.Finney@SpirentCom.COM>
Cc: linux-mips@linux-mips.org
Message-ID: <20030930192305.t4erbtdkxObJ-jzuPysOwZVc8BFzIddLa0CpANdHVGo@z>

> 
> What you want really is a 64-bit kernel.  On a 64-bit kernel even for
> processes running in 32-bit address spaces (o32, N32) the processor
> will run with the UX bit enabled.  o32 userspace still lives in the
> assumption that registers are 32-bit so only those bits will 
> be restored
> in function calls etc.  N32 (where userspace isn't ready for 
> prime time
> yet) does guarantee that.  And N64 (userspace similarly not ready for
> prime time) obviously is fully 64-bit everything.

What is the page table space impact of a 64 bit kernel on an architecture like the Sibyte with discontiguous physical address spaces?  Do you still waste 36 MB of page table space on the "hole", or does it even double because the page table entries are bigger for the wider addresses? Or do the issues become irrelevant with the larger address space?

Thanks,
sf
