Message-ID: <41A3800F.2010005@mvista.com>
Date: Tue, 23 Nov 2004 10:23:11 -0800
From: Manish Lachwani <mlachwani@mvista.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Comments in the titan ethernet driver for IP header
 alignment
References: <20041123171421.GA30451@prometheus.mvista.com> <200411231910.02427.thomas.koeller@baslerweb.com>
In-Reply-To: <200411231910.02427.thomas.koeller@baslerweb.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <mlachwani@mvista.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thomas Koeller <thomas.koeller@baslerweb.com>
Cc: Manish Lachwani <mlachwani@prometheus.mvista.com>, linux-mips@linux-mips.org, ralf@linux-mips.org
Message-ID: <20041123182311.gd0JGSalxNGe3Joy9JvPRP3R9nCNKWubukmsMR8uqgE@z>

Hi Thomas,

Thomas Koeller wrote:
> Hi Manish,
> 
> register 0x103c is not documented in any but the newest version of
> the processor's user manual, and the function documented there has
> _nothing_ to do with header alignment. 

I agree. The document says nothing about IP header alignment. And like I 
said before, this code has been written based on feedback from the chip 
designers. I have no idea why there is not document describing this, as 
yet.

> So either the docs are wrong,
> or the register implements both the documented and undocumented
> functions. In this case, however, the code would be wrong because it
> permanently modifies the register's contents, which could screw up
> packet priority processing.

The code implements sequence of operations that are needed for the chip 
to align IP headers. Thats all. Now, if you think that this can screw up 
packet priority processing in any way, then you should point PMC about 
this potential bug. AFAIK, there are other OS's that use this register 
to fix the IP header alignment issue on the Titan.

Thanks
Manish Lachwani


> 
> Thomas
> 
> On Tuesday 23 November 2004 18:14, Manish Lachwani wrote:
> 
>>Hi Ralf,
>>
>>Attached patch puts comments around the section that programs register
>>0x103C for IP header alignment. Please review ...
>>
>>Thanks
>>Manish Lachwani
> 
> 
