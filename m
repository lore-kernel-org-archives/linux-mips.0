Return-Path: <SRS0=m+3q=4W=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96D0C3F2D7
	for <linux-mips@archiver.kernel.org>; Thu,  5 Mar 2020 17:24:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F98D20870
	for <linux-mips@archiver.kernel.org>; Thu,  5 Mar 2020 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583429042;
	bh=Mc9vkGPDUaDyDV/P8kywreIweeOriVdDe6jvOFFt0pI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=j6ULoQXI++uTVzhuJX6EjgeCYLS8XACgilSMlBXQWwo5aTiIsobDVjzZpJ9hTcmfx
	 nKb8rgVic0Ydl/vIMzJxU6gvr9w2g6/GQd+SBdOhWwNpy6za0SCBv0LHh3MXkI6KqS
	 6YOdmqy3wlH7lD7M193vF4qZa1zFYQykS+HUwmh4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgCERNb (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 5 Mar 2020 12:13:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:38970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726970AbgCERNa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Mar 2020 12:13:30 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BD0E2166E;
        Thu,  5 Mar 2020 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583428410;
        bh=Mc9vkGPDUaDyDV/P8kywreIweeOriVdDe6jvOFFt0pI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WF+mDlne7hBHCooLpVJ/r13CFtlPudKQjfaZRrnQHf4aw6zNoM6OgysjpjlBqWMtN
         SSHk7F/sXVll10AhsskPh8+Ou+maSKVs7hv+ObEIFLQ7Y7Y9LgkO5JawhiZbcbD4B7
         V2yhz4RxDhc5Jcg0HzHieA9zxvwdf5hop2uiiEd8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Paul Burton <paulburton@kernel.org>, ralf@linux-mips.org,
        linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.5 14/67] MIPS: VPE: Fix a double free and a memory leak in 'release_vpe()'
Date:   Thu,  5 Mar 2020 12:12:15 -0500
Message-Id: <20200305171309.29118-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305171309.29118-1-sashal@kernel.org>
References: <20200305171309.29118-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit bef8e2dfceed6daeb6ca3e8d33f9c9d43b926580 ]

Pointer on the memory allocated by 'alloc_progmem()' is stored in
'v->load_addr'. So this is this memory that should be freed by
'release_progmem()'.

'release_progmem()' is only a call to 'kfree()'.

With the current code, there is both a double free and a memory leak.
Fix it by passing the correct pointer to 'release_progmem()'.

Fixes: e01402b115ccc ("More AP / SP bits for the 34K, the Malta bits and things. Still wants")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Paul Burton <paulburton@kernel.org>
Cc: ralf@linux-mips.org
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index 6176b9acba950..d0d832ab3d3b8 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -134,7 +134,7 @@ void release_vpe(struct vpe *v)
 {
 	list_del(&v->list);
 	if (v->load_addr)
-		release_progmem(v);
+		release_progmem(v->load_addr);
 	kfree(v);
 }
 
-- 
2.20.1

