Date: Fri, 16 Jan 2004 10:49:00 +0100 (MET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: VR4131 - MQ1132 - UPD63335
In-Reply-To: <40079391.7080301@mistralsoftware.com>
Message-ID: <Pine.GSO.4.58.0401161047480.14892@waterleaf.sonytel.be>
References: <40079391.7080301@mistralsoftware.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <geert@linux-m68k.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Suresh. R" <suresh@mistralsoftware.com>
Cc: Linux/MIPS Development <linux-mips@linux-mips.org>
Message-ID: <20040116094900.BaCN25ZYrmn565W3YzTssq0hXBmZPqJ9BrX-eLc8Kdw@z>

On Fri, 16 Jan 2004, Suresh. R wrote:
> I am writing a linux device driver for UPD63335 audio codec. Its
> controlled through the MQ1132 co-processor. The VR4131 is the processor.
> The memory of MQ1132 is mapped to the processor memory in Kseg1 (0xA000
> 0000 onwards) which the manual says is TLB Unmapped region. Now my
> question is is it necessary to map this region before using it in Linux.
> Actually I have WinCE code for my reference. In that code the programmer
> is mapping the region using Virtual Cpoy and Virtual Alloc. Is it
> necessary to do that or Can I directly address the memory locatoin.
