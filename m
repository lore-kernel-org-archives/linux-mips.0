From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200204191613.g3JGDpG02449@coplin09.mips.com>
Subject: Re: FYI: release of snow toolchain builder 1.4
Date: Fri, 19 Apr 2002 18:13:51 +0200 (CEST)
In-Reply-To: <20020419150716.GA6686@convergence.de> from "Johannes Stezenbach" at Apr 19, 2002 05:07:16 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Johannes Stezenbach <js@convergence.de>
Cc: Jay Carlson <nop@nop.com>, linux-mips@oss.sgi.com
Message-ID: <20020419161351.zqZf_z6ECTv8BYthjflivzbKsNSPOUWhVXdPcs_HRro@z>

We're doing a test-project with Algorithmics, implementing MIPS16 and
MIPS16e PIC support in SDE. I'll post results on the list when we have some.

/Hartvig


Johannes Stezenbach writes:
> 
> On Thu, Apr 18, 2002 at 09:05:39AM -0400, Jay Carlson wrote:
> > Snow could be the basis for MIPS16 work, since -fpic MIPS16 looks 
> > difficult.  However, the compiler I currently use, Debian gcc 2.95.4, is 
> > completely broken for -mips16.  (I'd say "can't compile dhrystone" is a 
> > good metric.  :-)  If anybody sends me a known-good MIPS16 platform, I'd 
> > be delighted to make snow work on it.  (At this point, getting MIPS16 
> > working under Linux is a matter of personal honor to me.)
> 
> I've just asked on the gcc mailing list, and someone at
> Redhat is currently working on mips16 support on the
> CVS trunk, i.e. it won't be in gcc-3.1. If it receives
> sufficient testing, gcc-3.2 might work for mips16 stuff.
> GNU-Pro from Redhat and the Algorithmics toolchain should
> work, too.
> 
> 
> Regards,
> Johannes


-- 
 _    _   _____  ____     Hartvig Ekner        Mailto:hartvige@mips.com
 |\  /| | |____)(____                          Direct: +45 4486 5503
 | \/ | | |     _____)    MIPS Denmark         Switch: +45 4486 5555
T E C H N O L O G I E S   http://www.mips.com  Fax...: +45 4486 5556
