content-class: urn:content-classes:message
Subject: sti() does not work.
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Date: Tue, 3 Jul 2001 15:48:04 -0700
Message-ID: <84CE342693F11946B9F54B18C1AB837B05CE09@ex2k.pcs.psdc.com>
From: "Steven Liu" <stevenliu@psdc.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: "stevenliu@psdc.com" <jeff@moke.com>
Message-ID: <20010703224804.BUi9BWHlm2S0gYbOqQdxq4Gq_F4gvIOrbq8eSCYYP5Q@z>

Hi All:

I am working on the porting Linux to mips R3000 and  have a problem
about sti( ) which is called in start_kernel( ).

As we know, sti() is defined as __sti( ) in the
include/asm-mips/system.h:
 
extern __inline__ void  __sti(void)
{
	__asm__ __volatile__(
		".set\tnoreorder\n\t"
		".set\tnoat\n\t"
		"mfc0\t$1,$12\n\t"
		"ori\t$1,0x1f\n\t"
		"xori\t$1,0x1e\n\t"
		"mtc0\t$1,$12\n\t"               /* <----- problem  here
! */
		".set\tat\n\t"
		".set\treorder"
		: /* no outputs */
		: /* no inputs */
		: "$1", "memory");
}

Before calling this function, status_register = 0x1000fc00 and
cause_register=0x00008000. 
Clearly, this is an interrupt of the CPU timer. 

When mtc0 instruction above is executed, the system hangs and the
control does not go to the timer handler.

Any help is greatly appreciated.

Thank you.

Steven liu
