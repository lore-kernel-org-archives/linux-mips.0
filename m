From: "Matthew Dharm" <mdharm@momenco.com>
Subject: RE: Cycle counter
Date: Fri, 13 Sep 2002 09:51:27 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIKEPGCIAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <37A3C2F21006D611995100B0D0F9B73CBFE282@tnint11.telogy.design.ti.com>
Return-Path: <mdharm@momenco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Zajerko-McKee, Nick" <nmckee@telogy.com>, 'Gareth' <g.c.bransby-99@student.lboro.ac.uk>, linux-mips@linux-mips.org
Message-ID: <20020913165127._n6oM5fwu9Xzl70HuAuk27ZZWtAQ3RR7gRge2q25tgc@z>

Does this even run in userspace?  When I try something like this
(using mfc0) in userspace, I get an illegal instruction exception.

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of Zajerko-McKee,
> Nick
> Sent: Friday, September 13, 2002 9:41 AM
> To: 'Gareth'; linux-mips@linux-mips.org
> Subject: RE: Cycle counter
>
>
> Is this under a OS or a single execution?  Are there
> interrupts enabled? If
> so, disable them for measurements. (Clock interrupt, serial
> port, etc.).
>
> BTW, most MIPS implementations for OS's and monitors use
> the count/compare
> for their main tick. If you set it to zero you may be
> stepping on someone's
> tick.  A better method might be to read the count register
> and read it again
> at the end and do a difference - that way you preserve
> other's values.
>
> Other reasons for a delay: to fetch code (external mem
> ->cache -> cpu) and
> push items onto/off the stack...  Theres probably more that
> I can't think of
> right now...
>
> -----Original Message-----
> From: Gareth [mailto:g.c.bransby-99@student.lboro.ac.uk]
> Sent: Friday, September 13, 2002 12:28 PM
> To: linux-mips@linux-mips.org
> Subject: Cycle counter
>
>
> Hi,
>
> Another question reagarding the mips malta board. I am
> wanting to be able to
> find out how many cycles a certain loop takes to execute. I
> understand there
> is
> a cycle counter built into the processor that I want to use
> for this. I have
> a
> bit of inline assembly to do the job but the results I am
> getting are not
> consistent so i think there is probably something wrong
> with my attempt at
> the
> inline assembly. Here is the code :
>
>   void al_signal_start(void);
>   size_t al_signal_finished(void);
>   unsigned int GetcpuCycles(void);
>
>   char str[8];
>
>   int main (void)
>   {
>       double x;
>       al_signal_start();
>
>       x = al_signal_finished();
>       printf("GetcpuCycles says : %f \n",x);
>
>       return 0;
>   }
>
>   size_t al_signal_finished(void)
>   {
>       return GetcpuCycles();
>   }
>
>   void al_signal_start(void)
>   {
> 	  int zero,temp;
> 	  __asm__("move $2, $zero");
> 	  __asm__("nop");
>           __asm__("mtc0 $2, $9" :  : "r" (temp));
>           __asm__("nop");
>           __asm__("nop");
>           __asm__("nop");
>   }
>
>   unsigned int GetcpuCycles(void)
>   {
>           int temp;
>           __asm__(".set reorder");
>           __asm__("mfc0 $2, $9" : : "r" (temp));
>           __asm__("nop");
>           __asm__("nop");
>           __asm__("nop");
>           /*__asm__("jr $31" );*/
>   }
>
>
> As you can see, main just starts and stops the counter with
> no instructions
> in
> between. I expexcted the cycle count to be zero or close to
> it because of
> the
> instructions required to get the count but this is not the
> case. I am
> getting
> numbers like 8499. Is there just something wrong with my
> assembly or is
> there
> something else I am missing?
>
> Thanks for any help
> Gareth
>
>
