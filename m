Received: from mailapp01.imgtec.com ([195.59.15.196]:38420 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011616AbbD1J5qRugK6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 28 Apr 2015 11:57:46 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] MIPS: CDMM big endian fixes for v4.1
Date: Tue, 28 Apr 2015 10:57:28 +0100
Message-ID: <1430215050-4995-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, linux-mips@linux-mips.org
Message-ID: <20150428095728.e8Kyyox4K-uwLHWp21k4JZf2SfvUoNpQ1PxfvTN6D0s@z>

The MIPS Common Device Memory Map (CDMM) is internal to the core and has
native endianness. There is therefore no need to byte swap the MMIO
accesses on big endian targets. This patchset converts the CDMM bus
driver and Fast Debug Channel (FDC) TTY driver to use __raw_readl() and
__raw_writel() when accessing the CDMM so they work on big endian
targets too.

I guess it makes sense for this to go via the MIPS tree since thats
where the original patches were applied. Please apply for v4.1.

James Hogan (2):
  MIPS: Fix CDMM to use native endian MMIO reads
  ttyFDC: Fix to use native endian MMIO reads

 drivers/bus/mips_cdmm.c      |  4 ++--
 drivers/tty/mips_ejtag_fdc.c | 17 +++++++++--------
 2 files changed, 11 insertions(+), 10 deletions(-)

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>
Cc: linux-mips@linux-mips.org
-- 
2.0.5
