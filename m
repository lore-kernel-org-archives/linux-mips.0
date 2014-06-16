Received: from mail-by2lp0236.outbound.protection.outlook.com ([207.46.163.236]:46732
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6817535AbaFPLs1iquQa (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 16 Jun 2014 13:48:27 +0200
Date: Mon, 16 Jun 2014 13:47:29 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH] kvm tools, mips: Adapt signature of kvm_cpu__emulate_io
Message-ID: <20140616114729.GB17831@alberich>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
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
Cc: David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>
Message-ID: <20140616114729.ayCYyTojuGHHDNJfDVBJX9ILwo628Nbp4PcLxjRpkbs@z>


Use struct kvm_cpu instead of struct kvm.
This change is req'd due to commit
8d770c4096cdf73e1b79e7395ef3a86aa2887077
(kvmtool: virtio: pass trapped vcpu to IO accessors).

Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/mips/include/kvm/kvm-cpu-arch.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Hi Pekka,

When submitting v3 patch set for mips support
(http://marc.info/?i=1401307735-16195-1-git-send-email-andreas.herrmann@caviumnetworks.com)
that was based on v3.13-rc1-1436-g1fc83c5 of your tree.
Thus I missed commit 8d770c4096cdf73e1b79e7395ef3a86aa2887077
(kvmtool: virtio: pass trapped vcpu to IO accessors)

This patch provides the req'd change for above commit to fix
compilation for mips.

Please apply.


Thanks,

Andreas

diff --git a/tools/kvm/mips/include/kvm/kvm-cpu-arch.h b/tools/kvm/mips/include/kvm/kvm-cpu-arch.h
index fc286b1..3db7f2b 100644
--- a/tools/kvm/mips/include/kvm/kvm-cpu-arch.h
+++ b/tools/kvm/mips/include/kvm/kvm-cpu-arch.h
@@ -29,9 +29,9 @@ struct kvm_cpu {
  * As these are such simple wrappers, let's have them in the header so they'll
  * be cheaper to call:
  */
-static inline bool kvm_cpu__emulate_io(struct kvm *kvm, u16 port, void *data, int direction, int size, u32 count)
+static inline bool kvm_cpu__emulate_io(struct kvm_cpu *vcpu, u16 port, void *data, int direction, int size, u32 count)
 {
-	return kvm__emulate_io(kvm, port, data, direction, size, count);
+	return kvm__emulate_io(vcpu, port, data, direction, size, count);
 }
 
 static inline bool kvm_cpu__emulate_mmio(struct kvm_cpu *vcpu, u64 phys_addr, u8 *data, u32 len, u8 is_write)
-- 
1.7.9.5
