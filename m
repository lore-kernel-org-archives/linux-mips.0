Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@yon.engr.sgi.com (Ariel Faigon)
Message-ID: <199606020335.UAA24950@yon.engr.sgi.com>
Subject: Re: progress, finally...
Date: Sat, 1 Jun 1996 20:35:47 -0700 (PDT)
In-Reply-To: <199606020212.TAA15557@neteng.engr.sgi.com> from "David S. Miller" at Jun 1, 96 07:12:02 pm
Reply-To: ariel@cthulhu.engr.sgi.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "David S. Miller" <dm@neteng.engr.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19960602033547.9RaGh_sc3RVHW-4W1Hx5WN4654ZM_B1hqxhHETiqgBI@z>

David,

This is very impressive progress. Thanks for the update!

I understand you have the prom pointers. A few that _may_
be relevant are in:

	http://info.engr.sgi.com/~ariel/linux/port.html

This doc was put together in a rush, any suggestions, requests
for additions etc. would be welcome.

>
>
>Ok, I have a complete compilation environment that seems to work quite
>well.
>
>All the tools are GNU, I have gcc/ld/as/etc. setups which can create
>either big or little endian kernels in either ELF or ECOFF format.
>The target format is that used by the existing Linux/MIPS people.
>
>These tools have been linking kernels for two days, I finally got a
>big endian kernel that sash would eat and it went fine until it tried
>to look for DECstation devices as that is one of the only machine
>types the existing Linux/MIPS kernels support (splat!). ;-)
>
>For now I'm going to hack the ARC prom code and the SCSI driver in
>parallel and see how far I can get it booting, more to come.
>
>Later,
>David S. Miller
>dm@sgi.com
>


-- 
Peace, Ariel
