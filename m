Message-ID: <001301c10e84$570805a0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20010716163712.B12104@superweasel.com> <20010717032055.A1236@bacchus.dhis.org> <20010716223902.A16351@superweasel.com> <20010717050050.A1737@bacchus.dhis.org>
Subject: Re: Linux on a 100MHz r4000 indy?
Date: Tue, 17 Jul 2001 07:50:00 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>, Greg Johnson <gjohnson@superweasel.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010717055000.gtSvaowmBuWocTwExqzz798c03hADF2Yfeiv750VaMs@z>

I don't have access to old R4000 revision data, and I'll take your
word for the errata applicable to rev 0422.  A am a *little* surprised
that such early parts found their way into Indys, since the Indy was
not the first R4000 platform (I believe that honor belongs to the
"Crimson" graphics workstations), but it's certainly possible.

            Regards,

            Kevin K.

----- Original Message -----
From: "Ralf Baechle" <ralf@oss.sgi.com>
To: "Greg Johnson" <gjohnson@superweasel.com>
Cc: <linux-mips@oss.sgi.com>
Sent: Tuesday, July 17, 2001 5:00 AM
Subject: Re: Linux on a 100MHz r4000 indy?


> On Mon, Jul 16, 2001 at 10:39:02PM -0400, Greg Johnson wrote:
>
> > CPU revision is: 00000422
>
> That's a really old and buggy CPU.  Kevin Kissel may correct me but I
think
> it's the first series shipped to customers.  Among the fun bugs:
>
> --------------------------------------------------------------------------
---
>
> 4. R4000PC, R4000SC: An instruction sequence which contains a load which
causes
>    a data cache miss and a jump, where the jump instruction is that last
>    instruction in the page and the delay slot of the jump is not currently
>    mapped, causes the exception vector to be overwritten by the jump
address.
>    The R4000 will use the jump address as the exception vector.
>
>    Example: lw <---- data cache miss
> noop <---- one or two Noops
> jr <---- last instruction in the page (jump or branch in-
>       struction)
> --------------<---- page boundary
> noop
>
>    Workaround: Jump and branch instructions should never be in the last
loca-
>                tion of a page.
> 11. R4000PC, R4000SC: In the case:
>
> lw rA, (rn)
> noop (or any non-conflicting instruction)
> lw rn, (rA) (where the address in rA causes a TLB refill)
> --------------------> end of page
> page not mapped
>
>    where rn and RA are general purpose registers r0 through r31
>
>    This code sequence causes the second load instruction to slip due to a
>    load use interlock. When the R4000 crosses the page boundary after the
>    lw, it vectors to 0x8000 0000 and later causes an instruction cache
miss.
>    After the instruction cache miss is complete the LW causes another TLB
>    refill. This should vector to 0x8000 0000 but instead goes to 0x8000
0180.
>
> 14 (Just an update of erratum 4)
>
> --------------------------------------------------------------------------
---
>
> There's more but I don't want to paste the whole errata document in here
> and above bugs alone without the respective workarounds in kernel and
tools
> are grave bugs.
>
>   Ralf
