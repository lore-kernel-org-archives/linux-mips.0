Message-ID: <000f01c1677f$88fd6560$4a1c690a@huawei.com>
From: "machael" <dony.he@huawei.com>
References: <013301c165cc$5d030fa0$4a1c690a@huawei.com> <20011106130839.B30219@dea.linux-mips.net> <20011107.103947.74756322.nemoto@toshiba-tops.co.jp> <20011107024146.A1740@dea.linux-mips.net>
Subject: Re: vmalloc bugs in 2.4.5???
Date: Wed, 7 Nov 2001 19:29:59 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20011107112959.5ieQn4y1yXzt8zs3sFRdxQCS-X3upYA__GHmChaIC5I@z>


> On Wed, Nov 07, 2001 at 10:39:47AM +0900, Atsushi Nemoto wrote:
>
> > In 2.4.5, flush_cache_all() (and flush_tlb_all()) is called in
> > vmalloc_area_pages().  I think this call protect us from virtual
> > aliasing problem.
> >
> > By the way, does anybody have any problem with vmalloc on recent
> > kernel?
> >
> > In somewhere between 2.4.6 and 2.4.9, the call to flush_cache_all()
> > disappered from vmalloc_area_pages().  I have a data corruption
> > problem in vmalloc()ed area without this call.  I think we still need
> > this call.
>
> Entirely correct.  I'm just trying to find why this call got removed
> in 2.4.10.  Clearly wrong;  I had not noticed that these two lines
> got removed and thus was assuming the code of those two must somehow
> be malfunctioning.

I have added these two lines to vmalloc_area_pages in 2.4.10,but the
problems  still appear.
Why?

machael
