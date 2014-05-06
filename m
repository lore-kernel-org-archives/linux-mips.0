Received: from mail-bn1blp0188.outbound.protection.outlook.com ([207.46.163.188]:7693
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6837156AbaEFPwQjSF-R (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 6 May 2014 17:52:16 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 01/11] kvm tools: Print message on failure of KVM_CREATE_VM
Date: Tue, 6 May 2014 17:51:21 +0200
Message-ID: <1399391491-5021-2-git-send-email-andreas.herrmann@caviumnetworks.com>
In-Reply-To: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
References: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Pekka Enberg <penberg@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20140506155121.D5rFuWf3MofUJkzAk71xwGNu7IVuuyasTkj1bAK0pOI@z>

From: David Daney <david.daney@cavium.com>

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/kvm.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/kvm/kvm.c b/tools/kvm/kvm.c
index d7d2e84..7bd20d3 100644
--- a/tools/kvm/kvm.c
+++ b/tools/kvm/kvm.c
@@ -286,6 +286,7 @@ int kvm__init(struct kvm *kvm)
 
 	kvm->vm_fd = ioctl(kvm->sys_fd, KVM_CREATE_VM, 0);
 	if (kvm->vm_fd < 0) {
+		pr_err("KVM_CREATE_VM ioctl");
 		ret = kvm->vm_fd;
 		goto err_sys_fd;
 	}
-- 
1.7.9.5
