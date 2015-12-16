Received: from mailapp01.imgtec.com ([195.59.15.196]:6378 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27014081AbbLPXuURx7O0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 17 Dec 2015 00:50:20 +0100
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 16/16] MAINTAINERS: Add KVM for MIPS entry
Date: Wed, 16 Dec 2015 23:49:41 +0000
Message-ID: <1450309781-28030-17-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1450309781-28030-1-git-send-email-james.hogan@imgtec.com>
References: <1450309781-28030-1-git-send-email-james.hogan@imgtec.com>
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
To: Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20151216234941.20PwX8ihNPkuMA-kftflv2c-1vvnH03Km3vnIBzCMPs@z>

I've pretty much been maintaining KVM for MIPS for a while now. Lets
make it more official (and make sure I get Cc'd on relevant patches).

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9bff63cf326e..351944d81f7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6119,6 +6119,14 @@ F:	arch/arm64/include/uapi/asm/kvm*
 F:	arch/arm64/include/asm/kvm*
 F:	arch/arm64/kvm/
 
+KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
+M:	James Hogan <james.hogan@imgtec.com>
+L:	linux-mips@linux-mips.org
+S:	Supported
+F:	arch/mips/include/uapi/asm/kvm*
+F:	arch/mips/include/asm/kvm*
+F:	arch/mips/kvm/
+
 KEXEC
 M:	Eric Biederman <ebiederm@xmission.com>
 W:	http://kernel.org/pub/linux/utils/kernel/kexec/
-- 
2.4.10
