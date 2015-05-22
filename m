Received: from mailapp01.imgtec.com ([195.59.15.196]:50068 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006683AbbEVPwVOxAm3 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 May 2015 17:52:21 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 01/15] MIPS: define GCR_GIC_STATUS register fields
Date: Fri, 22 May 2015 16:51:00 +0100
Message-ID: <1432309875-9712-2-git-send-email-paul.burton@imgtec.com>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org
Message-ID: <20150522155100.i5iDDeHMK0Y0rtzFXZp44vdEthzWx8Fw_glb9dZLyiU@z>

Add definitions for the GICEX field in the GCR_GIC_STATUS register to
mips-cm.h for use in a later patch.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

 arch/mips/include/asm/mips-cm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 59c0901..1cb11fb 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -216,6 +216,10 @@ BUILD_CM_Cx_R_(tcid_8_priority,	0x80)
 #define CM_GCR_CPC_BASE_CPCEN_SHF		0
 #define CM_GCR_CPC_BASE_CPCEN_MSK		(_ULCAST_(0x1) << 0)
 
+/* GCR_GIC_STATUS register fields */
+#define CM_GCR_GIC_STATUS_GICEX_SHF		0
+#define CM_GCR_GIC_STATUS_GICEX_MSK		(_ULCAST_(0x1) << 0)
+
 /* GCR_REGn_BASE register fields */
 #define CM_GCR_REGn_BASE_BASEADDR_SHF		16
 #define CM_GCR_REGn_BASE_BASEADDR_MSK		(_ULCAST_(0xffff) << 16)
-- 
2.4.1
