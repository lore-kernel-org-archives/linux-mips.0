Date: Wed, 19 Sep 2001 09:39:16 -0400
From: Daniel Jacobowitz <dan@debian.org>
Subject: Re: kgdb with linux-mips problem
Message-ID: <20010919093916.A4421@nevyn.them.org>
References: <00fe01c140b4$ad3f9200$cd22690a@huawei.com> <20010918224620.A22455@nevyn.them.org> <016001c140b9$c5a2e900$cd22690a@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <016001c140b9$c5a2e900$cd22690a@huawei.com>; from zhangshaolin@huawei.com on Wed, Sep 19, 2001 at 11:18:37AM +0800
Sender: owner-linux-mips@oss.sgi.com
To: Shaolin Zhang <zhangshaolin@huawei.com>
Cc: Ernest Jih <ernest.jih@idt.com>, linux-mips@oss.sgi.com, renwei@huawei.com
Message-ID: <20010919133916.ExgH2L17XCfoP36wGTkma43y3mh_AmuEOq41hu31lSk@z>

On Wed, Sep 19, 2001 at 11:18:37AM +0800, Shaolin Zhang wrote:
> My gcc verison is 2.95.3 19991030, gdb verison is 20000204.
> What is current version of bintuil and egcs,and where can i get it ?
> thanks.

From gcc.gnu.org/sources.redhat.com.  The one you'll really need to
update is GDB: sources.redhat.com/pub/gdb/, I think, and look for a
snapshot from the past few weeks.

I highly recommend you use an existing toolchain - MontaVista's
(www.mvista.com, look for Journeyman) or H.J. Lu's (don't know the URL
offhand).

-- 
Daniel Jacobowitz                           Carnegie Mellon University
MontaVista Software                         Debian GNU/Linux Developer
