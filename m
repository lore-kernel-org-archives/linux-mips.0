Date: Sat, 21 Jul 2001 12:12:29 -0600
Subject: Re: SHN_MIPS_SCOMMON
From: Greg Satz <satz@ayrnetworks.com>
Message-ID: <B77F222C.888C%satz@ayrnetworks.com>
In-Reply-To: <20010721104144.A17894@lucon.org>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
Content-transfer-encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: "H . J . Lu" <hjl@lucon.org>, Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010721181229.YQf2QxMkI40pVNetrAiKWPDCPyTIISLq-WeahQEWqm4@z>

The problem I ran into was making NFS as a kernel module. The resulting
sunrpc.o module crashed when insmod was run over it. Ralf's fix that all
compiles and links use -G 0 worked for me.

Thanks,
Greg

on 7/21/01 11:41 AM, H . J . Lu at hjl@lucon.org wrote:

> On Sat, Jul 21, 2001 at 02:11:20PM +0200, Ralf Baechle wrote:
>> Only if you don't compile / assemble / link with -G 0.
>> 
>> .scommon shouldn't ever be in a kernel object.  It seems that ld started
>> to move .common objects to .scommon from a certain version on, so 2.4.5
> 
> Send me a testcase. I will fix the linker.
> 
> 
> H.J.
> 
