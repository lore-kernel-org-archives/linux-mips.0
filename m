Message-ID: <398244D5.F86DE02C@mvista.com>
Date: Fri, 28 Jul 2000 19:43:33 -0700
From: Jun Sun <jsun@mvista.com>
MIME-Version: 1.0
Subject: Re: Turning off cache ...
References: <3980D95A.5949E980@mvista.com> <20000728030836.A1906@bacchus.dhis.org>
Content-Type: multipart/mixed;
 boundary="------------07B833AB41C1174A1529D62C"
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
Cc: linux-mips@fnet.fr, linux@cthulhu.engr.sgi.com
Message-ID: <20000729024333.AQKSKSLS3fQ4CydOrQt7hMYrhXSNoE2t79fYkc27mRc@z>

This is a multi-part message in MIME format.
--------------07B833AB41C1174A1529D62C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ralf Baechle wrote:
> 
> On Thu, Jul 27, 2000 at 05:52:42PM -0700, Jun Sun wrote:
> 
> > Is there is easy way to turn off caching entirely?  I understand I need
> > to set k0 bits in config register.  What about those C bits in TLB
> > entries?  My CPU only has primary cache.
> 
> The C bits are per page, the k0 bits are for KSEG0.  If you want to
> turn of caching, then you need to:
> 
>   - change the k0 bits to uncached on startup, then flush the caches or a
>     writeback might corrupt your data.
>   - change the caching mode of the usermode pages by modifying the
>     definitions for PAGE_NONE etc. in pgtable.h.
>   - comment out the cache Create_Dirty_Exclusive instructions in r4xx0.c,
>     using them on uncached pages would corrupt data.
> 
> Which will make the kernel crawl awfully ...
> 
>   Ralf

I have successfully turned of cache.  And of course my cache code is not
the source for the problem :-) - which means I need to probe further.
:-(

For those who are interested, here is the patch that gives how I did
it.  Specifically, ld_mmu_r4k() has a line of code to turn on cache,
which needs to be commented out.  I explicitly turned off cache in
ld_mmu_r4k(), right after a flush_all_cache() call, instead of at the
beginnig of kernel_entry.

Jun
--------------07B833AB41C1174A1529D62C
Content-Type: text/plain; charset=us-ascii;
 name="linux-mips-v2.4.0-test2-r4k-cache-off.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="linux-mips-v2.4.0-test2-r4k-cache-off.patch"

--- include/asm/pgtable.h.orig	Fri Jul 28 15:22:09 2000
+++ include/asm/pgtable.h	Fri Jul 28 15:22:54 2000
@@ -132,7 +132,7 @@
 #define _CACHE_CACHABLE_NO_WA       (0<<9)  /* R4600 only              */
 #define _CACHE_CACHABLE_WA          (1<<9)  /* R4600 only              */
 #define _CACHE_UNCACHED             (2<<9)  /* R4[0246]00              */
-#define _CACHE_CACHABLE_NONCOHERENT (3<<9)  /* R4[0246]00              */
+#define _CACHE_CACHABLE_NONCOHERENT (2<<9)  /* R4[0246]00              */
 #define _CACHE_CACHABLE_CE          (4<<9)  /* R4[04]00 only           */
 #define _CACHE_CACHABLE_COW         (5<<9)  /* R4[04]00 only           */
 #define _CACHE_CACHABLE_CUW         (6<<9)  /* R4[04]00 only           */
--- arch/mips/mm/r4xx0.c.cache-off	Fri Jul 28 14:49:23 2000
+++ arch/mips/mm/r4xx0.c	Fri Jul 28 19:38:17 2000
@@ -105,7 +105,7 @@
 		:"=r" (page)
 		:"0" (page),
 		 "I" (PAGE_SIZE),
-		 "i" (Create_Dirty_Excl_D)
+		 "i" (Hit_Writeback_Inv_D)
 		:"$1","memory");
 }
 
@@ -134,7 +134,7 @@
 		:"=r" (page)
 		:"0" (page),
 		 "I" (PAGE_SIZE),
-		 "i" (Create_Dirty_Excl_D)
+		 "i" (Hit_Writeback_Inv_D)
 		:"$1","memory");
 }
 
@@ -143,8 +143,8 @@
  * This flavour of r4k_clear_page is for the R4600 V1.x.  Cite from the
  * IDT R4600 V1.7 errata:
  *
- *  18. The CACHE instructions Hit_Writeback_Invalidate_D, Hit_Writeback_D,
- *      Hit_Invalidate_D and Create_Dirty_Excl_D should only be
+ *  18. The CACHE instructions Hit_Writeback_Inv_D, Hit_Writeback_D,
+ *      Hit_Invalidate_D and Hit_Writeback_Inv_D should only be
  *      executed if there is no other dcache activity. If the dcache is
  *      accessed for another instruction immeidately preceding when these
  *      cache instructions are executing, it is possible that the dcache 
@@ -157,14 +157,14 @@
  *                              nop
  *                              nop
  *                              nop
- *                              cache       Hit_Writeback_Invalidate_D
+ *                              cache       Hit_Writeback_Inv_D
  *
  *      This is allowed:        lw
  *                              nop
  *                              nop
  *                              nop
  *                              nop
- *                              cache       Hit_Writeback_Invalidate_D
+ *                              cache       Hit_Writeback_Inv_D
  */
 static void r4k_clear_page_r4600_v1(void * page)
 {
@@ -198,7 +198,7 @@
 		:"=r" (page)
 		:"0" (page),
 		 "I" (PAGE_SIZE),
-		 "i" (Create_Dirty_Excl_D)
+		 "i" (Hit_Writeback_Inv_D)
 		:"$1","memory");
 }
 
@@ -234,7 +234,7 @@
 		:"=r" (page)
 		:"0" (page),
 		 "I" (PAGE_SIZE),
-		 "i" (Create_Dirty_Excl_D)
+		 "i" (Hit_Writeback_Inv_D)
 		:"$1","memory");
 	restore_flags(flags);
 }
@@ -434,7 +434,7 @@
 		 "=&r" (reg1), "=&r" (reg2), "=&r" (reg3), "=&r" (reg4)
 		:"0" (to), "1" (from),
 		 "I" (PAGE_SIZE),
-		 "i" (Create_Dirty_Excl_D));
+		 "i" (Hit_Writeback_Inv_D));
 }
 
 static void r4k_copy_page_d32(void * to, void * from)
@@ -491,7 +491,7 @@
 		 "=&r" (reg1), "=&r" (reg2), "=&r" (reg3), "=&r" (reg4)
 		:"0" (to), "1" (from),
 		 "I" (PAGE_SIZE),
-		 "i" (Create_Dirty_Excl_D));
+		 "i" (Hit_Writeback_Inv_D));
 }
 
 /*
@@ -559,7 +559,7 @@
 		 "=&r" (reg1), "=&r" (reg2), "=&r" (reg3), "=&r" (reg4)
 		:"0" (to), "1" (from),
 		 "I" (PAGE_SIZE),
-		 "i" (Create_Dirty_Excl_D));
+		 "i" (Hit_Writeback_Inv_D));
 }
 
 static void r4k_copy_page_r4600_v2(void * to, void * from)
@@ -626,7 +626,7 @@
 		 "=&r" (reg1), "=&r" (reg2), "=&r" (reg3), "=&r" (reg4)
 		:"0" (to), "1" (from),
 		 "I" (PAGE_SIZE),
-		 "i" (Create_Dirty_Excl_D));
+		 "i" (Hit_Writeback_Inv_D));
 	restore_flags(flags);
 }
 
@@ -2783,7 +2783,9 @@
 
 	printk("CPU revision is: %08x\n", read_32bit_cp0_register(CP0_PRID));
 
+	/* [jsun]
 	set_cp0_config(CONF_CM_CMASK, CONF_CM_CACHABLE_NONCOHERENT);
+	*/
 
 	probe_icache(config);
 	probe_dcache(config);
@@ -2803,6 +2805,7 @@
 	}
 
 	flush_cache_all();
+	set_cp0_config(CONF_CM_CMASK, CONF_CM_UNCACHED);
 	write_32bit_cp0_register(CP0_WIRED, 0);
 
 	/*

--------------07B833AB41C1174A1529D62C--
