Message-ID: <001901c12a2f$8626be00$8021690a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <000701c12529$e1640580$8021690a@huawei.com> <20010815103314.A11966@bacchus.dhis.org> <000b01c1295e$0f2174c0$8021690a@huawei.com> <20010820230755.A11242@dea.linux-mips.net> <001901c129e1$5aaaadc0$8021690a@huawei.com> <20010821085353.B13302@dea.linux-mips.net>
Subject: Re: questions about some bits of STATUS register and exception priority...
Date: Tue, 21 Aug 2001 18:53:34 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010821105334._sq4LHaDHtfjx8Uaps1_Q1LccFCwKkl6vRDpAM5sd4U@z>

> On Tue, Aug 21, 2001 at 09:34:00AM +0800, machael thailer wrote:
>
> >     I am confused about CU0 and UM(ERL EXL) bit of STATUS register.
> >
> >     The user manual says that " CP0 is always usable when in Kernel
mode,
> > regardless of the setting of CU0 bit". Does it mean that when in Kernel
mode
> > , the CU0 bit is always 1 and in User mode, the CU0 bit is 0? If the CU0
is
> > 0, can we be sure that it is in User mode?
>
> In the Linux kernel CU0 is used to indicate that we're running on the
> kernel stack.

Yes, when CU0 is 1, we can see we are running on the kernel stack.
But when CU0 is 0, can we say it is in User mode?

>
> > Another question about exception priority:
> > In entry.S, some exception handlers enables global interrupt bit(IE) but
> > others disables it.
>
> We have to avoid infinite recursion of exceptions; in same cases it's
> just paranoia or minor performance issue.
>
> > Also syscall exception handler enables global interrupt bit(IE). Since
the
> > interrupt priority  is lowest,If an interrupt happens in a syscall
exception
> > handler, will it pause the syscall exception handler and run the
interrupt
> > handler? If not, why it enable the IE bit(STI) in the syscall exception
> > handler??


The answer of this question? Thanks.

machael thailer
