Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: marker@daddyo.engr.sgi.com (Charles Marker)
Message-ID: <199905271832.LAA53444@daddyo.engr.sgi.com>
Subject: Re: Lxrun: Linux Applications for Solaris
Date: Thu, 27 May 1999 11:32:38 -0700 (PDT)
In-Reply-To: <374D8D5A.2143F76A@detroit.sgi.com> from "Eric Kimminau" at May 27, 99 02:22:18 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: eak@sgi.com
Cc: linux@cthulhu.engr.sgi.com, Charles Marker <marker@daddyo.engr.sgi.com>
Message-ID: <19990527183238.xnpezscH0qquB2vcMJKjfOQN5dtT53NZrM753WSP_e0@z>

> 
> Anyone thought of porting this to IRIX?
> 
> http://www.sun.com/software/linux/lxrun/
> 

This could be useful for IRIX, but only to enable executing MIPS based
Linux binaries.  Lxrun is not an emulator, so you need to have
underlying Intel hardware in order to run Intel Linux binaries.  Sun
is providing this for Intel systems running Solaris where it could be
useful, but I don't know how useful this would be for SPARC based
systems (depending on the number of SPARC based Linux applications).

					Charles
