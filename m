Message-ID: <001901c129e1$5aaaadc0$8021690a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <000701c12529$e1640580$8021690a@huawei.com> <20010815103314.A11966@bacchus.dhis.org> <000b01c1295e$0f2174c0$8021690a@huawei.com> <20010820230755.A11242@dea.linux-mips.net>
Subject: questions about some bits of STATUS register and exception priority...
Date: Tue, 21 Aug 2001 09:34:00 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010821013400.KY3JjUKWivE-rFPYu_Ggt0xdP1G9T28M_aSztJBcbfA@z>

hello:

    I am confused about CU0 and UM(ERL EXL) bit of STATUS register.

    The user manual says that " CP0 is always usable when in Kernel mode,
regardless of the setting of CU0 bit". Does it mean that when in Kernel mode
, the CU0 bit is always 1 and in User mode, the CU0 bit is 0? If the CU0 is
0, can we be sure that it is in User mode?

     If a user program is running in User mode, an interrupt happens at this
time(or an error occurs), then it will switch to Kernel mode to run the
interrupt handler(or the error exception handler). We know that the EXL(or
ERL) bit of Status register will be set to 1 by hardware. What about the UM
bit of Status? Does it remain unchangeable or change to 1 too? The user
manual doesn't say anything about it.


Another question about exception priority:
In entry.S, some exception handlers enables global interrupt bit(IE) but
others disables it.
Also syscall exception handler enables global interrupt bit(IE). Since the
interrupt priority  is lowest,If an interrupt happens in a syscall exception
handler, will it pause the syscall exception handler and run the interrupt
handler? If not, why it enable the IE bit(STI) in the syscall exception
handler??

If two interrupts happens at the same time, how can we decide the larger
priority interrupt and run its ISR?

Thank you very much.

machael thailer
