Message-ID: <007701c2e22c$66e30e70$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20030302121820.A30790@linux-mips.org><20030304011459.457.qmail@web13302.mail.yahoo.com> <20030304171340.1a9af44d.takano@os-omicron.org>
Subject: Re: JVM under Linux on MIPS
Date: Tue, 4 Mar 2003 09:59:34 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: TAKANO Ryousei <takano@os-omicron.org>, linux-mips@linux-mips.org
Message-ID: <20030304085934.c3TB_MoszlwjEcbyY7Rs1YWVImgznW3ayiO0vUF06Dk@z>

> On Mon, 3 Mar 2003 17:14:59 -0800 (PST)
> Rajesh Palani <rpalani2@yahoo.com> wrote:
> >    Has anyone had any success running any open source JVMs (other than Cobalt machines running Transvirtual's Kaffe) under
Linux/MIPS.
> >
>
> I have succeeded in running Kaffe 1.0.7 with --with-engine=jit3
> on a TANBAC TB0193 board (VR4181/66MHz).
> However, it was very poor performance. A hello world execution,
> for example, takes about 30 seconds.
> I think that a JIT initialization has taken a lot of time.

I'm very pleased to hear that you got it running on a Vr41xx,
but I'm curious about the JIT behavior you saw.  I can believe
that it could run "hello world", but does it really pass all the
internal regression tests ("make check")?  Are you running
a "normal" MIPS/Linux distribution which assumes a
hardware FPU and does kernel emulation where necessary,
or are you using a purely soft-float environment?  I ask
this because most of the problems I have with the JIT are
in areas where mixed integer/floating arguments are being
passed, and those might not be an issue with soft-float.

As for the performance you observed, how much memory
did you have on the board, and what kind of secondary storage
(disk?) hardware was used?  66MHz isn't fast, but the combined
compile-and-run time for Caffeinemark for the patched
kaffe 1.0.7 on a MIPS 5Kc core at 160MHz was in fact
pretty good, better than 3 Embedded Caffeienmarks
per megahertz, which isn't as fast as commercial dynmic
compilers, but which is still several times faster than most
commercial interpretive JVMs.  Running fully interpretive,
kaffe's performance is mediocre but reasonable, I certainly
wasn't seeing delays of 10 seconds to run "hello world",
which is roughly what one would expect scaling your reported
run time by the frequency.  I really think that you are far more
likely to have been I/O bound, either from paging or from file I/O.

            Kevin K.
