Received: from mail177-1.suw61.mandrillapp.com ([198.2.177.1]:18396 "EHLO
        mail177-1.suw61.mandrillapp.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27008274AbcCAXvHZPMoJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 2 Mar 2016 00:51:07 +0100
Received: from pmta06.mandrill.prod.suw01.rsglab.com (127.0.0.1) by mail177-1.suw61.mandrillapp.com id hqolem22rtkc for <linux-mips@linux-mips.org>; Tue, 1 Mar 2016 23:51:01 +0000 (envelope-from <bounce-md_30481620.56d62ae5.v1-ac359879b2d54eaba7e4c2153567da0c@mandrillapp.com>)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3.14 034/130] MIPS: KVM: Fix CACHE immediate offset sign extension
Message-ID: <20160301234500.958850070@linuxfoundation.org>
In-Reply-To: <20160301234459.768886030@linuxfoundation.org>
References: <20160301234459.768886030@linuxfoundation.org>
Date: Tue, 01 Mar 2016 23:51:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-Path: <bounce-md_30481620.56d62ae5.v1-ac359879b2d54eaba7e4c2153567da0c@mandrillapp.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Paolo Bonzini <pbonzini@redhat.com>, Gleb Natapov <gleb@kernel.org>, linux-mips@linux-mips.org, kvm@vger.kernel.org
Message-ID: <20160301235101.COvLvWONYIJNrbxuABdoAV0EXJMk8uLy7xwpeHy3Y5E@z>

3.14-stable review patch.  If anyone has any objections, please let me know.

------------------

From: James Hogan <james.hogan@imgtec.com>

commit c5c2a3b998f1ff5a586f9d37e154070b8d550d17 upstream.

The immediate field of the CACHE instruction is signed, so ensure that
it gets sign extended by casting it to an int16_t rather than just
masking the low 16 bits.

Fixes: e685c689f3a8 ("KVM/MIPS32: Privileged instruction/target branch emulation.")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>
Cc: linux-mips@linux-mips.org
Cc: kvm@vger.kernel.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/mips/kvm/kvm_mips_emul.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/mips/kvm/kvm_mips_emul.c
+++ b/arch/mips/kvm/kvm_mips_emul.c
@@ -935,7 +935,7 @@ kvm_mips_emulate_cache(uint32_t inst, ui
 
 	base = (inst >> 21) & 0x1f;
 	op_inst = (inst >> 16) & 0x1f;
-	offset = inst & 0xffff;
+	offset = (int16_t)inst;
 	cache = (inst >> 16) & 0x3;
 	op = (inst >> 18) & 0x7;
