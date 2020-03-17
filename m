Return-Path: <SRS0=hiBl=5C=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03997C10F29
	for <linux-mips@archiver.kernel.org>; Tue, 17 Mar 2020 09:50:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE0FF206EC
	for <linux-mips@archiver.kernel.org>; Tue, 17 Mar 2020 09:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bKLGfSM9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgCQJuv (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 17 Mar 2020 05:50:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54734 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgCQJuv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Mar 2020 05:50:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id n8so20662914wmc.4
        for <linux-mips@vger.kernel.org>; Tue, 17 Mar 2020 02:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=CfiAQpd8uQoL3iwwwAGqh6gxvyBaIrgMF1i3mX+btOA=;
        b=bKLGfSM9UWMVgvxw9K4+lnLcWmqVr8N9nWD3shrd/QZtInCP8z5IrA4LsnnWcpQTDU
         qP6buHmWIrzh9IVIxla3zk48G3q9HrTis+C/wMKr6qKELE/Bbq3x9M89bEuSBDjvdEyd
         aD2U7OjDYVAA/VdnvZ5FSMaedfaNU+8nWtoS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CfiAQpd8uQoL3iwwwAGqh6gxvyBaIrgMF1i3mX+btOA=;
        b=ou/eC9Mg6Wl3Y4BgqAqFTvc1uJ4i78rEN82Wo1i6OZUWpOz32r0UPF5n2HMmmpiQmf
         TvDGYQohnZlI9qpgUe9krMqaUIQABYt5A3EBGSmejWwbVCWFEIQQOeVl/AohEKZPGhDo
         XkFOJ1gLB5SylwD/9eTqpGGKvpFeLxfkolH5YthszfIcLwc+cFh102oc9i+rp2olyOaL
         2XKxRCMIBHXbK2MUzxjfT+SX/k0S2zsu2qmguZAHfWBv/7mV3kj7ouiAuZhdKfhSR0xl
         VX7j84ffM4Sd4ygj7ge6XGHOIxu1uYTucka2iJhlre6lGy2oVpuQnE+wGTFH4M7YDFeS
         HhaA==
X-Gm-Message-State: ANhLgQ1dOQNK89iOyRTbIVzU4T+TTX4JIu1ev3ovGrXA5J6GMU4zkUVs
        k8b3hJivGVzd1cFEO+h7qmDGZA==
X-Google-Smtp-Source: ADFU+vsvnEQ2euzuGI9HkfkPRYnzpyOc7RRTEavFnN573nqDk6l9mVYBfp2n1KUH8274z5uKVcgfZw==
X-Received: by 2002:a7b:c950:: with SMTP id i16mr4335733wml.97.1584438648582;
        Tue, 17 Mar 2020 02:50:48 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id l18sm3845033wrr.17.2020.03.17.02.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 02:50:47 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v2 1/1] firmware: tee_bnxt: remove unused variable assignment
Date:   Tue, 17 Mar 2020 15:20:37 +0530
Message-Id: <20200317095037.22313-1-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unused variable assignment.

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
Changes from v1:
- Address code review comment from Sergei Shtylyov,
  Correct the commit message.

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

