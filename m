Received: from mailapp01.imgtec.com ([195.59.15.196]:7147 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23993457AbdFBTcNAmR6n (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 2 Jun 2017 21:32:13 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 6/9] MIPS: generic: Add a MAINTAINERS entry
Date: Fri, 2 Jun 2017 12:29:56 -0700
Message-ID: <20170602192959.25435-7-paul.burton@imgtec.com>
In-Reply-To: <20170602192959.25435-1-paul.burton@imgtec.com>
References: <20170602192959.25435-1-paul.burton@imgtec.com>
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
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>
Message-ID: <20170602192956.jNUxv55iezXOTo3E4iaJPtNOb7na8QkRiB7oLH8KayY@z>

Add an entry to MAINTAINERS for the generic platform code, such that
relevant people, starting with myself, can be CC'd on patches.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 053c3bdd1fe5..fdeb722f199f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8490,6 +8490,12 @@ F:	Documentation/devicetree/bindings/mips/
 F:	Documentation/mips/
 F:	arch/mips/
 
+MIPS GENERIC PLATFORM
+M:	Paul Burton <paul.burton@imgtec.com>
+L:	linux-mips@linux-mips.org
+S:	Supported
+F:	arch/mips/generic/
+
 MIPS/LOONGSON1 ARCHITECTURE
 M:	Keguang Zhang <keguang.zhang@gmail.com>
 L:	linux-mips@linux-mips.org
-- 
2.13.0
