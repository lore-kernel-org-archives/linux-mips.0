Subject: Re: hot patching
Date: Fri, 15 Feb 2002 14:04:49 +0000 (GMT)
In-Reply-To: <7DF7BFDC95ECD411B4010090278A44CA1B7578@ATVX> from "Siders, Keith" at Feb 15, 2002 07:39:49 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16biyn-0003EB-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: "Siders, Keith" <keith_siders@toshibatv.com>
Cc: "\"Linux-Mips E-mail\"" <linux-mips@oss.sgi.com>
Message-ID: <20020215140449.Zl6bxwKC6-g1PwWQI6lqKej3oxM02rZtwnlf8ek-vMQ@z>

> I'm attempting to set up a "hot patcher" in an embedded product. I'm
> attempting to use shared memory, however the "target" process is not aware
> of the patch being applied to it. Can a pseudo-driver attach a shared memory
> segment to a process which can then be executable by that process via a jump
> or jump-and-link, or is shared memory only for passing data and messages
> between collaborating processes? The references I've read only indicate the
> RW permissions, no X permissions. Or should I have the pseudo-driver
> actually allocate (by get_free_pages()) the memory required? And can it do
> this on behalf of the target process?

You shouldnt even need a driver if you are clever. The ptrace() functionality
for debuggers is sufficient to patch running code, and to do other interesting
things by adding new functions and calling them
