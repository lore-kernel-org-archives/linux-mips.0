Received: from rtp-iport-1.cisco.com ([64.102.122.148]:52643 "EHLO
        rtp-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492124Ab0GBBoQ convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 2 Jul 2010 03:44:16 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH] Apply kmap_high_get with MIPS
Date: Thu, 1 Jul 2010 20:44:07 -0500
Message-ID: <7A9214B0DEB2074FBCA688B30B04400D0116BADD@XMB-RCD-208.cisco.com>
In-Reply-To: <7A9214B0DEB2074FBCA688B30B04400D0116BA36@XMB-RCD-208.cisco.com>
From: "Dezhong Diao (dediao)" <dediao@cisco.com>
Return-Path: <dediao@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20100702014407.dmgmRo425GTvBFdnBIOB0yG4Vi9sCaPa1kc-TaMLQsw@z>

In terms of my previous email, the changes are intended to be made in
"__dma_sync_contiguous" so that "addr == 0" case can be satisfied. 


+static inline void __dma_sync_contiguous(struct page *page,
+	unsigned long offset, size_t size, enum dma_data_direction
direction) 
+{
+	unsigned long addr;
+
+	if (!PageHighMem(page)) {
+		addr = (unsigned long)page_address(page) + offset;
+		__dma_sync_virtual(addr, size, direction);
+	} else {
+		addr = (unsigned long)kmap_high_get(page);
+		if (addr) {
+			addr += offset;
+			__dma_sync_virtual(addr, size, direction);
+			kunmap_high(page);
+		} else {
+			addr = (unsigned long)kmap_atomic(page,
KM_MIPS_SYNC_PAGE);
+			flush_data_cache_page(addr + offset);
+			kunmap_atomic((void *)addr, KM_MIPS_SYNC_PAGE);
+           }           
+	} 
+}
+


Dezhong

-----Original Message-----
From: linux-mips-bounce@linux-mips.org
[mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Dezhong Diao
(dediao)
Sent: Thursday, July 01, 2010 2:57 PM
To: Kevin Cernekee
Cc: linux-mips@linux-mips.org
Subject: RE: [PATCH] Apply kmap_high_get with MIPS

The issue (addr == 0) you mentioned had been discussed before
(http://www.linux-mips.org/archives/linux-mips/2008-03/msg00011.html).
For some reasons, the solution couldn't be accepted.

Since then, we haven't touched that function until the changes of
"kmap_high_get" were involved. The changes we made in
"__flush_dcache_page" (below) should fix the problem which has been
resolved in ARM.



Dezhong


void __flush_dcache_page(struct page *page) {
  struct address_space *mapping = page_mapping(page);
  void *addr;

  /* If there is a temporary kernel mapping, i.e. if kmap_atomic was
   * used to map a page, we only need to flush the page. We can skip
   * the other work here because it won't be used in any other way. */
  if (PageHighMem(page)) {
    addr = kmap_atomic_to_vaddr(page);
    if (addr != NULL) {
      flush_data_cache_page((unsigned long) addr);
      return;
    }
  }

  /* If page_mapping returned a non-NULL value, then the page is not
   * in the swap cache and it isn't anonymously mapped. If it's not
   * already mapped into user space, we can just set the dirty bit to
   * get the cache flushed later, if needed */
  if (mapping && !mapping_mapped(mapping)) {
    SetPageDcacheDirty(page);
    return;
  }

  /*
   * We could delay the flush for the !page_mapping case too.  But that
   * case is for exec env/arg pages and those are %99 certainly going to
   * get faulted into the tlb (and thus flushed) anyways.
   */	
  if (!PageHighMem(page)) {
    addr = page_address(page);
    flush_data_cache_page((unsigned long) addr);
  } else {
    if (!cpu_has_dc_aliases) {
      addr = kmap_high_get(page);
      if (addr) {
        /* The page has been kmapped */
        flush_data_cache_page((unsigned long) addr);
        kunmap_high(page);
      } else {
        /* Alright, we need a temporary kernel mapping. Since we are on
         * a processor that has hardware to eliminate data cache
         * aliases, we don't have to get an address whose virtual index
         * into the cache that matches the index originally used to map
         * the page. This makes the task doable. */
        addr = kmap_atomic(page, KM_MIPS_SYNC_PAGE);
        flush_data_cache_page((unsigned long) addr);
        kunmap_atomic(addr, KM_MIPS_SYNC_PAGE);
      }
    } else {
      /* Sorry, we may have data cache aliases, which means that we
       * have to be able to get a virtual address whose virtual index
       * into cache matches the index used to map this page. This is
       * hard and so, just like the hard problems in my Physics
       * classes, is left as an exercise for the reader. */
      panic("Unable to flush page 0x%p on processor with data cache "
            "aliases\n", page);
    }
  }
}
