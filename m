Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24086C433C1
	for <linux-mips@archiver.kernel.org>; Tue, 23 Mar 2021 08:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7DCF619A5
	for <linux-mips@archiver.kernel.org>; Tue, 23 Mar 2021 08:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCWII5 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 23 Mar 2021 04:08:57 -0400
Received: from protonic.xs4all.nl ([83.163.252.89]:60038 "EHLO
        protonic.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhCWIIi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 04:08:38 -0400
X-Greylist: delayed 516 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Mar 2021 04:08:37 EDT
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
        by sparta.prtnl (Postfix) with ESMTP id D1B4D44A022C;
        Tue, 23 Mar 2021 08:59:59 +0100 (CET)
MIME-Version: 1.0
Date:   Tue, 23 Mar 2021 08:59:59 +0100
From:   robin <robin@protonic.nl>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/17] auxdisplay: ht16k33: Use HT16K33_FB_SIZE in
 ht16k33_initialize()
Reply-To: robin@protonic.nl
In-Reply-To: <20210322144848.1065067-10-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-10-geert@linux-m68k.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <7e5eb8c54d7dd196ea071b7f9c31c2ce@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> Use the existing HT16K33_FB_SIZE definition instead of open-coding the
> same calculation using an hardcoded value.
> While at it, restore reverse Christmas tree variable declaration order.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/auxdisplay/ht16k33.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/auxdisplay/ht16k33.c 
> b/drivers/auxdisplay/ht16k33.c
> index 1e69cc6d21a0dca2..6d39f12054618fa5 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -168,9 +168,9 @@ static void ht16k33_fb_update(struct work_struct 
> *work)
> 
>  static int ht16k33_initialize(struct ht16k33_priv *priv)
>  {
> +	uint8_t data[HT16K33_FB_SIZE];
>  	uint8_t byte;
>  	int err;
> -	uint8_t data[HT16K33_MATRIX_LED_MAX_COLS * 2];
> 
>  	/* Clear RAM (8 * 16 bits) */
>  	memset(data, 0, sizeof(data));

Acked-by: Robin van der Gracht <robin@protonic.nl>
