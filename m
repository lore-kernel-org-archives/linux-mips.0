Received: from mail333.us4.mandrillapp.com ([205.201.137.77]:58633 "EHLO
        mail333.us4.mandrillapp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007431AbcCAXyk09wtJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Mar 2016 00:54:40 +0100
Received: from pmta03.dal05.mailchimp.com (127.0.0.1) by mail333.us4.mandrillapp.com id hqols0174non for <linux-mips@linux-mips.org>; Tue, 1 Mar 2016 23:54:34 +0000 (envelope-from <bounce-md_30481620.56d62bba.v1-18e89a87add34809903f44b695655e92@mandrillapp.com>)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.4 154/342] Revert "MIPS: Fix PAGE_MASK definition"
Message-ID: <20160301234532.951366305@linuxfoundation.org>
In-Reply-To: <20160301234527.990448862@linuxfoundation.org>
References: <20160301234527.990448862@linuxfoundation.org>
Date: Tue, 01 Mar 2016 23:54:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-Path: <bounce-md_30481620.56d62bba.v1-18e89a87add34809903f44b695655e92@mandrillapp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Manuel Lauss <manuel.lauss@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Linux-MIPS <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160301235434.tOeqDAtmSKnEupmK2XKzQAINuTJzt2010mPHqdk1AaM@z>

4.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Dan Williams <dan.j.williams@intel.com>

commit 800dc4f49cc002879e1e5e6b79926f86b60528e6 upstream.

This reverts commit 22b14523994588279ae9c5ccfe64073c1e5b3c00.

It was originally sent in an earlier revision of the pfn_t patchset.
Besides being broken, the warning is also fixed by PFN_FLAGS_MASK
casting the PAGE_MASK to an unsigned long.

Reported-by: Manuel Lauss <manuel.lauss@gmail.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: Linux-MIPS <linux-mips@linux-mips.org>
Patchwork: https://patchwork.linux-mips.org/patch/12182/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/include/asm/page.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/mips/include/asm/page.h
+++ b/arch/mips/include/asm/page.h
@@ -33,7 +33,7 @@
 #define PAGE_SHIFT	16
 #endif
 #define PAGE_SIZE	(_AC(1,UL) << PAGE_SHIFT)
-#define PAGE_MASK	(~(PAGE_SIZE - 1))
+#define PAGE_MASK	(~((1 << PAGE_SHIFT) - 1))
 
 /*
  * This is used for calculating the real page sizes
