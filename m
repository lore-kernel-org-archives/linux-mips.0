Received: from mailapp01.imgtec.com ([195.59.15.196]:17151 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008171AbaIEBDshWgHl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 5 Sep 2014 03:03:48 +0200
Subject: [PATCH 0/3] PTE formats changes
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Thu, 4 Sep 2014 18:03:39 -0700
Message-ID: <20140905010124.15448.53707.stgit@linux-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, hauke@hauke-m.de, yanh@lemote.com, zajec5@gmail.com, ralf@linux-mips.org, alex.smith@imgtec.com, taohl@lemote.com, chenhc@lemote.com
Message-ID: <20140905010339.ymYTDccbKXznH8158Hg0O65Luy2JzM485onEyGz4Fsw@z>

The following series implements bugfix of PTE formats for swap and file entries
and changes PTE bit position to fixed, which is more better for analysing of
tracer and HW debugger logs.

Hardcoded bits positions and offsets in PTE effectively causes a miss of
relationship between PTE format for TLB and PTE formats for swap and file
entries. This patch series introduces a symbolic relation between both and
also fixes a current mismatch of formats. It can crash kernel or application
in heavy paging environment.

Fixed bit positions helps much in analysing of tracer and HW debugger logs and
improves performance and code size a little due to absence of variable masks
in kernel.

---

Leonid Yegoshin (3):
      MIPS: rearrange PTE bits into fixed positions
      MIPS: PTE bit positions slightly changed to prepare a more simple swap/file presentation
      MIPS: bugfix of PTE formats for swap and file entries


 arch/mips/include/asm/pgtable-32.h   |  107 ++++++++-----------
 arch/mips/include/asm/pgtable-64.h   |   25 +++-
 arch/mips/include/asm/pgtable-bits.h |  189 ++++++++++++++++++++++++++++++----
 3 files changed, 232 insertions(+), 89 deletions(-)

-- 
Signature
