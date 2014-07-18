Received: from mailapp01.imgtec.com ([195.59.15.196]:58088 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6861349AbaGRJwFJaK3z (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Jul 2014 11:52:05 +0200
Received: from KLMAIL01.kl.imgtec.org (unknown [192.168.5.35])
        by Websense Email Security Gateway with ESMTPS id F32F8C3E2B095
        for <linux-mips@linux-mips.org>; Fri, 18 Jul 2014 10:51:55 +0100 (IST)
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: [PATCH 4/4] MIPS: pgtable.h: Implement the pgprot_writecombine function for MIPS
Date: Fri, 18 Jul 2014 10:51:33 +0100
Message-ID: <1405677093-22591-5-git-send-email-markos.chandras@imgtec.com>
In-Reply-To: <1405677093-22591-1-git-send-email-markos.chandras@imgtec.com>
References: <1405677093-22591-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Markos Chandras <markos.chandras@imgtec.com>
Message-ID: <20140718095133.3xOe8hvargNMV8iWbPYcr9oWssevj5i4lUOB6-9VLlE@z>

Previously, the pgprot_writecombine function was simply defined
as pgprot_uncached in include/asm-generic/pgtable.h. This is not
optimal for cores that can actually do write-combine memory writes
so define this function to take into account the core's cache coherency
attribute to achieve such behavior.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 arch/mips/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 539ddd148bbb..08f82e99ea8f 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -338,6 +338,16 @@ static inline pgprot_t pgprot_noncached(pgprot_t _prot)
 	return __pgprot(prot);
 }
 
+static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
+{
+	unsigned long prot = pgprot_val(_prot);
+
+	/* cpu_data[0].writecombine is already shifted by _CACHE_SHIFT */
+	prot = (prot & ~_CACHE_MASK) | cpu_data[0].writecombine;
+
+	return __pgprot(prot);
+}
+
 /*
  * Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
-- 
2.0.0
