Message-ID: <001301c18f39$5685c640$9b6e0b0a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <20011226013221.A737@dea.linux-mips.net> <20011227.105518.74756316.nemoto@toshiba-tops.co.jp> <20011227011222.A16695@dea.linux-mips.net> <20011227.125122.71082554.nemoto@toshiba-tops.co.jp> <20011227022936.A19397@dea.linux-mips.net> <3C2B45D3.B938CA44@eicon.com> <20011227191959.B1553@dea.linux-mips.net>
Subject: Re: vmalloc bugs in 2.4.5???
Date: Fri, 28 Dec 2001 08:48:16 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>, "Tommy S. Christensen" <tommy.christensen@eicon.com>
Cc: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>, linux-mips@oss.sgi.com
Message-ID: <20011228004816.zglk-BSuAaHK7Mxm3C8V7E86cVgeiSK_4QHotQ-3gWg@z>


----- Original Message ----- 
From: Ralf Baechle <ralf@oss.sgi.com>
To: Tommy S. Christensen <tommy.christensen@eicon.com>
Cc: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>; <dony.he@huawei.com>; <linux-mips@oss.sgi.com>
Sent: Friday, December 28, 2001 5:19 AM
Subject: Re: vmalloc bugs in 2.4.5???


> On Thu, Dec 27, 2001 at 05:01:23PM +0100, Tommy S. Christensen wrote:
> 
> > Great! But please make sure that the cache is flushed after the pages
> > are allocated instead of before.
> > 
> > With 2.4.9 that still had the cache-flushing in vmalloc_area_pages(), I
> > got cache aliasing problems in low memory situations (since alloc_page()
> > will re-schedule when no pages are available).
> 
> Correct; I fixed that one.  That's actually a nasty one, affects all
> previous Linux releases.  I wonder how this one went unnoticed for so long.
> Probably because loading modules is a relativly rare event or so.

How do you fix it? Can you mail your fixup code to me please?

machael
