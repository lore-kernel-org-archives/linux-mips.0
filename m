Received: from mailapp01.imgtec.com ([195.59.15.196]:57426 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009661AbbJFOMlRxufk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 6 Oct 2015 16:12:41 +0200
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 0/2] ttyFDC: Fix build problems due to use of module_{init,exit}
Date: Tue, 6 Oct 2015 15:12:04 +0100
Message-ID: <1444140726-5740-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <james.hogan@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20151006141204.Ll-bVuBk_meV2BkyEopJQBxw4Nlrm6VdhneFyBQ1IV8@z>

Fix ttyFDC build breakage since v4.2-rc3, due to use of module_driver()
without including module.h (its currently a builtin only driver).

The first patch adds a macro used by second patch, so they both need to
go into stable v4.2 together.

James Hogan (2):
  MIPS: CDMM: Add builtin_mips_cdmm_driver() macro
  ttyFDC: Fix build problems due to use of module_{init,exit}

 arch/mips/include/asm/cdmm.h | 11 +++++++++++
 drivers/tty/mips_ejtag_fdc.c | 35 +----------------------------------
 2 files changed, 12 insertions(+), 34 deletions(-)

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-mips@linux-mips.org
Cc: <stable@vger.kernel.org>
-- 
2.4.9
