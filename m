From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200205301936.g4UJaBG04915@coplin09.mips.com>
Subject: Re: cross-compiler for MIPS_RedHat7.1_Release-01.00 on Atlas/4Kc using RH7.3-i386 host
Date: Thu, 30 May 2002 21:36:10 +0200 (CEST)
In-Reply-To: <no.id> from "David Christensen" at May 30, 2002 10:54:55 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: David Christensen <dpchrist@holgerdanske.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020530193610.sN6Zn8TiE2RHAx9QZHhBoiDLS1qXmeJfLAtk5I5jlt0@z>

Hi David,

David Christensen writes:
> 
> linux-mips@oss.sgi.com:
> 
> I have downloaded ftp://ftp.mips.com/pub/linux/mips/installation/redhat7
> .1/01.00/MIPS_RedHat7.1_Release-01.00.iso, burned a CD, and followed the
> instructions provided on the CD (/linux/installation/README) to install
> Linux (little-endian) on a MIPS Atlas/4Kc board with a SCSI disk.

Note that you can install the Release-02.00 (with all the latest RPMs
from H.J.) as well on an Atlas, you'll just have to use the 2.4.3 install
kernel from the 01.00 CD image you downloaded, and everything else from 
the new release.


> would now like to recompile the kernel to experiment with sound.  I have
> posted to this mailing list before and was informed that I need a cross-
> compiler, available on oss.sgi.com.  My host is Red Hat Linux-i386 7.3.

For kernel cross compilation we use the following binary RPM's (LE shown only):

        binutils-mipsel-linux-2.9.5-3
        egcs-mipsel-linux-1.1.2-4

They can be found on:

        ftp://oss.sgi.com/pub/linux/mips/crossdev/i386-linux/mipsel-linux/


/Hartvig
