content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: RE: mips32_flush_cache routine corrupts CP0_STATUS with gcc-2.96
Date: Mon, 22 Jul 2002 10:18:58 +0200
Message-ID: <CEEE372345CE51438B0EC15F09ADE2715DDC5B@dus04a.tsb-eu.com>
From: "Sedjai, Mohamed" <MSedjai@tee.toshiba.de>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Linux/MIPS Development <linux-mips@oss.sgi.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, "Gleb O. Raiko" <raiko@niisi.msk.ru>, carstenl@mips.com
Message-ID: <20020722081858.GjUL9VGHDDcPbQyNLNhG7Q_Hv50sNYJQeydQlvYhBAc@z>

Thanks for your answer. However I still do not get the whole picture.
Here is my understanding:

Let say I have copied some code, call it CODE-1, from network into memory. 
Before I can execute CODE-1 , I need to flush the instruction cache, 
which obviously does not contain CODE-1. By the way, CODE-1 is likely 
to be present in D-Cache but this does not help so much. 

When Instruction cache flush is performed, all the I-Cache lines are
invalidated to force the core to fetch from main memory instead of I-cache.

Let's call the routine performing this operation CODE-INV. If CODE-INV is
running cached, then it is contained in some cache lines that we will call 
CODE-INV-LINES. CODE-INV is a loop that goes through all the cache lines and 
mark them as invalid.

At some point of this process, CODE-INV-LINES are invalidated but as CODE-INV 
goes on to the next lines, it is re-inserted into CODE-INV-LINES.

So when CODE-INV returns, all the I-Cache lines are marked Invalid except 
CODE-INV-LINES.

Is this correct ?

If it is why is this not causing problems ? Since there is a chance that 
CODE-1 contains code whose cache location is also CODE-INV-LINES 
and thus gets wrong instructions.

Regards,

Mohamed.


-----Original Message-----
From: Geert Uytterhoeven [mailto:geert@linux-m68k.org]
Sent: Freitag, 12. Juli 2002 11:27
To: Sedjai, Mohamed
Cc: Jon Burgess; Ralf Baechle; Gleb O. Raiko; Linux/MIPS Development;
carstenl@mips.com
Subject: RE: mips32_flush_cache routine corrupts CP0_STATUS with
gcc-2.96


On Fri, 12 Jul 2002, Sedjai, Mohamed wrote:
> If you run instruction cache flushing cached, then the cache will be dirty
> when the routine returns. At least the line(s) containing the routine itself ?
> Or am I missing something ?

Since the contents of the instruction cache are never changed (except by a
cache load), an instruction cache line can never become dirty.

Dirty cache lines and cache line write back are an exclusive privilege of write
back data caches.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
