Date: Sun, 16 Sep 2001 13:29:38 -0300 (ADT)
From: Wilbern Cobb <cobb@cn.csoft.net>
Subject: Re: linker problem: relocation truncated to fit
In-Reply-To: <20010916091654.C1812@lucon.org>
Message-ID: <Pine.BSO.4.33.0109161323280.14503-100000@oddbox.cn>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: "H . J . Lu" <hjl@lucon.org>
Cc: Petter Reinholdtsen <pere@hungry.com>, linux-mips@oss.sgi.com
Message-ID: <20010916162938.Dw0psZnkcTUwJEW7SZn4NObj_UjkGdFeajYq-aUpWUs@z>

On Sun, 16 Sep 2001, H . J . Lu wrote:

> >   libopera.a(registerdialog.o): In function
> >     `RegisterDialog::RegisterDialog(QWidget *, char const *, bool)':
> >   linux/ui/registerdialog.cpp(.text+0xd08): relocation truncated to
> >     fit: R_MIPS_GOT16 RegisterDialog virtual table
> >   libopera.a(registerdialog.o): In function
> >     `RegisterDialog::slotOk(void)':
> >   linux/ui/registerdialog.cpp(.text+0xdd8): relocation truncated to
> >     fit: R_MIPS_CALL16 RegisterWidget::verifySettings(void)
> >   libopera.a(registerdialog.o): In function `onceinalifetime(void)':
> >   regkey/regver.h(.text+0x10d8): relocation truncated to fit:
> >     R_MIPS_CALL16 regkey_init(void)
>
> This may be a MIPS linker bug/limitation. But I don't use Qt on mips

This is a `feature' of the MIPS toolchain. Global and static items <= n
bytes are placed into the small data or small bss sections instead of
the normal data or bss sections as an optimization. Excess items would
cause these linker errors.

Pass the compiler the -Gn flag (default is 8 bytes), ie. -G4 should work
for most purposes.

-vedge
