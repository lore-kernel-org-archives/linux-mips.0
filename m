Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@Julia.DE>
Message-ID: <199706061836.UAA18495@kernel.panic.julia.de>
Subject: Re: Merge back of the MIPS sources
Date: Fri, 6 Jun 1997 20:36:48 +0200 (MET DST)
In-Reply-To: <199706061807.LAA01554@piecomputer.engr.sgi.com> from "Bob Mende Pie" at Jun 6, 97 11:07:29 am
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Bob Mende Pie <mende@piecomputer.engr.sgi.com>
Cc: ralf@Julia.DE, ariel@sgi.com, linux@yon.engr.sgi.com
Message-ID: <19970606183648.-rMMgzVYJQ1N6SStm-kpZSIt9pI_J-5lNBIKEonyYx4@z>

>    Have you verified that the newest code still works on the other MIPS
> based systems?   Also, is it possible to have (linux) binary compatability
> between a mips Magnum or Millennium and an Indy?

By principle there is no problem to feed these machines even with IRIX
binaries.  Right now the port to these machines assumes that it is running
on the machine configured to little endian mode but porting to big endian
should be easy.

>    There is a 50Mhz Millennium over here that we might be able to use as a
> test system.

The support for these machines is currently not complete yet.  We don't
yet have SCSI driver which should be easy to write because the machine
also uses the same NCR53C94 / FAS213 SCSI chip as the Sparc port already
does.

In fact I'd be very happy if someone would take care of these machines.
By supporting the Millenium we'd also have most of the support for the
Olivetti M700 (mostly an OEM Magnum), Acer PICA, certain machines based
on a Toshiba chipset and at least partially the NEC RISCstation series.

>                             /Bob...                    mailto:mende@sgi.com
>                       http://reality.sgi.com/mende/          KF6EID

73 de Ralf
