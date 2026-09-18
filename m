Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7233AA1BB
	for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2026 06:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711593; cv=none; b=eHi2Dy+C0800RDYPf9JGsaFK4JWwZZ4mnjQltz5lEc/MEUCQeTDjI/dKI35ipnggLJ/Fux5I4Ds5oZiyjvq/ZxWYq57vpAERDcps0IagZsv/lns0NYq2SVpUtjit/gyOl+tB2JaPiPFdprM3VX/PmkT79dAwO6TwW7zHGaa0En4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711593; c=relaxed/simple;
	bh=yMT5Ka847gI9FOiFx1uSovYg8I4fF9cFytvgZ776KyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zwd+sVkNrRGXsKQlFiHy3VT5xDfDrgLzkrMl44YfJR1hESPLAjjTDrqVv5+8vpTFj2YuXSzQaOwu4AWJbN3+ewVBF2IROvXghy+qNL6LzUa9brD6vKwUtXX5Uwys6DMAtnrEYF6K6JCuW1XMcfMQvN8mYIxB9NCumQlGmldZkrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngTQXMmd; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngTQXMmd"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39e249c766bso153067a91.0
        for <linux-mips@vger.kernel.org>; Thu, 17 Sep 2026 23:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789711591; x=1790316391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgduph29jG8+ckw/RGuRJPbEcYjtjYvJH62JLP4qV8Q=;
        b=ngTQXMmdgh5b+8aLsBfY4fUGtFestoKiR/YFkyUJUFQ7m6WLQ05ACGWz1NeMFEOerM
         SnQ/t4VGrc2ztYll4BXNlFYZoufJT3bI5PwlnKTpfA1DFB0g2OW/A0xP7Iyfhz9O8LVP
         1oZ3d4FBEClW+xv+XqUeLI+2c01EL5JMDmlhKzOIJx/ASSN9NiWZGMEzcaNDz4tnDEKw
         5EiWqVBz5qog5z/DhFpFOgU5vcR6rHcrtnsgi0mU9PXqEyQsz7xwQxE2v2dMtox984S3
         Pu9Hcz0WF/uO2Ln4fcO5RfuoMLfdqnUN+yurvMZDXjDvqBZHgWrfcvEwVATeJtiL4NlZ
         EBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789711591; x=1790316391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgduph29jG8+ckw/RGuRJPbEcYjtjYvJH62JLP4qV8Q=;
        b=cnP6QX0r0MeyNHcCwcWA4EarJ+mxETULBEqvgpoV8vpp917iX8Wvc3n1U4QvB7jJKH
         Jdgz2fAmLiojThZPATJ+boeLWsFPwjUrye3xy+Ftu62Xe3vwDZB4bY25RnioALHxQvE5
         vBK/Hr3cE6+lSQh32vmpcNHz9DIAAI2AcPBf1JDZiwyRY/66LDrptbyho1UQx+xvia5g
         70IRwN5JYexuC/VC4KNOVerMDoYMOACigUD0dYdkntaquJ4c8tcS//o7EhzK0uT3bSAq
         L5BSioP23ZpscdTWf+U7Qel9FDxLkHY39oGFJkJDwvTdUQ074cMLGdNEXON45tD317Nf
         daKg==
X-Gm-Message-State: AFuF++mZYs4DPsaAL8T1WGl4FfzypXFrV322jteTasHbJSvUnNl7ZHUj
	KH+MVxQh/YIEyzNwMUOzRLY2dnb9xX+kWUdOgOziTR+aIh4L64niJkthj4/GCHu8kP0=
X-Gm-Gg: AYBFou1QyTh0hv7+2EpLacgew8ACjb2sWbiLZittzyvCHM2cdkT5qH4hlL97rDbR3/k
	VEW1+oA87vEnOLu9EGMikaN8Dndzx3EeThUOAqM6P0vwVYdAVz6QXo9z2Wr4HE5IID2v+31/HST
	GvHbGtUvo0cibrowTef+ELe+c5fqGE+/hLAxTfzQgC+ekkDto0c7kYVxdPa6kyg2XhWvkZO7M9A
	hmnDh+XQ1j9zPjWNMDNh514/n72AksmqZpPvn9HRH7PeyCI8RoZQi0cC489ooDiBEYX1/A24eyP
	Roql2gtzAM1gKCI0lTG1cXdLnhZLw9cEfbowU00x0LGwhMX5RFTT3Cp3TEWJ1XksycRLq4qKDaS
	2z8OJ6v4xjUDLScoj3RDjngNPrYVfJNp7VcGt+p4q7p3zE5XE0YLWw2nx436h20E+nvbuC3Ei17
	oBrn8bfGaWhWzGsToNPPNo00glf80iqgD2a8/k65Cq2w2K7nUmeTCeanL/ohI0gXRXRB1YEMLEL
	58kAX3JPHow/7+zQy6qvS9yVlNduakHQ8i2x1PoV5c0aaCjIi3o4hzdzb+pcAwryeMn2r3g2vw9
	QCVPW6aiL1hxYJ83loCcLCuFTkgugs94Bgbijqj2vGFK6S9e5yMPv7XGkRFUzknJ1z421JraLNU
	=
X-Received: by 2002:a17:90b:17cc:b0:39e:135e:130e with SMTP id 98e67ed59e1d1-39e54af6a0emr3334729a91.3.1789711591450;
        Thu, 17 Sep 2026 23:06:31 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce065314sm1923662c88.14.2026.09.17.23.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:06:31 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] MIPS: remove unused <asm/cmp.h> header
Date: Thu, 17 Sep 2026 23:06:22 -0700
Message-ID: <20260918060628.996925-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch/mips/include/asm/cmp.h appears never to have been used by the
kernel. CMP support was removed in commit 7fb6f7b0af67 ("MIPS: Remove
deprecated CONFIG_MIPS_CMP"), but it was left behind. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/mips/include/asm/cmp.h | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 arch/mips/include/asm/cmp.h

diff --git a/arch/mips/include/asm/cmp.h b/arch/mips/include/asm/cmp.h
deleted file mode 100644
index 71e20e6cd38d..000000000000
--- a/arch/mips/include/asm/cmp.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_CMP_H
-#define _ASM_CMP_H
-
-/*
- * Definitions for CMP multitasking on MIPS cores
- */
-struct task_struct;
-
-#endif /*  _ASM_CMP_H */
-- 
2.43.0

