Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: marker@daddyo.engr.sgi.com (Charles Marker)
Message-ID: <199801150000.QAA78366@daddyo.engr.sgi.com>
Subject: Re: boot problem
Date: Wed, 14 Jan 1998 16:00:39 -0800 (PST)
In-Reply-To: <34BD4F3E.7F86@cerf.net> from "William Ellis" at Jan 14, 98 03:50:22 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: William Ellis <bellis@cerf.net>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19980115000039.UR-bhaWPg-A73ayCEAyADoZ4AIPJYhglWV9NFOCvrAk@z>

> 
> I'm working with a Challenge S, R5000 (Allegedly the same
> hardware as an Indy without a graphics card)
> 
> Initially booting via tftp with various errors, I am
> now trying to just get the sash boot -f to work.
> I have tried several of the applicable precompiled kernels 
> at ftp.linux.sgi.com/pub/test all with similar errors:
> 
> Standalone Shell SGI Version 6.2 ARCS   Mar  9, 1996 (32 Bit)
> sash: boot -f /vmlinux root=/dev/sda1
> 1278928+236160 entry: 0x8800250c
> newport_probe: read back wrong value ;-(
> 
> What is the newport_probe?  The only non-stock thing about
> the machine is it has a fddi card in it, (which I do not
> need to get going for linux).  Could this error be an effect
> of the fddi card being present, or that there is no graphics
> card present?  Or am I missing something else all together?
> Thanks in Advance, Bill
> 

Newport is the name of the graphics on Indy systems which is removed
on Challenge S systems.  As I mentioned previously, I believe that
Challenge S systems also have the ISDN and AV hardware removed.  One
difference which I forgot to mention the other day was that the
Challenge S has a car which plugs into the newport spot and provides
extra ethernets and differential SCSI (WD95 I believe).  I believe
that the SCSI controller on the system board is still WD93.

					Charles
