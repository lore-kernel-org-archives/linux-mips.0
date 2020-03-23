Return-Path: <SRS0=Zn1g=5I=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C07C10F26
	for <linux-mips@archiver.kernel.org>; Mon, 23 Mar 2020 07:02:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13F9C20769
	for <linux-mips@archiver.kernel.org>; Mon, 23 Mar 2020 07:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VDtaFZaU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgCWHCz (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 23 Mar 2020 03:02:55 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55556 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbgCWHCz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Mar 2020 03:02:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id 6so13352041wmi.5
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2020 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5jTrjO4QSy5fUBmSLfWHrfzpqSWpoJNJJJo1AqTJhfE=;
        b=VDtaFZaUmPZr8jbxDzrfRDjnl5Dg2m1FlJrzku7TJJmh8Farbm29/l5MlqLy7GiEhW
         86f3P+aU8L6NeTKE7s15nCKzF3cBavJZfXPVg0falO+Z61B6UwrjNLhCI7Vo1ifnWIOQ
         lQ3wXJH5Y7x7gaLAAInH+p/RAPt+szD5urRJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5jTrjO4QSy5fUBmSLfWHrfzpqSWpoJNJJJo1AqTJhfE=;
        b=sdiB+5DPz808gQ1DDfmmtC6YyDYAy/mIiN2EZGe66KvZC7urHMws4ZOgWrKcVSti0F
         jUXyHU/8lnSq89NsaRGxBvYFGPCOmeo9Gq/r0fPyQ43Ulghpx+jgZWYXL+xDvVPAFhOv
         GTESsLoD4LVDsMz7U8dYwGPZveS2AzwvSjSWSYO3+L/eyZUjLeUZeKklSQeENbGr/pDG
         EOc81CiPKrBmsKY3LuPuPzz8hhZl4GvnVRbbANuUVtAVfdbnUIoN8OsGvjBygxRaBXKo
         QbGGcfrHUAlYrG8J1DVH4/LJIDXMvKBAZERUAfjDb3KowvRZXWI288p6eegMoHgcAHx5
         CquA==
X-Gm-Message-State: ANhLgQ3AQ5NHqdLcRajfMryfP3kvHYClLKhMC5Cja1DvEzasJbYLhj+D
        enueYD0wMNb4hY4iR1bi+xW+nDTCXuA=
X-Google-Smtp-Source: ADFU+vt8wlEJzuyTBKieIQvIghcKvOFk9qC+BSzFe8laRmww4Kq84qj6x71Ht8C6r0LiJct+CW+zkA==
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr25954016wmd.16.1584946973457;
        Mon, 23 Mar 2020 00:02:53 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id t2sm8198735wml.30.2020.03.23.00.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 00:02:52 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v2 1/1] firmware: tee_bnxt: remove unused variable assignment
Date:   Mon, 23 Mar 2020 12:32:42 +0530
Message-Id: <20200323070242.16873-1-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unused variable assignment.

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 drivers/firmware/broadcom/tee_bnxt_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
index ed10da5313e8..6fd62657e35f 100644
--- a/drivers/firmware/broadcom/tee_bnxt_fw.c
+++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
@@ -143,8 +143,6 @@ int tee_bnxt_copy_coredump(void *buf, u32 offset, u32 size)
 	prepare_args(TA_CMD_BNXT_COPY_COREDUMP, &arg, param);
 
 	while (rbytes)  {
-		nbytes = rbytes;
-
 		nbytes = min_t(u32, rbytes, param[0].u.memref.size);
 
 		/* Fill additional invoke cmd params */
-- 
2.17.1

