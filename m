Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: Compile Mips-Architecture on an i386?
Date: Thu, 4 Nov 2004 17:49:27 -0800
Message-ID: <BBB228F72FF00E4390479AC295FF4B350DE691@FOOTHILL.iad.idealab.com>
From: "Joseph Chiu" <joseph@omnilux.net>
Return-Path: <joseph@omnilux.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Bruno Randolf <bruno.randolf@4g-systems.biz>, linux-mips@linux-mips.org
Message-ID: <20041105014927.3Wb8K4vmuzoTdGss83fJim89RdqC9MCb0GX5BEg10l0@z>

If you're doing it to get stuff done, a pre-built package (commercial or opensource) is the way to go.  But I also rebuilt my toolchain from scratch and learned immensely from it...

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of Bruno Randolf
> Sent: Thursday, November 04, 2004 1:33 PM
> To: linux-mips@linux-mips.org
> Subject: Re: Compile Mips-Architecture on an i386?
> 
> 
> hi!
> 
> another option is to use the openembedded build system:
> 
> http://openembedded.org/oe_wiki/
> 
> it includes the cross-toolchain and has lots of packages 
> which you can 
> compile.
> 
> bruno
> 
> On Thursday 04 November 2004 14:19, Thomas Petazzoni wrote:
> > Hello,
> >
> > Hannes Bischof a écrit :
> > > What do I need to compile the software so that it runs 
> under the linux
> > > system of the router??
> >
> > You need a cross-compilation toolchain (that is a gcc, 
> binutils and libc
> > that runs on your i386, but that generates binaries for MIPS).
> >
> > Different tools are available to do that :
> >
> >   * Toolchain  : http://www.uclibc.org/toolchains.html
> >   * Crosstool  : http://kegel.com/crosstool/
> >   * Debian way : http://skaya.enix.org/wiki/ToolChain
> >
> > Thomas
> 
