Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: RE: NEC VR4181A
Date: Thu, 13 Feb 2003 05:22:36 -0800
Message-ID: <02c101c2d362$f9e2eed0$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20030212224837.D16015@mvista.com>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Jun Sun' <jsun@mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030213132236.522Oy0-8oUdvHMwkTbCk7QB6tPE7vIC5zD7qb_RbCdc@z>

>Osprey uses Vr4181, which is a different chip from vr4181a.

Yeah I didn't notice the A on there. We are looking into the possibility of
using the A in our board. Part of the problem is that the A only comes in
BGA and we don't like dealing with that.

>Interesting.  I was trying to get RT-Linux working at one time
>but aborted that effort in the middle.

Getting RTAI working wasn't easy. Took over a week and it was supposedly
already "ported." One of these days I really must find the time to check in
my changes to that project. It works very well and is quite stable. I think
46 us worst-case interrupt response off one of the VR4181's interrupts from
an external source is very good.

Steve
