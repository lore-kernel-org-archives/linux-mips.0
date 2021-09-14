Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0380C433EF
	for <linux-mips@archiver.kernel.org>; Tue, 14 Sep 2021 14:43:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB42A60F26
	for <linux-mips@archiver.kernel.org>; Tue, 14 Sep 2021 14:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234621AbhINOo5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 14 Sep 2021 10:44:57 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:33139 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235532AbhINOoV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Sep 2021 10:44:21 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id A0E6D580982;
        Tue, 14 Sep 2021 10:42:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 14 Sep 2021 10:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=r
        TrdcideuqAdRBLxltadbqb3QFd2EfjWEM8++AODowE=; b=vzrrWfkb4w2WAhQzG
        uLDXeekhfQZ0s9nZODV/KrLURhywvVzIANt0adM1JDi2vLSWo7mOPptMMTXSovTD
        yCkZqewrQ4iOmkCI0fx/IIN8BXMcTei5RNsUEHoLTAXtG8na7zH6fwL1YVXVhDYW
        nydS0kJrhWqEVZxixVjQCDX4Jd/KUrP7JEYB9HWJp//wvUhR1saVT4GgSNX87cla
        64Fwd1naaTYl3Fubdo8YOoHO1I9C9lKTteWAWDI0ya2FfBgFZlx2tzwgg80Q+O7O
        eVeLu7vVeHNZb2q33nYWNHI5Gkl0+opfWftbNHf7qo/VeRDzUG64CDocVcDDygL+
        zvF6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=rTrdcideuqAdRBLxltadbqb3QFd2EfjWEM8++AODo
        wE=; b=GFcg53tY/jn0t4wgbiR4JH6CdiuAeiZ6iuRoXZhziCo1dQ400m2GKMD5n
        VOIdnmcFbKIa94F3crJ8Fos18/KhXpf3rNLacVnzrrDIUR3SjZjq730RSp9YLwIr
        ntD12rJGbX5n+eYZf/GjHn8pUN3vpR88o13LtQcRRcoUkWV2ptOA3PfW/lylNvmt
        DW1z6WCeOZmEhZKIh8OKp5FQulV2EKn7kL8avr+I9AQIrwoqbRT0GdugdLOWeOOO
        Uw4eQkxXf5UDyWstFwcuguxqRp/W1FtMYuHNRdfJLHU02K8KKy7smsqVh7Yib2Nl
        8W2Wf+FqaQ4Bz47/LEEofL8rqBptQ==
X-ME-Sender: <xms:8bRAYT5vDGYDk4jjbc5U1MplhMhe-0t9mWrHa3TWcELiy9iU8ayzAQ>
    <xme:8bRAYY4tWzg9LyE9mxfMiJh6V7pF04mpgLM0612dzbvcR-p_Jpo64wDeLgaoNRZnw
    eWPvAhmJTfkla_LsyA>
X-ME-Received: <xmr:8bRAYadRCAT_Sctg5_8_IOoGfB9hEdoJlBKdJSqSpplgwUAggk1XTmx1xlUQVQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehieduvdevhfekjeeftddtkeeitefhudekvdeiueeulefgleei
    jeeghedvkeduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:8bRAYUI6vo3iXKCSbFelVmBSU_9Yt9nQX9OinVSNv2V-HHMsOjHFqg>
    <xmx:8bRAYXLecW9w--mzGQZ1Umul0Bq8y6jYeL3V_U3rlGsPqopD1Byr8Q>
    <xmx:8bRAYdy-VC-OCpg1TyjGQ2VvcpMl20QocSnB1hAgPp9dD1LMmFwrow>
    <xmx:8rRAYUHAecQdRSW-P7e-pzaO3wbE2qzR2gaBplIY6f28zxu2tq6LKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 10:42:56 -0400 (EDT)
Message-ID: <0cea856f-d70e-8564-d12d-79100340a973@flygoat.com>
Date:   Tue, 14 Sep 2021 15:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] reset: pistachio: Re-enable driver selection
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2c399e52540536df9c4006e46ef93fbccdde88db.1631610825.git.geert+renesas@glider.be>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <2c399e52540536df9c4006e46ef93fbccdde88db.1631610825.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2021/9/14 10:15, Geert Uytterhoeven 写道:
> After the retirement of MACH_PISTACHIO, the Pistachio Reset Driver is no
> longer auto-enabled when building a kernel for Pistachio systems.
> Worse, the driver cannot be enabled by the user at all (unless
> compile-testing), as the config symbol is invisible.
>
> Fix this partially by making the symbol visible again when compiling for
> MIPS, and dropping the useless default.  The user still has to enable
> the driver manually when building a kernel for Pistachio systems,
> though.
>
> Fixes: 104f942b2832ab13 ("MIPS: Retire MACH_PISTACHIO")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!
> ---
>   drivers/reset/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index be799a5abf8a6edc..b0056ae5d463aedd 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -147,8 +147,8 @@ config RESET_OXNAS
>   	bool
>   
>   config RESET_PISTACHIO
> -	bool "Pistachio Reset Driver" if COMPILE_TEST
> -	default MACH_PISTACHIO
> +	bool "Pistachio Reset Driver"
> +	depends on MIPS || COMPILE_TEST
>   	help
>   	  This enables the reset driver for ImgTec Pistachio SoCs.
>   

