Reply-To: <a.voropay@vmb-service.ru>
From: "Alec Voropay" <a.voropay@vmb-service.ru>
Subject: JAZZ architecture
Date: Fri, 15 Oct 2004 16:12:18 +0400
Message-ID: <00c501c4b2b0$3a4a42b0$1701a8c0@vmbservice.ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
Return-Path: <a.voropay@vmb-service.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041015121218.SN96o2039id6kh3Yhy8ibxAiiHnyFZO1ti-2mYxuRTs@z>

Hi!

 Can anyone help me to compile linux_2_4 (from the linux-mips CVS)
for the MIPS JAZZ architecture ?

 I have a lot of unreferenced symbols during link stage.

 It seems, kernel API was changed. What is
spin_unlock_restoreirq()
spin_lock_saveirq()
spin_unlock_restoreirq()
?

=====
arch/mips/jazz/jazz.o(.bss+0x10): multiple definition of
`board_time_init'
arch/mips/kernel/kernel.o(.bss+0x77c): first defined here
arch/mips/mm/mm.o(.text+0x5cc): In function `free_initmem':
: undefined reference to `prom_free_prom_memory'
arch/mips/jazz/jazz.o(.text+0x1fc): In function `ll_count':
: undefined reference to `return'
arch/mips/jazz/jazz.o(.text+0x344): In function `vdma_alloc':
: undefined reference to `spin_unlock_restoreirq'
arch/mips/jazz/jazz.o(.text+0x35c): In function `vdma_alloc':
: undefined reference to `spin_lock_saveirq'
arch/mips/jazz/jazz.o(.text+0x498): In function `vdma_alloc':
: undefined reference to `spin_unlock_restoreirq'
arch/mips/jazz/jazz.o(.text.init+0x2c8): In function `jazz_setup':
: undefined reference to `irq_setup'
arch/mips/jazz/jazz.o(.text.init+0x2cc): In function `jazz_setup':
: undefined reference to `irq_setup'
arch/mips/jazz/jazz.o(.text.init+0x368): In function `jazz_setup':
: undefined reference to `dummy_con'
arch/mips/jazz/jazz.o(.text.init+0x36c): In function `jazz_setup':
: undefined reference to `dummy_con'
arch/mips/arc/arclib.a(init.o)(.text.init+0x88): In function
`prom_init':
: undefined reference to `prom_meminit'
arch/mips/arc/arclib.a(arc_con.o)(.text+0x44): In function
`prom_console_write':
: undefined reference to `prom_putchar'
arch/mips/arc/arclib.a(arc_con.o)(.text+0x5c): In function
`prom_console_write':
: undefined reference to `prom_putchar'
arch/mips/lib/lib.a(promlib.o)(.text+0x54): In function `prom_printf':
: undefined reference to `prom_putchar'
arch/mips/lib/lib.a(promlib.o)(.text+0x68): In function `prom_printf':
: undefined reference to `prom_putchar'
make: *** [vmlinux] Error 1


-- 
-=AV=- 
