Date: Thu, 29 Mar 2001 19:39:01 +0200 (MET DST)
From: Karel van Houten <K.H.C.vanHouten@research.kpn.com>
Subject: Re: Recommended toolchain
In-reply-to: <200103291728.TAA01350@sparta.research.kpn.com>
Reply-to: vhouten@kpn.com
Message-ID: <200103291739.TAA01695@sparta.research.kpn.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Cc: "Maciej W. Rozycki" <macro@ds2.pg.gda.pl>
Message-ID: <20010329173901.U-GsGl_6pzj-Ed90s2veqJE8ArDQScMAgiPMEfS4w2I@z>

I wrote:
> This happens when I compile kernel 2.4.0-test9 with
> binutils 2.10.1, gcc 2.95.3, glibc 2.2.2 on my 5000/260 (R4k)
> (the same source/config compiles fine with 2.8.1/egcs-2.90.27/glibc-2.0.6):
> ....

Oh, and the resulting (ELF) kernel doesn't boot at all:
>>boot 3/rz0 1/new
delo V0.7 Copyright 2000 Florian Lohoff <flo@rfc822.org>
Loading /etc/delo.conf .. ok
Loading /boot/vmlinux.new ....... ok

KN05 V2.1k    (PC: 0xa002cab8, SP: 0x8043fef0)
>>                            

-- 
Karel van Houten

----------------------------------------------------------
The box said "Requires Windows 95 or better."
I can't understand why it won't work on my Linux computer. 
----------------------------------------------------------
