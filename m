content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: [PATCH] Using JR instead of J instruction for jumping to IRQ handler.
Date: Sat, 12 Feb 2005 16:26:29 +0530
Message-ID: <F6B01C6242515443BB6E5DDD63AE935F046834@dbde2k01.itg.ti.com>
From: "Nori, Soma Sekhar" <nsekhar@ti.com>
Return-Path: <nsekhar@ti.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20050212105629.isiMjHD_VB4E6tu_Lt4Fh9lHDCzhPCCY1YtOrWaP3zo@z>


Hi Ralf,

Attached patch attempts to use load address k0, <handler> followed by
jump register k0 to jump to the MIPS IRQ handler from CAC_BASE + 0x200
instead of just jump <handler>. This will enable jumping even if IRQ
handler is linked at high kernel logical address. (like 0x94000000+).

I have tested this to work fine on my 4kec. (Not sure if the code will
hold good for MIPS64 though)

Thanks,
Sekhar Nori.

--- linux.orig/arch/mips/kernel/traps.c 2004-12-25 03:04:32.000000000
+0530
+++ linux/arch/mips/kernel/traps.c      2005-02-12 14:53:32.465876000
+0530
@@ -848,9 +848,12 @@

        exception_handlers[n] = handler;
        if (n == 0 && cpu_has_divec) {
-               *(volatile u32 *)(CAC_BASE + 0x200) = 0x08000000 |
-                                                (0x03ffffff & (handler
>> 2));
-               flush_icache_range(CAC_BASE + 0x200, CAC_BASE + 0x204);
+               *(volatile u32 *)(CAC_BASE + 0x200) = 0x3c1a0000 |
+                                        (handler >> 16);
+               *(volatile u32 *)(CAC_BASE + 0x204) = 0x375a0000 |
+                                        (handler & 0xFFFF);
+               *(volatile u32 *)(CAC_BASE + 0x208) = 0x03400008;
+               flush_icache_range(CAC_BASE + 0x200, CAC_BASE + 0x20C);

        }
        return (void *)old_handler;
 }
