Message-ID: <005301c1a368$87d27ed0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20020122232529V.machida@sm.sony.co.jp>
Subject: Re: patches for test-and-set without ll/sc (Re: thread-ready ABIs)
Date: Tue, 22 Jan 2002 18:16:25 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: aj@suse.de, hjl@lucon.org, ralf@oss.sgi.com, Machida Hiroyuki <machida@sm.sony.co.jp>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020122171625.AWSWk0tZEPa0dj05WYdIEPn0XYvYzSCQooVUpDAj-NI@z>

> Kevin, please let us  know about "k1 semaphore" you said.
> I want to know we can merge those functions or not.

My proposal is for a very simple emulation of ll/sc for
CPUs that implement the MIPS II "branch likely" instructions
but which do not have a functioning LL/SC. That means
that it is *not* a solution for R3000 processor such as
those found in old DEC and SGI platforms.  LL/SC is
also part of MIPS II, but several manufacturers seem
to have done MIPS II/III processors where LL/SC
is not fully functional.  This hack could thus be workable
both for the TX59 family and the Vr4100 family.

The idea leverages off the fact that a branch likely
instruction performs a kind of conditional execution.
The instruction in the delay slot is executed only if
the branch is taken.  This can be used to synthesize
a conditional store.  The user level code for a simple
atomic increment, for example, would look something
like this:

_atomic_inc_nollsc:
        .set  noreorder
        li    t0,MAGIC_COOKIE
Retry:
        mov      k1,t0
        lw         t1,0(a0)
        addiu    t1,t1,1
        BEQL  k1,t0,done
        sw        t1,0(a0)
        b          Retry
        nop
done
        jr        ra
        nop
 
If - and this is an important consideration - IF the value
of MAGIC_COOKIE can be determined such that
it can *never* be the residue value left in k1 by a
kernel exception handler, *no* kernel modifications
are required for this to work identically to LL/SC!
If, for example, k1 always ends up containing either
a Status, EPC, or EntryLo value after an ERET, something
like 0xffdadaff could be used as a MAGIC_COOKIE
value, as it is not a sane value for any of the above.

You will get some number of needless retries
in this scheme to the extent that there are TLB
misses on the load and on the instructions themselves
if the routine crosses a page boundary.  You
would get those same retries using LL/SC.
You could eliminate those retries by preserving
the appropriate k-register in the TLB refill handler,
but I really doubt that it would be worthwhile.

If there is any doubt about the possibility of the
MAGIC_COOKIE value being left in k1 (or
k0, which could also be used as the "LL flop"
if its behavior is more easily constrained), an
explicit operation at the end of the fault handlers
could be used to clear the register.  That would
still be far less complex and intrusive than the mods 
that you suggest below.

I have not implemented this scheme under Linux,
but we have tried it with success under other OSes.
It should in principle be SMP safe.

> Technical discussions are welcome.

Well, there you have one!

            Regards,

            Kevin K.
