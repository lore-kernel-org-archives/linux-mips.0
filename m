Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@yon.engr.sgi.com (Ariel Faigon)
Message-ID: <199704141824.LAA13874@yon.engr.sgi.com>
Subject: Re: How big is the Linux/MIPS kernel?
Date: Mon, 14 Apr 1997 11:24:49 -0700 (PDT)
In-Reply-To: <199704141813.LAA19102@titian.engr.sgi.com> from "Mike McDonald" at Apr 14, 97 11:13:43 am
Reply-To: ariel@sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike McDonald <mikemac@titian.engr.sgi.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970414182449.xSMedpLB5rMigowfc1yhRD36Dyh8sGjYQEmLPPI2qYg@z>

:
:
:  Could someone tell me how big the kernel is for the MIPS chip? I
:need a rough estimate of the size of a minimal kernel with networking
:support, probably no file systems nor disks. A project I'm working on
:is currently using VxWorks. We're suppose to add a bunch of large, off
:the shelf software components to it and I'm worried about running
:everything in one unprotected address space. (All it takes is the web
:browser to hickup and the box will crash. But hey, no one has ever
:heard of a web browser crashing!) Does anyone have an estimate of the
:process switching time? That's one of the things the hardware types
:harp about for their multimedia apps.
:
:  Thanks
:
:  Mike McDonald
:  mikemac@engr.sgi.com
:

11:26 ariel@info /hosts/neteng.engr/home/dm/alambie> size vmlinux 


           Section           Size        Physical        Virtual
                                         Address         Address

               .text      809344        2282131456      2282131456      
             .rodata       71264        2282940800      2282940800      
            .reginfo          24        2283012064      2283012064      
               .data       90848        2283012096      2283012096      
               .sbss         349        2283102944      2283102944      
                .bss      131324        2283103296      2283103296      
880632 + 90848 + 131673 = 1103153


-- 
Peace, Ariel
