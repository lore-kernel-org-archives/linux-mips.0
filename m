Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A93C4332F
	for <linux-mips@archiver.kernel.org>; Fri, 25 Nov 2022 17:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiKYRn1 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Fri, 25 Nov 2022 12:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiKYRn0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Nov 2022 12:43:26 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2728F20356
        for <linux-mips@vger.kernel.org>; Fri, 25 Nov 2022 09:43:25 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h11so539412wrw.13
        for <linux-mips@vger.kernel.org>; Fri, 25 Nov 2022 09:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xf7RaCQazZzlASzChZu0t4KRXcYsxxTjsfdStV47gE=;
        b=whwnFJhoC8ajQJv4+oHrmc/bY7MfgpYMmvxQjUeInBJLDb+oXhXStkWOEwk9xmOALf
         Q0ZvC5EBg6sAiOjFCHiHkJNcNpIScnk92m+2G5yOiNCY1rUqF+3i/osXgzCZ95Hw+ARu
         4voK7xwkCqHJp3TPPax/oSFeKtEXt4hVr6vX8Nw9cSvcc1+vwkySAMIDrjyt9yYj83L0
         eF8znxU2lxyTgdWrhxgJcdzvih9Pm9pS3piTRbWlhgI8KgtjAa3UZ4pI1QhfhqvjT9kx
         V0I5Tm6PP5kXQS45/BLJtXxdqR1nRwNkYmpRBL88fn3NhNmLB85BvGOEAIBN+UT/j7Kl
         YzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xf7RaCQazZzlASzChZu0t4KRXcYsxxTjsfdStV47gE=;
        b=nqtS18UnV9cMss5/4PYwp2b6gwL156gyvo6AdhIEQnbdDyowtoD0RPSMal9s8h20wV
         +wqM3LPFL+gf/NRQaPtwEnGK13Pzo1xA4ZUVKuW2pDfaFatL0azJI/Ut95nea8pFEy2Y
         VJi3M5hLlS1wIV4F4lqFLJVtj6q0picxgGbbsKQGSXSMyBNU+WfHPtnJKfq7BaEM+q5C
         XMR1zypxj8N4LCiah2CNTnYBW212Dnez5X3N3sl8+JMOtz7tRhZon14LuAnn/GXDqXGZ
         LEKAklO6jPVJP8nNmalOvgaQ/IqkR56tc0hABOctFhAtUKk06cuXh/ScPAcqtUsIx0Ui
         I2kw==
X-Gm-Message-State: ANoB5pkRjlo+DJiSG7tq2vQhNsk8HsVOZXgoqs0qFxjXzC+f04UhTv92
        +Ftheey3PRkhuEVVUusSo6bTEQ==
X-Google-Smtp-Source: AA0mqf7jntG2UCb2ks3eV9EtYaiNVa771gwgqLbsAUbe9m7LXOoVSsko52Jvquqqg/RzsyKvAJQdvQ==
X-Received: by 2002:adf:e5c6:0:b0:236:7921:e10e with SMTP id a6-20020adfe5c6000000b002367921e10emr23983413wrn.61.1669398203621;
        Fri, 25 Nov 2022 09:43:23 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id h7-20020a5d4fc7000000b00241c8794d38sm4199285wrw.105.2022.11.25.09.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 09:43:23 -0800 (PST)
Message-ID: <777a0de0-8604-ecb6-f670-88dcdf2e1738@linaro.org>
Date:   Fri, 25 Nov 2022 18:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] MIPS: BCM63xx: Add check for NULL for clk in clk_enable
Content-Language: en-US
To:     Anastasia Belova <abelova@astralinux.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Bizon <mbizon@freebox.fr>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20221125092601.3703-1-abelova@astralinux.ru>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125092601.3703-1-abelova@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 25/11/22 10:26, Anastasia Belova wrote:
> Check clk for NULL before calling clk_enable_unlocked where clk
> is dereferenced. There is such check in other implementations
> of clk_enable.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs.")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>   arch/mips/bcm63xx/clk.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

