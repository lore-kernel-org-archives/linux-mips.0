From: Hartvig Ekner <hartvige@mips.com>
Message-ID: <200202052053.VAA21843@copsun18.mips.com>
Subject: Re: What is the maximum physical RAM for a 32bit MIPS core?
Date: Tue, 5 Feb 2002 21:53:58 +0100 (MET)
In-Reply-To: <3C6044A7.13FEB2E2@cotw.com> from "Steven J. Hill" at Feb 05, 2002 02:46:31 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: sjhill@cotw.com
Cc: Hartvig Ekner <hartvige@mips.com>, linux-mips@oss.sgi.com
Message-ID: <20020205205358.sxMHycGWjtbHhPfFTByX00C43r3lxD4OiMCZAur1MvE@z>

Hi,

Steven J. Hill writes:
> 
> Hartvig Ekner wrote:
> > 
> > You have to distinguish between physical and virtual memory. The MIPS32
> > architecture supports implementations with up to 36 bits of physical
> > address space, however the virtual address space in kernel and user mode
> > is as you describe below.
> > 
> I wasn't talking about the MIP32[tm] cores specifically, I was using a
> generalization of 32bit. However, this is good to know. All of the data
> sheets that I just downloaded from the MIPS site for the R4k[X] cores
> don't mention the 36-bit PA item. Care to elaborate?

Sure. All the 4K, 4KE and 4KS families (all MIPS32 cores) from MTI only
provide 32 bits of PA. The 5K and 20K families (MIPS64 implementations)
both provide 36 bit of PA.

Also note that all of the above is only relevant for cores which have a TLB.
The low-end 4K/4KE/4KS cores all come in variants without TLB (to save
die area) and these can of course only generate 32-bits of PA regardless.

/Hartvig
