From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200203200859.JAA10886@copsun18.mips.com>
Subject: Re: Fw: hello
Date: Wed, 20 Mar 2002 09:59:40 +0100 (MET)
In-Reply-To: <017701c1cf99$a7d9a890$0b01a8c0@w2k30g> from "David Christensen" at Mar 19, 2002 02:55:22 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: David Christensen <dpchrist@holgerdanske.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020320085940.K8hwdPLfYndiWWxmc_DSGsxbtuC9pLcbJ1U1We6bDp4@z>

Hi David,

David Christensen writes:
> 
> linux-mips@oss.sgi.com:
> 
> Thank you all for your replies.  :-)
> 
> 
> Hartvig Ekner <hartvige@mips.com> wrote:
> >> 2.  What is the preferred host OS...
> > We use Linux/x86 for kernel compiles,
> 
> Which Linux distribution does MIPS use?  Since I'm going to be working
> on an Atlas board using software from MIPS, I would like to match things
> up exactly.

Internally for development we use H.J's RedHat 7.1/MIPS miniport.
Ready-to-go kernel images and installation instructions (via NFS or
CDROM) for Atlas and Malta boards can be found on ftp.mips.com.


> As an aside, is anybody using a VMware virtual machine for their
> development host?
> 
> > and native compile for apps.
> 
> OK  that sounds like a safe bet.
> 
> >> 3.  What is the preferred toolchain...
> > This is what we use for cross Kernel compiles (toolchain from oss):
> >
> > /home/hartvige> gcc -v
> > Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/2.96/specs
> > gcc version 2.96 20000731 (Red Hat Linux 7.1 2.96-85)
> 
> Hmmm.  That looks like a native i386 compiler.  I'm surprised its not
> something like "mips-elf-gcc".

Sorry - I ran the command in the wrong window :-)

For kernel cross compilation we use the following binary RPM's (LE shown only):

	binutils-mipsel-linux-2.9.5-3
	egcs-mipsel-linux-1.1.2-4

They can be found on:

	ftp://oss.sgi.com/pub/linux/mips/crossdev/i386-linux/mipsel-linux/


> I'll assume the cross-compile toolchain was built per
> http://oss.sgi.com/mips/mips-howto.html section 10.
> 
> >> 4.  Is MIPS Linux self-hosted?
> > Yes. Even without workstations, you could use MIPS or Algo development
> > boards for self-hosted development (which is what we do - primarily
> > Malta boards).
> 
> Good.  :-)
> 
> >> 5.  Can you do native development on MIPS Linux?
> > Yes.
> 
> Good.  :-)
> 
> >> 6.  Does MIPS Linux support sound (oss or alsa) on any platform?
> >>     Does it support sound on MIPS Atlas?
> > Yes. Plug in a Creative SB card, based on the Ensoniq chip and
> > enable the es1371.c in the kernel compile. Works both LE & BE, and
> > with apps like madplay (mp3) and mplayer (mpeg4).
> 
> Great!  :-)
> 
> 
