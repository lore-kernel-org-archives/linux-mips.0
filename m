Subject: Re: Support for smaller glibc
Date: Sat, 2 Dec 2000 09:13:45 -0700 (MST)
In-Reply-To: <E142CN5-0001Wk-00@the-village.bc.nu> from "Alan Cox" at Dec 02, 2000 01:06:28 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E142FIH-00017w-00@xmission.xmission.com>
From: Eric Jorgensen <alhaz@xmission.com>
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20001202161345.D66eqJAdUIwUnGXsUEg1EtX9_zAqGi4zEDPxKQCN6nM@z>

> 
> > > solved.  But forking a smaller libc of standard glibc is nothing but the
> > > St. Florian's principle ...
> > 
> > Ulrich is refusing to do anything with it. Do you have any suggestions?
> > I will do my best to do it right. But I am afraid I cannot do it alone.
> 
> Ulrich is right. Start from a library that is intended to be modular and
> embedded. Folks are already looking at using newlib for this. 


	There are a few other methods. Lineo for instance has a utility
called Lipo which goes through all the binaries on a system and then
strips out all the library code that's unused, usually resulting in a
substantial reduction in the size of libc6. Lipo is a proprietary
app tho, currently only available supporting ia32 and ppc archetectures as
part of the Embedix SDK.

	There's also uClibc, and i've heard some talk of using bsd's libc,
which i understand is also smaller. These may require modification to the
sourcecode of your apps to work properly. 

 - Eric
