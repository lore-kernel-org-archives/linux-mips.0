Return-Path: <SRS0=AeFZ=3M=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E7CC2D0DB
	for <linux-mips@archiver.kernel.org>; Thu, 23 Jan 2020 19:44:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E22C24684
	for <linux-mips@archiver.kernel.org>; Thu, 23 Jan 2020 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579808685;
	bh=cyh9PNM/Qlhq9pI2Pe0V7OH0u1vP+6hlK2MbER1pRpM=;
	h=Date:From:To:CC:CC:CC:Subject:References:In-Reply-To:List-ID:
	 From;
	b=drRv58xX7uuPLkS/KS0ncIKucQWQy3dH3t6/oNiMLNlt0vAg1yaQHHr3aC1VIZODG
	 bIqlDZ6mix3f5pTodpSV5L1AP27YyaYAgzQQ+gLL5ErAFcEO4h1khdhMO2fC7P7z+P
	 14P9GTHWA8aWbZChFKaq5suSgjDSvefaq2Ph2RbA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbgAWTon (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 23 Jan 2020 14:44:43 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44547 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729012AbgAWTon (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jan 2020 14:44:43 -0500
Received: by mail-pf1-f193.google.com with SMTP id 62so2001616pfu.11
        for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2020 11:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=1c5FlYv7vTM5iJSlmFhDjmxBhfr68Nna8PN/XsgW6Gc=;
        b=Anf4OOuflUhY1vS6/Tw0eTwZM+nR5EAlH7iHdaddiPAHFtpTQJqFK4lsRDTmYXu/8f
         gemS5M7JnsnK99ixUVne+lgcW6MT/ocHKWRxWKSO+qkJQsoNTpyXluL9tFEdzpoKLuK2
         txlZ1R6W8VGJmTw8I7lM68QXLk9IHSOAhaOReXX6/iuR1uZa4KT/3EhSg5rl3V6hr+2y
         /iSw/VmI5RAA+mlNLoHYruMFghgzAan4hk/qZfsCTreyuIMQtXTsbq8hS07rmQQxYewF
         UN1I4QpkGZOoyfV74m79hpgqGSAJMFlvGOjO6uY8RyfWJFzcWFh9GgA+kmfnFx7/qNE+
         Td7A==
X-Gm-Message-State: APjAAAXOn/qHF72AxwF41GD7pZmLOWs4bXmD85x9cQQzP9f9SH8sWWZ/
        JnYxpDcUQX3Wt3/OXmKxRrw=
X-Google-Smtp-Source: APXvYqwMO9ruvRpPtz3QSZ1QLLrnWJA3RC8ocLumLDRZK6vKSsTmeMQcxwKRX0MTp65eDJCndKzdLQ==
X-Received: by 2002:a62:6d01:: with SMTP id i1mr8571592pfc.94.1579808682395;
        Thu, 23 Jan 2020 11:44:42 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id a15sm3549925pfh.169.2020.01.23.11.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 11:44:41 -0800 (PST)
Message-ID: <5e29f7a9.1c69fb81.ca3b6.860b@mx.google.com>
Date:   Thu, 23 Jan 2020 11:44:41 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Wang Xuerui <git@xen0n.name>
CC:     linux-mips@vger.kernel.org
CC:     Wang Xuerui <git@xen0n.name>, Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: asm: local: add barriers for Loongson
References:  <20200123040409.18849-1-git@xen0n.name>
In-Reply-To:  <20200123040409.18849-1-git@xen0n.name>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Wang Xuerui wrote:
> Somehow these LL/SC usages are not taken care of, breaking Loongson
> builds. Add the SYNCs appropriately.

Applied to mips-next.

> commit 3e86460ebe23
> https://git.kernel.org/mips/c/3e86460ebe23
> 
> Signed-off-by: Wang Xuerui <git@xen0n.name>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
