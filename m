Date: Tue, 16 Jan 2001 04:10:29 -0200
From: Ralf Baechle <ralf@oss.sgi.com>
Subject: Re: O200 problem...
Message-ID: <20010116041028.B2068@bacchus.dhis.org>
References: <20010109004138.A12181@bacchus.dhis.org> <Pine.LNX.4.30.0101121507090.13361-100000@quake.blic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0101121507090.13361-100000@quake.blic.net>; from pmalic@blic.net on Fri, Jan 12, 2001 at 03:20:25PM +0100
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Predrag Malicevic <pmalic@blic.net>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010116061029.x0gdu3oPYlnZ6y6I2P8J8-b1RGPr11yePdGgkZBAqqU@z>

On Fri, Jan 12, 2001 at 03:20:25PM +0100, Predrag Malicevic wrote:

> > Thanks for sending the oops message; however without additional data
> > provided I can't use it.  Can you please point please put the kernel image
> > that resulted in the oops online?
> 
> http://lothar.penguinpowered.com/o200.tar.gz
> 
> You'll find everything in the archive: vmlinux, System.map, kernel
> configuration file and a new session log with 'oops messages'.

I just examined your crash data; it's not obvious why what is causing the
DBE exception that is making your kernel die.  It seems to happen in
the SCSI code; I wonder if any of the devices you have on the SCSI bus
especially on the second hostadapter is making the Qlogic driver go nuts.

Can you retry your kernel with devices from this bus removed?

Thanks,

  Ralf
