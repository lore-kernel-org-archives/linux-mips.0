Subject: Re: thread-ready ABIs
References: <m3elkoa5dw.fsf@myware.mynet> <20020118101908.C23887@lucon.org>
	<01b801c1a081$3f6518e0$0deca8c0@Ulysses>
	<20020119162415.B31028@dea.linux-mips.net>
	<m3d703thl6.fsf@myware.mynet> <01be01c1a2d7$6ec299c0$0deca8c0@Ulysses>
Reply-To: drepper@redhat.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 21 Jan 2002 16:16:09 -0800
In-Reply-To: <01be01c1a2d7$6ec299c0$0deca8c0@Ulysses>
Message-ID: <m3zo37s0ja.fsf@myware.mynet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: owner-linux-mips@oss.sgi.com
To: "Kevin D. Kissell" <kevink@mips.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, Mike Uhler <uhler@mips.com>, linux-mips@oss.sgi.com, "H . J . Lu" <hjl@lucon.org>
Message-ID: <20020122001609.lJL8810VGpSqbR_zokojLBIjoFv7RaJ_ifspfAvqyO0@z>

"Kevin D. Kissell" <kevink@mips.com> writes:

> As MIPS "owns" the ABI, whether or not the thread register
> becomes a part of it is not something that anyone outside
> of MIPS can simply decree.

Well, MIPS might define the "official" ABI but nobody is forced to use
it and if nobody uses it it's nor worth anything.

> I'd very much appreciate it if someone would explain to me just what
> this register is used for, and why a register needs to be permantly
> allocated for this purpose.

Simply look at the ABIs for some less-backward processors.  Read the
thread-local storage section in the IA-64 ABI specification.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
