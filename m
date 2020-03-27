Return-Path: <SRS0=bSdX=5M=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7017C43331
	for <linux-mips@archiver.kernel.org>; Fri, 27 Mar 2020 01:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D62E20838
	for <linux-mips@archiver.kernel.org>; Fri, 27 Mar 2020 01:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=flygoat.com header.i=jiaxun.yang@flygoat.com header.b="cMweTh+W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbgC0Bs1 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 26 Mar 2020 21:48:27 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17945 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727509AbgC0Bs1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 21:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585273684;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=hMawNMX/y+Qx6Lqn61+JeVqOJTltoUD6+eyg0bmSQls=;
        b=cMweTh+WfUTBHhYz1sDYK9uicEj7d8loss1XTTOzQREsZilVbJJzSrYvRPBatPPx
        aQE6H614SbEOc1ZQtLZPzQjjz97mHYxlUhJiTW+9iICNMwXhFW7SjQ6L7raqwWBsneA
        kUnZWCSQOJcKrkyCXOy6Vu1lxzD+pN9IuUYb7onU=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585273682244921.2436078220434; Fri, 27 Mar 2020 09:48:02 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200327014749.459241-2-jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] MIPS: Loongson64: Set cluster for cores
Date:   Fri, 27 Mar 2020 09:47:49 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200327014749.459241-1-jiaxun.yang@flygoat.com>
References: <20200326105956.455291-1-jiaxun.yang@flygoat.com>
 <20200327014749.459241-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

cluster is required for cacheinfo to set shared_cpu_map correctly.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

---
v2: cpu_data should be indexed by logical id
---
 arch/mips/loongson64/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e1fe8bbb377d..257cbb3d2656 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -404,6 +404,8 @@ static void __init loongson3_smp_setup(void)
 =09=09=09__cpu_number_map[i] =3D num;
 =09=09=09__cpu_logical_map[num] =3D i;
 =09=09=09set_cpu_possible(num, true);
+=09=09=09/* Loongson processors are always grouped by 4 */
+=09=09=09cpu_set_cluster(&cpu_data[i], i / 4);
 =09=09=09num++;
 =09=09}
 =09=09i++;
--=20
2.26.0.rc2


