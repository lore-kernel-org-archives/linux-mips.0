Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199706101059.MAA18571@informatik.uni-koblenz.de>
Subject: Re: Merge back of the MIPS sources
Date: Tue, 10 Jun 1997 12:59:18 +0200 (MET DST)
In-Reply-To: <199706091836.LAA02114@fir.engr.sgi.com> from "William J. Earl" at Jun 9, 97 11:36:10 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "William J. Earl" <wje@fir.engr.sgi.com>
Cc: mende@piecomputer.engr.sgi.com, ralf@Julia.DE, ariel@sgi.com, linux@yon.engr.sgi.com
Message-ID: <19970610105918.Ma213jKRC7EuKvOZ1KmhAmnAQGIDw9NErEnNItYB284@z>

>       If the MIPS system is running big-endian (as under RISCos), it can
> be binary-compatible with Indy linux, just as RISCos 5.01 -systype svr4
> binaries are binary-compatible with Indy IRIX 5.1 and later systems.
> If the MIPS system is running little-endian (as under NT), it cannot
> be binary-compatible with Indy linux, without adding bi-endian support
> (for running opposite-endian binaries, which is feasible, but messy).
> We prototyped bi-endian support in RISCos when before the Magnum
> was built, and it worked, but the code was very ugly in the streams
> area.  linux would likely be easier, but still a hassle.

Now that the overhead of accessing the userspace from the kernel under
Linux is very close to zero I fear that the additional overhead of the
byteorder conversion will show up very clearly in benchmarks unless
someone comes up with very clever ideas how do this.  Do you have
numbers how much the impact on RISC/os performance was?

  Ralf
