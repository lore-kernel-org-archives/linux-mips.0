Received: from Smtp1.Lantiq.com ([195.219.66.200]:13795 "EHLO smtp1.lantiq.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6868728Ab3JHM5YBe5gL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 8 Oct 2013 14:57:24 +0200
From: <thomas.langer@lantiq.com>
Subject: RE: [PATCH] MIPS: Print correct PC in trace dump after NMI exception
Date: Tue, 8 Oct 2013 12:57:17 +0000
Message-ID: <593AEF6C47F46446852B067021A273D6D9901A5C@MUCSE039.lantiq.com>
References: <1381232371-25017-1-git-send-email-markos.chandras@imgtec.com>
 <593AEF6C47F46446852B067021A273D6D990182F@MUCSE039.lantiq.com>
 <20131008122905.GJ1615@linux-mips.org>
In-Reply-To: <20131008122905.GJ1615@linux-mips.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <thomas.langer@lantiq.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: markos.chandras@imgtec.com, linux-mips@linux-mips.org, Leonid.Yegoshin@imgtec.com
Message-ID: <20131008125717.wsbamLTRPRrnZSkBecYTotUdyEBjsAbZ2hcSskTzISA@z>

Hello Ralf,

Ralf Baechle wrote on 2013-10-08:

> On Tue, Oct 08, 2013 at 11:48:54AM +0000, thomas.langer@lantiq.com wrote:
> 
>>>  void __noreturn nmi_exception_handler(struct pt_regs *regs)
>>>  {
>>> +	char str[100];
>>> +
>>>  	raw_notifier_call_chain(&nmi_chain, 0, regs);
>>>  	bust_spinlocks(1);
>>> -	printk("NMI taken!!!!\n");
>>> -	die("NMI", regs);
>>> +	snprintf(str, 100, "CPU%d NMI taken, CP0_EPC=%lx\n",
>>> +		 smp_processor_id(), regs->cp0_epc);
>>> +	regs->cp0_epc = read_c0_errorepc();
>> 
>> If this is a YAMON specific fix, why is it done in a common file?
> 
> The installation of an NMI handler is platform specific - this handler
> however in all its simplicity is generic - or at least trying to.
> 
> The NMI on MIPS is notoriously hard to use.  The vectors is pointing to
> the boot ROM so firmware first gets its grubby hands on a fresh NMI and
> on most systems it'll do the firmware equivalent of a panic or reset
> the system outright.  If that's still working - it's about the worst
> tested functionality of firmware ...

I know, I am working on a chip which has working wrapper implemented in its bootrom:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/mips/lantiq/falcon/prom.c#n90
Therefore I was triggered by the keyword NMI ;-)

So if this has nothing to do with YAMON and is some generic NMI specific fix:
Acked-By: Thomas Langer <thomas.langer@lantiq.com>

> 
>   Ralf

Best Regards,
Thomas
