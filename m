Received: from mail-bn1blp0185.outbound.protection.outlook.com ([207.46.163.185]:32734
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6837585AbaEFPwcwh0R3 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 6 May 2014 17:52:32 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: [PATCH 04/11] kvm tools: Allow to load ELF binary
Date: Tue, 6 May 2014 17:51:24 +0200
Message-ID: <1399391491-5021-5-git-send-email-andreas.herrmann@caviumnetworks.com>
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
Cc: David Daney <ddaney.cavm@gmail.com>, Andreas Herrmann <andreas.herrmann@caviumnetworks.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20140506155124.vX5Pm9hKqjUqOHtONJLdAGq66WKFVJAJ5GhBYBtB7E8@z>

Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
---
 tools/kvm/include/kvm/kvm.h |    1 +
 tools/kvm/kvm.c             |   11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/tools/kvm/include/kvm/kvm.h b/tools/kvm/include/kvm/kvm.h
index d05b936..3643fe3 100644
--- a/tools/kvm/include/kvm/kvm.h
+++ b/tools/kvm/include/kvm/kvm.h
@@ -109,6 +109,7 @@ void *guest_flat_to_host(struct kvm *kvm, u64 offset);
 u64 host_to_guest_flat(struct kvm *kvm, void *ptr);
 
 int load_flat_binary(struct kvm *kvm, int fd_kernel, int fd_initrd, const char *kernel_cmdline);
+int load_elf_binary(struct kvm *kvm, int fd_kernel, int fd_initrd, const char *kernel_cmdline);
 bool load_bzimage(struct kvm *kvm, int fd_kernel, int fd_initrd, const char *kernel_cmdline);
 
 /*
diff --git a/tools/kvm/kvm.c b/tools/kvm/kvm.c
index 7bd20d3..cfc0693 100644
--- a/tools/kvm/kvm.c
+++ b/tools/kvm/kvm.c
@@ -349,6 +349,12 @@ static bool initrd_check(int fd)
 		!memcmp(id, CPIO_MAGIC, 4);
 }
 
+int __attribute__((__weak__)) load_elf_binary(struct kvm *kvm, int fd_kernel,
+				int fd_initrd, const char *kernel_cmdline)
+{
+	return false;
+}
+
 bool kvm__load_kernel(struct kvm *kvm, const char *kernel_filename,
 		const char *initrd_filename, const char *kernel_cmdline)
 {
@@ -375,6 +381,11 @@ bool kvm__load_kernel(struct kvm *kvm, const char *kernel_filename,
 
 	pr_warning("%s is not a bzImage. Trying to load it as a flat binary...", kernel_filename);
 
+	ret = load_elf_binary(kvm, fd_kernel, fd_initrd, kernel_cmdline);
+
+	if (ret)
+		goto found_kernel;
+
 	ret = load_flat_binary(kvm, fd_kernel, fd_initrd, kernel_cmdline);
 
 	if (ret)
-- 
1.7.9.5
