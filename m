Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: jes@machine.engr.sgi.com (John E. Schimmel)
Message-ID: <199705271942.MAA11080@machine.engr.sgi.com>
Subject: Re: strace/truss equiv?
Date: Tue, 27 May 1997 12:42:30 -0700 (PDT)
In-Reply-To: <199705271919.PAA21206@neon.ingenia.ca> from "Mike Shaver" at May 27, 97 03:19:29 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Mike Shaver <shaver@neon.ingenia.ca>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19970527194230.en3xhHNMrA4t8B_fdRoJg5OefuALuB_Mwcds_EFlhkE@z>

> 
> OK, I'll bite.
> What's the strace/truss equivalent under IRIX?
> 
> I'm trying to figure out why my "dynamically-linked" hello world
> binaries are 115K, and I can't tell where the heck the linker is
> finding the static libs.
> 
> Mike
> 
> -- 
> #> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
> #>              Linux: because every cycle counts.
> #>
> #> "I don't know what you do for a living[...]" -- perry@piermont.com
> #>        "I change the world." -- davem@caip.rutgers.edu
> 

The equivelant is par.  You may also want to take a look at
elfdump which will tell you what libraries you are linked with, etc.

--------------------------------------------------------------
John E. Schimmel                       Email:    jes@sgi.com         
KD6MNW				       Voice:    (415)933-4116
Silicon Graphics Inc.                  Fax:      (415)933-0513
http://reality.sgi.com/jes             Cellular: (209)988-1549
--------------------------------------------------------------
