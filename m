From: "William J. Earl" <wje@cthulhu.engr.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14550.27750.579401.146127@liveoak.engr.sgi.com>
Date: Mon, 20 Mar 2000 10:22:30 -0800 (PST)
Subject: Re: header files state
In-Reply-To: <004401bf924e$f0c526e0$0ceca8c0@satanas.mips.com>
References: <004401bf924e$f0c526e0$0ceca8c0@satanas.mips.com>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Andreas Jaeger <aj@suse.de>, Florian Lohoff <flo@rfc822.org>, linux@cthulhu.engr.sgi.com
Message-ID: <20000320182230.7T_Rlt55d0FiVEC_M02fyYYe_NXdZuCHaQ6jn2LNh5U@z>

Kevin D. Kissell writes:
 > >Linus has stated quite violantly that glibc should not include any
 > >kernel headers at all - and we're now including less and less
 > >headers.  But this process needs time and occasionally breaks older
 > >glibc's.
 > 
 > What is Linus' rationale for his position?   It's true that 
 > having includes "reaching in" from libc imposes constraints
 > on kernel designers, but failure to do so is guaranteed
 > to induce error - as we have seen.

     In this particular case (MIPS-based systems), both glibc and the kernel 
attempt to be MIPS ABI compliant, so there is no real issue in having the
various definitions in two places, since there is an external reference,
just as there is for the processor itself.

     More generally, having a real ABI definition for the key system libraries,
such as libc, is a virtue; it reduces gratuitous "innovation".  Many architectures
have an ABI definition, at least for the basics.  
