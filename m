From: Justin Carlson <carlson@sibyte.com>
Reply-To: carlson@sibyte.com
Subject: Cache/TLB ops atomicty/SMP effects
Date: Tue, 6 Feb 2001 11:47:35 -0800
Content-Type: text/plain
MIME-Version: 1.0
Message-ID: <0102061209410T.21018@plugh.sibyte.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com
Message-ID: <20010206194735.E5o9t56XgdMiHAf-sOFuR-1zTfXPGKvjkWIR-o1ZJLY@z>


From what I've been able to dig up, I gather that the majority of the cache
flushing ops are only used  for virtually indexed caches, wherein virutal
aliasing is a potential problem upon changing the page tables or somesuch. 
Documentation/cachetlb.txt seems a bit out of date, but covers most of it.

That's fine.  But there are the times when you've modified a memory region and
need to then execute from the same region.  In those cases on a split-cache
architecture, the icache needs to be flushed.  More specifically, this sequence
needs to happen:

flush_dirty_data_from_dcache()
sync()
invalidate_icache_region()

In an SMP system, one of two things needs to be true:

1) The entire sequence, from initial write of code to dataspace to icache
invalidate, needs to be run on a single processor.  Since the scheduler doesn't
guarantee processor allocations to work that way, the entire code sequence has
to be atomic.

 -OR-

2) We need to execute the writeback and icache invalidate on all processors in
the system, with synchronization points occuring after the dcache writeback
as well as after the icache invalidate.

The first option looks completely infeasible, and if the second option is
implemented in the mips64 tree, I'm just missing it somehow.  The sparc/
tree has smp_flush_cache type ops in arch/sparc/kernel/smp.c.  The mips64
tree, though, has support for cross cpu TLB flushes, but not for cache flushes.

Does anyone with a clearer grasp of how this works care to enlighten me?

Thanks,
  Justin




 -- 
carlson@broadcom.com
(408) 922-7098
