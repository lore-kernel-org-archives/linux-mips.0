content-class: urn:content-classes:message
Subject: backtrace issues on GDB 5.3
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Date: Thu, 27 Nov 2003 07:26:59 -0600
Message-ID: <F2DE90354F0ED94EB7061060D9396547B98C49@mars.bandspeed.com>
From: "Vince Bridgers" <vbridgers@bandspeed.com>
Return-Path: <vbridgers@bandspeed.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20031127132659.ubDutCXMGGGAcbzcZW4Bj-0VIdfsMv5nEAtnqlz7Pgo@z>

I'm using GDB 5.3 for mipsel cross-compiled on an x86 box running RedHat
7.3. When I try to use the backtrace capability from GDB most of the
time I do not get a full stack context - I usually just get the function
I'm in at the time. I'm using GCC 3.2 to compile the kernel,
cross-compiled the same way. I've tried making sure the
omit-frame-pointer option and the "no instruction schedule" options are
on for when we do source level debugging with no joy.  

Does backtrace work for GCC and GDB cross compiled for mipsel? If so,
can someone briefly outline the "known good" configuration (GCC/GDB
versions, + relevant configuration options)?

TIA
