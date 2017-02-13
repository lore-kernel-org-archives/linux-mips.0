Received: from mailapp01.imgtec.com ([195.59.15.196]:7283 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993411AbdBMKQQomphb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 13 Feb 2017 11:16:16 +0100
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH RESEND] Kbuild: add cpp_its_S in ksym_dep_filter
Date: Mon, 13 Feb 2017 11:15:56 +0100
Message-ID: <1486980956-4733-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Marcin.Nowakowski@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Cc: Michal Marek <mmarek@suse.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Message-ID: <20170213101556.alK3Bes6mNEX5pbcwkiL7rA7X7DG81sqBtnxw8eXUO0@z>

Add a new command cpp_its_S introduced in:
cf2a5e0bb4c6 ("MIPS: Support generating Flattened Image Trees (.itb)")
to ksym_dep_filter handler - otherwise a warning is produced during the
build of MIPS platforms (when vmlinux.*.itb target is chosen)

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 scripts/Kbuild.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 1792198..d6ca649 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -284,7 +284,7 @@ ksym_dep_filter =                                                            \
 	    $(CPP) $(call flags_nodeps,c_flags) -D__KSYM_DEPS__ $< ;;        \
 	  as_*_S|cpp_s_S)                                                    \
 	    $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;        \
-	  boot*|build*|*cpp_lds_S|dtc|host*|vdso*) : ;;                      \
+	  boot*|build*|cpp_its_S|*cpp_lds_S|dtc|host*|vdso*) : ;;            \
 	  *) echo "Don't know how to preprocess $(1)" >&2; false ;;          \
 	esac | tr ";" "\n" | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
 
-- 
2.7.4
