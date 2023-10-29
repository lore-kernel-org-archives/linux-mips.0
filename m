Return-Path: <linux-mips-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75475C4332F
	for <linux-mips@archiver.kernel.org>; Sun, 29 Oct 2023 13:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjJ2Npx (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 29 Oct 2023 09:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjJ2Npx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Oct 2023 09:45:53 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39082C0;
        Sun, 29 Oct 2023 06:45:51 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 6CA223200914;
        Sun, 29 Oct 2023 09:45:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 29 Oct 2023 09:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1698587149; x=1698673549; bh=8/uARb4oxN4Gs++g1JILLRSCVWyAzodSrqw
        WbaXbY8s=; b=Gld3SN5i04l5n8UtkrfS+FgjkMWKFH1NzDhbuqXKsmkPOdRdgY5
        2V22hkZSRciA895q66nTHvHVNW5Gkmm/uPbofH+pUekMglCzbcZ11J1tF/RyT0hn
        DuDYGgyUyYtY4Bo1d8q4ufBb5nBOJL5G07PeqI91vuv5EWcucg3M1P3WNFuSBbIB
        qUCFRS4rSO48tNMEoG0QkmSI95Gd05hIy+Rv5KmXKnVeGYvWnudGGm4PP3C9Z+QR
        uvYi5ulJH7bDZESdLuUwhHMiS2LKTVF1r2SE/9d/JEucuprIVl5MVQQGtRXNqe0b
        D+wAO8u3wXgxnZh8zdsknpNU1niaIdMeUQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1698587149; x=1698673549; bh=8/uARb4oxN4Gs++g1JILLRSCVWyAzodSrqw
        WbaXbY8s=; b=lhLTxrG0o1Jd0/kK2nlvelO0zKXxzpH5WONs+92iGo/mckA5Mxg
        EglOjTF2z/IpIZGQho9ZTEpYbBcuIydvU6Al0Moek20pxpiNt4O1eiI1MNOMi4aZ
        T1XoS8i/WIvxCOXjCfQZO4O16D5tjkBBzBeXCN5xXDkhz2kZiU0EVlTlnFlpL+ph
        vv0S1UCU/euzs7es1NpEaY2Ko/jLVwMkZR9JvQNEMXhaRJmInPhWxOnoyEZN/boQ
        jrP1lJlVHNver6+oJRTQH1gDOiON9CQly5W0ZmtkWJC31jaBCnbBm53US2oQrzdw
        h2YYOm9tZdOkrECxeeBJJtQ1O4uTwhUkX1A==
X-ME-Sender: <xms:DWI-ZdbXGE6TSSFjfXJwSKpUj6G460W--DasEpBEJnYD5CyS0a3w2Q>
    <xme:DWI-ZUZGvGerMSBJMuZQMdvZL3ObQPTDyjNU0au08DgwCRfeP7FQ1bkLSDc_hb945
    d6AqVZ0BwgyYB8Ckh8>
X-ME-Received: <xmr:DWI-Zf8nNcbfow9Pd4Ys732wX7Hfq5osXbJQ85ZyWIuoyGZXQFDzomo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrleekgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:DWI-ZbqNiGyvY4uGh84NWdMPFoXagUagca29hKf94yeSAspFeJI-ZQ>
    <xmx:DWI-ZYo4NRUawPRRItJPklF5I-E1HAUKKeZCweqAQFFJLGsd1V5MgQ>
    <xmx:DWI-ZRSrkySrsXtnzaNQvFqIBetTjiHcJYCSijWoKi8aDCtQdv1WJg>
    <xmx:DWI-Zf0Mt2jYmkUqMzDxaNz6LOz2b1O2rUzbiuBI2HT0Rlj5IlfZAQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Oct 2023 09:45:48 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Date:   Sun, 29 Oct 2023 02:53:02 +0000
Subject: [PATCH 1/8] MIPS: asm: Move strings to .rodata.str section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231029-mips_debug_ll-v1-1-d7a491e8c278@flygoat.com>
References: <20231029-mips_debug_ll-v1-0-d7a491e8c278@flygoat.com>
In-Reply-To: <20231029-mips_debug_ll-v1-0-d7a491e8c278@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.12.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Well, they are read only.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/asm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
index 2e99450f4228..05a158a8920c 100644
--- a/arch/mips/include/asm/asm.h
+++ b/arch/mips/include/asm/asm.h
@@ -94,7 +94,7 @@ symbol:		.insn
 symbol		=	value
 
 #define TEXT(msg)					\
-		.pushsection .data;			\
+		.pushsection .rodata.str;			\
 8:		.asciiz msg;				\
 		.popsection;
 

-- 
2.34.1

