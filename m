Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Date: Wed, 1 May 1996 08:44:55 -0700
From: wje@fir.esd.sgi.com (William J. Earl)
Message-ID: <199605011544.IAA07701@fir.esd.sgi.com>
Subject: Re: scope of this mailing list
In-Reply-To: <199605010233.EAA26130@informatik.uni-koblenz.de>
References: <Pine.LNX.3.91.960429200526.3781C-100000@redhat.com>
	<199605010233.EAA26130@informatik.uni-koblenz.de>
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ralf Baechle <ralf@informatik.uni-koblenz.de>
Cc: Erik Troan <ewt@redhat.com>, linux@neteng.engr.sgi.com
Message-ID: <19960501154455.CVmhxrYPdxc2eBgTaFB7swEhJUQMol7_nFpReZzKT3I@z>

Ralf Baechle writes:
...
 > The main issue in achieving binary compatibility accross all Linux/MIPS
 > targets is the byte order.  For some machines (Mips Magnum 4000, Olivetti
 > M700-10, SNI RM series and others more) the byte order for the kernel is
 > configurable.  For other it is fixed.  This is often the case for machines
 > that were built with NT in mind.
 > 
 > The MIPS architecture offers us the nice feature of switchable byteorder
 > for usermode.  Thus we have a way to run software from other systems with
 > differing native byte order.  In other words: it's technological possible
 > but it's not implemented yet.
...

     I once worked on this problem on another OS base.  The basic system
calls are easy.  ioctls, especially for streams, were much harder.  Within
the limits of the published ABI, as opposed to the universe of working programs,
the task is not too difficult.
