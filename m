Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: jes@machine.engr.sgi.com (John E. Schimmel)
Message-ID: <199811251957.LAA24028@machine.engr.sgi.com>
Subject: Re: help offered
Date: Wed, 25 Nov 1998 11:57:10 -0800 (PST)
In-Reply-To: <19981125204900.A4692@loria.fr> from "Olivier Galibert" at Nov 25, 98 08:49:00 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Olivier Galibert <galibert@pobox.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19981125195710.1gaNWUXLOLKC-6auP5feVjUjx6NIW1Vw9vTBONBX0iA@z>

> 
> The  limit on  x86 is  2GB.   To  be  fair,  said  terabyte  files and
> filesystems  are  connected  to systems   with  a 64bits architecture.
> Afaik, linux on alpha handles terabytes files.
> 
>   OG.
> 

We support >2GB on 32 bit systems, and added lseek64() and friends
before we had 64 bit size_t/off_t.

--------------------------------------------------------------
John E. Schimmel                       Email:    jes@sgi.com         
KD6MNW				       Voice:    (650)933-4116
Silicon Graphics Inc.                  Fax:      (650)933-0513
http://reality.sgi.com/jes             Cellular: (209)631-0896
--------------------------------------------------------------
