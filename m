Received: from 19pmail.ess.barracuda.com ([64.235.150.244]:34025 "EHLO
        19pmail.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993310AbdKBKpVlSAhI convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 2 Nov 2017 11:45:21 +0100
From: Marcin Nowakowski <marcin.nowakowski@mips.com>
Subject: [PATCH] Update email address for Marcin Nowakowski
Date: Thu, 2 Nov 2017 11:45:11 +0100
Message-ID: <1509619511-29856-1-git-send-email-marcin.nowakowski@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-Path: <Marcin.Nowakowski@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: james.hogan@mips.com, linux-mips@linux-mips.org
Cc: Marcin Nowakowski <marcin.nowakowski@mips.com>
Message-ID: <20171102104511.e2z1gZgkBkTmav8X4M8K7tIocFdtUHpXABP9K-ULq9A@z>

MIPS is no longer part of Imagination Technologies and my @imgtec.com
address will soon stop working. Update any files containing my address
as well as the .mailmap to point to my new @mips.com address.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@mips.com>
---
 .mailmap                         | 1 +
 arch/mips/generic/kexec.c        | 2 +-
 arch/mips/kernel/probes-common.h | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index c7b10ca..c788c5d 100644
--- a/.mailmap
+++ b/.mailmap
@@ -100,6 +100,7 @@ Leonid I Ananiev <leonid.i.ananiev@intel.com>
 Linas Vepstas <linas@austin.ibm.com>
 Linus Lüssing <linus.luessing@c0d3.blue> <linus.luessing@web.de>
 Linus Lüssing <linus.luessing@c0d3.blue> <linus.luessing@ascom.ch>
+Marcin Nowakowski <marcin.nowakowski@mips.com> <marcin.nowakowski@imgtec.com>
 Mark Brown <broonie@sirena.org.uk>
 Martin Kepplinger <martink@posteo.de> <martin.kepplinger@theobroma-systems.com>
 Martin Kepplinger <martink@posteo.de> <martin.kepplinger@ginzinger.com>
diff --git a/arch/mips/generic/kexec.c b/arch/mips/generic/kexec.c
index e9fb735..1ca409f 100644
--- a/arch/mips/generic/kexec.c
+++ b/arch/mips/generic/kexec.c
@@ -1,6 +1,6 @@
 /*
  * Copyright (C) 2016 Imagination Technologies
- * Author: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+ * Author: Marcin Nowakowski <marcin.nowakowski@mips.com>
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms of the GNU General Public License as published by the
diff --git a/arch/mips/kernel/probes-common.h b/arch/mips/kernel/probes-common.h
index dd08e41..d2bf77b 100644
--- a/arch/mips/kernel/probes-common.h
+++ b/arch/mips/kernel/probes-common.h
@@ -1,6 +1,6 @@
 /*
  * Copyright (C) 2016 Imagination Technologies
- * Author: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
+ * Author: Marcin Nowakowski <marcin.nowakowski@mips.com>
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms of the GNU General Public License as published by the
-- 
2.7.4
