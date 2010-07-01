Received: from rtp-iport-1.cisco.com ([64.102.122.148]:52017 "EHLO
        rtp-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491778Ab0GAV5B convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 1 Jul 2010 23:57:01 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH] Apply kmap_high_get with MIPS
Date: Thu, 1 Jul 2010 16:56:54 -0500
Message-ID: <7A9214B0DEB2074FBCA688B30B04400D0116BA36@XMB-RCD-208.cisco.com>
In-Reply-To: <AANLkTikIqTozI-VK-U2iSoMjXGJLckZM2-N2xqIGRfBy@mail.gmail.com>
From: "Dezhong Diao (dediao)" <dediao@cisco.com>
Return-Path: <dediao@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20100701215654.l8w_DfAqaGhoIYALEAxulNv6KKZFUfzFJ7KPRvTpQUo@z>

The issue (addr == 0) you mentioned had been discussed before
(http://www.linux-mips.org/archives/linux-mips/2008-03/msg00011.html).
For some reasons, the solution couldn't be accepted.

Since then, we haven't touched that function until the changes of
"kmap_high_get" were involved. The changes we made in
"__flush_dcache_page" (below) should fix the problem which has been
resolved in ARM.



Dezhong


void __flush_dcache_page(struct page *page)
{
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
