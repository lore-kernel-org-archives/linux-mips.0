Message-ID: <01b001c092e5$58f6a8a0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <Pine.GSO.3.96.1010209212607.13007B-100000@delta.ds2.pg.gda.pl>
Subject: Re: config option vs. run-time detection (the debate continues ...)
Date: Fri, 9 Feb 2001 23:12:00 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>, Jun Sun <jsun@mvista.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010209221200.KYRbCdol5vsgX6G2WH41H2BtUlO1JF_ztxo4OD_l2h4@z>

> > Another question.  I know with mips32 and mips64 we can do run-time
detection
> > reliably.  What about other existing processors?
>
>  I've sent a quote from an IDT manual recently.  It recommended to use the
> FPU implementation ID to check if an FP hw is present.  I believe it
> should work for any sane implementation of a MIPS CPU.  See the mail for
> details.

The best method I know for post-R3000 CPUs is to
write and read back the CU1 bit of the Status register.
CPUs without an integrated FPU will not have a flip-flop
for the bit, and will read back a 0 even after writing a 1.
There was never any architectural requirement that
this be so, however, and this cannot be absolutely
guaranteed to work.  If anyone has a counter-example,
however, I'd be interested in hearing about it.

            Kevin K.
